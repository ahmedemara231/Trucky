part of '../imports/presentaion_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        sl<HomeRepository>(),
      )..fetchHomeData(),
      child: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {

  // ValueNotifier<String> location = ValueNotifier('');
  // Future<void> getLocation()async{
  //   final Map<String, dynamic> locationJson = jsonDecode(CacheStorage.read(CacheConstants.lastLocation));
  //   LocationModel locationModel = LocationModel.fromJson(locationJson);
  //   Position position = (await Geolocator.getCurrentPosition());
  //   List<Placemark> locations = await placemarkFromCoordinates(
  //       position.latitude,
  //       position.longitude
  //   );
  //   location.value = locations[0].street!;
  //   location.value = locationModel.street!;
  //   log('finish ${location.value}');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarHeight: 90.h,
        otherPhase: OtherPhase.main,
        flexibleSpace: ListView(
          children: [
            Row(
              spacing: 10.w,
              children: [
                AppText(LocaleKeys.hello, color: Colors.white),
                SvgPicture.asset(Assets.iconsWavingHand)
              ],
            ),
            Row(
              spacing: 10.w,
              children: [
                SvgPicture.asset(Assets.iconsLocationMarker, color: Colors.white),
                Expanded(
                  child: InkWell(
                    onTap: () async{
                      final result = await Go.to(
                          const LocationScreenWithNamed.detectCurrentUserLocation(method: NavigationMethod.pop)
                      );
                      if(result == 'locationChanged'){
                        if(context.mounted){
                          context.read<HomeCubit>().fetchHomeData();
                        }
                      }
                      // await getLocation();
                    },
                    child: BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) => AppText(
                        maxLines: 3,
                        fontSize: 14.sp,
                        state.homeDataModel?.locationDataForHome.mapDesc?? LocaleKeys.pleaseEnterYourLocation,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ).withSeparator(SizedBox(height: 12.h,)),
        actions: const [
          SearchIcon()
        ],
      ),
      body: AppRefreshIndicator(
          onRefresh: () => context.read<HomeCubit>().fetchHomeData(),
          child: const HomeBody()
      ),
    );
  }
}
