part of '../imports/imports.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => SignUpCubit(sl<SignUpRepo>()),
          child: const SafeArea(child: _SignUpBody()))
    );
  }
}

class _SignUpBody extends StatefulWidget {
  const _SignUpBody({super.key});

  @override
  State<_SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<_SignUpBody> {
  String phoneNumber = '';

  final SmartAuth smartAuth = SmartAuth.instance;

  Future<void> requestPhoneNumberHint() async {
    log('request phone number hint');
    final res = await smartAuth.requestPhoneNumberHint();
    if (res.hasData) {
      log('has data');
      setState(() => phoneNumber = res.data ?? '');
    } else {
      log('no data');
    }
  }

  Future<void> getSmsWithUserConsentApi() async {
    final res = await smartAuth.getSmsWithUserConsentApi();
    if (res.hasData) {
      final code = res.requireData.code;

      /// The code can be null if the SMS was received but the code was not extracted from it
      if (code == null) return;
      //  Use the code
    } else if (res.isCanceled) {
      // User canceled the dialog
    } else {
      // handle the error
    }
  }

  late FocusNode _focusNode;
  void initFocusNode()async{
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
     requestPhoneNumberHint();
    }
  }

  @override
  void initState() {
    _focusNode = FocusNode();
    initFocusNode();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    context.locale;
    return SingleChildScrollView(
      child: Column(
        spacing: 12.h,
        children: [
          Image.asset(Assets.imagesLoginUpperImage),
          const LoginTexts(),
          Form(
            key: _formKey,
            child: PhoneTextField(
              focusNode: _focusNode,
              onEnterPhone: (phone) => phoneNumber = phone??'',
            ),
          ),
          BlocListener<SignUpCubit, SignUpState>(
            listener: (context, state) async=> await Helpers.manageBlocConsumer(
                state.baseStatus,
                msg: state.msg,
                actionWhenError: ()async{
                  if(state.msg == LocaleKeys.thisAccountIsNotActivatedTheActivationCodeHasBeenSent){
                    Go.to(SendOtp(phone: phoneNumber));
                    await getSmsWithUserConsentApi();
                  }
                },
                actionWhenSuccess: () async{
                  if(!state.model!.user.isActive){
                    log('is check ${state.model?.user.isActive}');
                    context.read<UserCubit>().enableNeedActivation();
                  }
                  Go.to(SendOtp(phone: phoneNumber));
                  await getSmsWithUserConsentApi();
                }),
            child: LoadingButton(
              title: LocaleKeys.signIn,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              onTap: () async => _formKey.currentState!.validate()?
              await context.read<SignUpCubit>().signUp(phoneNumber) : null,
            ),
          ),
          const ChangeLangWidget().paddingTop(context.height / 6),
        ],
      ).defaultAppScreenPadding(),
    );
  }
}