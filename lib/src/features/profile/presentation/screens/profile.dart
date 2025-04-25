part of '../imports/imports.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Helpers.setScaffoldBackgroundColor(AppBackgroundColors.mintGreen),
      appBar: CustomAppBar(
        title: AppText(LocaleKeys.profile, fontWeight: FontWeight.bold,),
      ),
      body: BlocProvider(
          create: (context) => ProfileCubit(sl<ProfileRepo>()),
          child: const _ProfileBody()),
    );
  }
}

class _ProfileBody extends StatefulWidget {
  const _ProfileBody({super.key});

  @override
  State<_ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<_ProfileBody> {


  Future<void> _fetchProfileData(BuildContext context)async {
    context.read<ProfileCubit>().getProfile();
  }

  Future<void> get _profileDataFromCache async{
    UserData user = UserData.fromJson(jsonDecode(CacheStorage.read('user')));
    context.read<ProfileCubit>().putProfileDataFromCache(user);
  }

  Future<void> get _profileData async{
    try{
      _profileDataFromCache;
    }catch(e){
      _fetchProfileData(context);
    }
  }

  @override
  void initState() {
    // _fetchProfileData(context);
    _profileData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) => AppRefreshIndicator(
        onRefresh: () => _fetchProfileData(context),
        child: StatusBuilder(
          status: state.baseStatus,
          placeHolder: ' ' * 10,
          builder: (placeHolder, isLoading) => isLoading? CustomLoading.showLoadingView() : ListView(
          children: [
            Align(
              alignment: Alignment.center,
              child: ProfileImageWidget.view(
                profileImageUrl: state.profileModel!.image,
              ),
              // child: ProfileImageWidget(
              //   imageType: ImageType.network,
              //   profileImageUrl: state.profileModel!.image,
              // ),
            ),
            TitleWithTextField(
                hintText: state.profileModel?.name.toString()?? LocaleKeys.notExist,
                readOnly: true,
                title: LocaleKeys.name,
                icon: Assets.iconsProfilePersonIcon,
                onEnterTitle: (title) {}
            ),
            TitleWithTextField(
                hintText: state.profileModel!.phone.toString(),
                readOnly: true,
                title: LocaleKeys.phoneNumber,
                icon: Assets.iconsLoginPhoneLogo,
                onEnterTitle: (title) {}
            ),],
          ).withSeparator(SizedBox(height: 16.h)),
        ).screenPaddingWithWhiteContainer(),
      )
    ).defaultAppScreenPadding();
  }
}