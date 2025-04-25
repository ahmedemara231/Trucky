part of '../imports/imports.dart';

class ChangeProfile extends StatelessWidget {
  const ChangeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppText(LocaleKeys.changeProfile, fontWeight: FontWeight.bold,),
      ),
      body: BlocProvider(
          create: (context) => ProfileCubit(sl<ProfileRepo>()),
          child: const _ChangeProfileBody()),
    );
  }
}

class _ChangeProfileBody extends StatefulWidget {
  const _ChangeProfileBody({super.key});

  @override
  State<_ChangeProfileBody> createState() => _ChangeProfileBodyState();
}

class _ChangeProfileBodyState extends State<_ChangeProfileBody> {
  File? selectedImage;
  String? newName;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 10.h,
        children: [
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
                    setState(() => selectedImage = image);
                    state.didChange(image);
                  },
                ),
                if (state.hasError)
                  AppText(state.errorText!, color: Colors.red).paddingSymmetric(vertical: 10.h)
              ],
            ),
          ),

          // ProfileImageWidget.edit(onSelectImage: (image) => setState(() => selectedImage = image)),
          // ProfileImageWidget(
          //     profileType: ProfileType.edit,
          //     onSelectImage: (image) => setState(() => selectedImage = image),
          // ),
          TitleWithTextField(
            hintText: UserData.fromJson(jsonDecode(CacheStorage.read('user'))).name??'',
            title: LocaleKeys.name,
            icon: Assets.iconsProfilePersonIcon,
            onEnterTitle: (name) => setState(() => newName = name),
          ),
          BlocListener<ProfileCubit, ProfileState>(
            listener: (context, state) => Helpers.manageBlocConsumer(
              state.baseStatus,
              msg: state.msg,
              actionWhenSuccess: () {
                context.read<UserCubit>().updateUser(state.userData!);
                Navigator.pop(context);
              }
            ),
            child: LoadingButton(
                title: LocaleKeys.saveChanges,
                onTap: () async => _formKey.currentState!.validate()?
                context.read<ProfileCubit>().updateProfile(name: newName, image: selectedImage) :
                null
            ),
          )
        ],
      ).defaultAppScreenPadding(),
    );
  }
}