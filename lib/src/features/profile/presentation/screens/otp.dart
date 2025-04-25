part of '../imports/imports.dart';

enum ApiRequest{toOldPhone, toNewPhone, verifyOldPhone, verifyNewPhone}
enum ActionType{goForward, goBack, nothing}
enum SendingCodeInEditPhone{fromBtn, resendCode}

class SendOtpToUpdatePhone extends StatelessWidget {
  final String phone;
  final ApiRequest apiRequest;

  const SendOtpToUpdatePhone({super.key,
    required this.phone,
    required this.apiRequest,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appPhase: AppPhase.auth),
      body: SafeArea(
          child: BlocProvider(
              create: (context) => ProfileCubit(sl<ProfileRepo>()),
              child: _SendOtpBody(phone: phone, apiRequest: apiRequest)
          )
      ),
    );
  }
}

class _SendOtpBody extends StatefulWidget {
  final String phone;
  ApiRequest apiRequest;

  _SendOtpBody({super.key,
    required this.phone,
    required this.apiRequest,
  });

  @override
  State<_SendOtpBody> createState() => _SendOtpBodyState();
}

class _SendOtpBodyState extends State<_SendOtpBody> {
  final SmartAuth smartAuth = SmartAuth.instance;

  String otpCode = '';
  SendingCodeInEditPhone sendCode = SendingCodeInEditPhone.fromBtn;

  Future<void> _handleSendingCode()async{
    switch(widget.apiRequest){
      case ApiRequest.toOldPhone:
        await context.read<ProfileCubit>().sendCodeToOldPhone(widget.phone);
        break;

      default:
        await context.read<ProfileCubit>().sendCodeToNewPhone(widget.phone);
    }
  }

  late EasyTimerController controller;

  @override
  void initState() {
    _handleSendingCode();
    controller = EasyTimerController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  ActionType _manageNavigation(){
    switch(widget.apiRequest){
      case ApiRequest.toNewPhone:
      case ApiRequest.toOldPhone:
        return ActionType.nothing;

      case ApiRequest.verifyNewPhone:
        return ActionType.goBack;

      default:
        return ActionType.goForward;
    }
  }

  Future<void> _handleResendCode()async{
    sendCode = SendingCodeInEditPhone.resendCode;
    await _handleSendingCode();
    setState(() => isTimerEnds = false);
    controller.restart();
  }

  Future<void> _handleVerifyingPhone()async{
    sendCode = SendingCodeInEditPhone.fromBtn;
    switch(widget.apiRequest){
      case ApiRequest.toOldPhone:
        widget.apiRequest = ApiRequest.verifyOldPhone;
        await context.read<ProfileCubit>().verifyOldPhone(phone: widget.phone, code: otpCode);

      default:
        widget.apiRequest = ApiRequest.verifyNewPhone;
        await context.read<ProfileCubit>().verifyNewPhone(phone: widget.phone, code: otpCode);
    }
  }

  bool isTimerEnds = false;
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
          OtpFields(onChanged: (code) => otpCode = code),
          BlocListener<ProfileCubit, ProfileState>(
            listener: (context, state) => Helpers.manageBlocConsumer(
                state.baseStatus,
                msg: state.msg,
                actionWhenSuccess: sendCode == SendingCodeInEditPhone.fromBtn?
                _manageNavigation() == ActionType.goBack? () => 4.popUntil() :
                _manageNavigation() == ActionType.goForward? () => Go.to(
                        BlocProvider.value(
                            value: context.read<ProfileCubit>(),
                            child: const ChangePhone()
                        )) : null : null
            ),
            child: Align(
              alignment: Alignment.center,
              child: LoadingButton(
                  title: LocaleKeys.submit,
                  onTap: ()async => await _handleVerifyingPhone()
              ),
            ),
          ),
          Column(
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
                  controller: controller,
                  duration: const EasyTime(minutes: 1),
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
}