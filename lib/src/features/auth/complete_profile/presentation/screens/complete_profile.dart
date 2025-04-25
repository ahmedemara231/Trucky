part of '../imports/imports.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backFun: () {
          context.read<UserCubit>().cleanUserData();
          Navigator.pop(context);
        },
        appPhase: AppPhase.auth,
        title: AppText(
            LocaleKeys.newRegisteration,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
      ),
      body: BlocProvider(
        create: (context) => CompleteProfileCubit(sl<CompleteProfileRepo>()),
        child: const _CompleteProfileBody(),
      ).defaultAppScreenPadding(),
    );
  }
}


class _CompleteProfileBody extends StatefulWidget {
  const _CompleteProfileBody({super.key});

  @override
  State<_CompleteProfileBody> createState() => _CompleteProfileBodyState();
}

class _CompleteProfileBodyState extends State<_CompleteProfileBody> {
  File? profileImage;
  String? userName;

  final GlobalKey<FormState> _conditionsTermsFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _conditionsTermsFormKey,
        child: Column(
          children: [
            const UpperTexts(),
            ValidationHost<File?>(
              initialValue: null,
              onSaved: (imageFile) {},
              validator: (imageFile) {
                if (imageFile == null) {
                  return LocaleKeys.pleaseSelectTheProfileImage;
                }
                return null;
              },
              builderWidget: (state) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileImageWidget.edit(
                    onSelectImage: (File? image) {
                      setState(() => profileImage = image);
                      state.didChange(image);
                    },
                  ),
                  if (state.hasError)
                    AppText(state.errorText!, color: Colors.red).paddingSymmetric(vertical: 10.h)
                ],
              ),
            ),

            // ProfileImageWidget.edit(onSelectImage: (image) => setState(() => profileImage = image)),
            // ProfileImageWidget(
            //   profileType: ProfileType.edit,
            //   onSelectImage: (image) => setState(() => profileImage = image),
            // ),
            TitleWithTextField(
              hintText: LocaleKeys.name,
              title: LocaleKeys.name,
              icon: Assets.iconsProfilePersonIcon,
              onEnterTitle: (name) => setState(() => userName = name),
            ),
            const ConditionsTerms(),
            BlocListener<CompleteProfileCubit, CompleteProfileState>(
              listener: (context, state) async =>
              await Helpers.manageBlocConsumer(
                state.baseStatus,
                msg: state.msg,
                actionWhenSuccess: () => _manageCompleteProfileSuccess(context, user: state.user!.userData)
              ),
              child: LoadingButton(
                title: LocaleKeys.signUp,
                onTap: () async {
                  if (_conditionsTermsFormKey.currentState?.validate() ?? false) {
                    await _completeProfileEvent(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _completeProfileEvent(BuildContext context)async{
    await context.read<CompleteProfileCubit>().completeProfile(
      CompleteProfileRequest(
        body: RequestBody(
          name: userName,
          image: profileImage,
        ),
      ),
    );
  }

  Future<void> _manageCompleteProfileSuccess(BuildContext context, {required UserData user})async{
    await context.read<UserCubit>().setUserLoggedIn(user: user, token: user.token);
    Go.offAll(
        const LocationScreenWithNamed.detectCurrentUserLocation(method: NavigationMethod.push)
    );
  }
}