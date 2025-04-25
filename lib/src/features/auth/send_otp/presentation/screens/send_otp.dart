part of '../imports/imports.dart';
enum SendingCodeInAuth{fromBtn, resendCode}

class SendOtp extends StatelessWidget {
  final String phone;
  const SendOtp({super.key,
    required this.phone,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appPhase: AppPhase.auth),
      body: BlocProvider(
        create: (context) => OtpCubit(sl<OtpRepo>()),
        child: SafeArea(
          child: _SendOtpBody(phone: phone)
        ),
      ),
    );
  }
}

class _SendOtpBody extends StatefulWidget {
  final String phone;
  const _SendOtpBody({super.key,
    required this.phone,
  });

  @override
  State<_SendOtpBody> createState() => _SendOtpBodyState();
}

class _SendOtpBodyState extends State<_SendOtpBody> {
  final SmartAuth smartAuth = SmartAuth.instance;
  SendingCodeInAuth sendCode = SendingCodeInAuth.fromBtn;

  String otpCode = '';

  late EasyTimerController controller;

  @override
  void initState() {
    controller = EasyTimerController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isTimerEnds = false;

  Future<void> _handleResendCode()async{
    sendCode = SendingCodeInAuth.resendCode;
    await context.read<OtpCubit>().resendCode(widget.phone);
    setState(() => isTimerEnds = false);
    controller.restart();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 12.h,
        children: [
          Image.asset(Assets.imagesOtpScreenUpperImage),
          AppText(LocaleKeys.verificationCode, fontWeight: FontWeight.bold, fontSize: 16.sp,),
          AppText(
            LocaleKeys.pleaseEnterTheVerificationCodeSentToTheMobileNumber,
            color: AppColors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
          Form(
              key: _formKey,
              child: OtpFields(onChanged: (code) => otpCode = code)
          ),
          BlocListener<OtpCubit, OtpState>(
            listener: (context, state) async => await Helpers.manageBlocConsumer(
                state.baseStatus,
                msg: state.msg,
                actionWhenSuccess: sendCode == SendingCodeInAuth.fromBtn?
                () => context.read<UserCubit>().isUserNeedActivation?
                _manageCompleteProfile(context, user: state.model!.userData) :
                _manageHomeNavigation(context, user: state.model!.userData) : null
            ),
            child: Align(
              alignment: Alignment.center,
              child: LoadingButton(
                  title: LocaleKeys.submit,
                  onTap: ()async => _formKey.currentState!.validate()?
                  await _manageSendCode(context) : null
              ),
            ),
          ),

          Column(
            spacing: 10.h,
            children: [
              TextButton(
                onPressed: isTimerEnds? () => _handleResendCode() : null,
                child: AppText(
                    LocaleKeys.doNotReceiveTheCode,
                    color: isTimerEnds? AppColors.primaryColor : null,
                    fontWeight: FontWeight.bold
                ),
              ),
              EasyTimerCount.builder(
                duration: const EasyTime(minutes: 1),
                controller: controller,
                builder: (time) => AppText(
                  time,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
                rankingType: RankingType.descending,
                onTimerStarts: () => null,
                onTimerEnds: () => setState(() => isTimerEnds = true),
              ),
            ],
          )
        ],
      ).defaultAppScreenPadding(),
    );
  }

  Future<void> _manageSendCode(BuildContext context)async{
    sendCode = SendingCodeInAuth.fromBtn;
    await context.read<OtpCubit>().sendOtp(
      body: SendOtpBody(phone: widget.phone, code: otpCode),
    );
  }

  Future<void> _manageCompleteProfile(BuildContext context, {required UserData user})async{
    context.read<UserCubit>().setToken(user.token);
    await Go.off(const CompleteProfile());
  }

  Future<void> _manageHomeNavigation(BuildContext context,{required UserData user})async{
    if(user.isProfileCompleted){
      await context.read<UserCubit>().setUserLoggedIn(user: user, token: user.token);
      Go.offAll(const AppBottomBar());
    }else{
      _manageCompleteProfile(context, user: user);
    }
  }
}