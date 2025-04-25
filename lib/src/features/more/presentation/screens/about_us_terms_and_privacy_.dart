part of '../imports/imports.dart';

class AboutUsTermsAndPrivacyScreen extends StatelessWidget {
  final MoreRequest request;

  const AboutUsTermsAndPrivacyScreen({super.key,
    required this.request,
  });

  String get requestName {
    switch(request){
      case MoreRequest.about:
        return LocaleKeys.about;

      case MoreRequest.terms:
        return LocaleKeys.conditionsAndTerms;

      case MoreRequest.privacy:
      case MoreRequest.howTruckyWorks:
        return LocaleKeys.howTruckyWork;

      // case MoreRequest.howTruckyWorks:
      //   return LocaleKeys.howTruckyWork;

      // default:
      //   return '';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Helpers.setScaffoldBackgroundColor(AppBackgroundColors.mintGreen),
      appBar: CustomAppBar(
        title: AppText(requestName, fontWeight: FontWeight.bold),
      ),
      body: _AboutScreenBody(request: request),
    );
  }
}

class _AboutScreenBody extends StatefulWidget {

  final MoreRequest request;

  const _AboutScreenBody({super.key,
    required this.request,
  });

  @override
  State<_AboutScreenBody> createState() => _AboutScreenBodyState();
}

class _AboutScreenBodyState extends State<_AboutScreenBody> {
  String get requestName {
    switch(widget.request){
      case MoreRequest.about:
        return LocaleKeys.about;

      case MoreRequest.privacy:
        return LocaleKeys.privacyPolicy;

      case MoreRequest.howTruckyWorks:
        return LocaleKeys.howTruckyWork;

      default:
        return '';
    }
  }


  Future<void> get _getMoreData async{
    try {
      _getMoreFromCache;
    } catch (e) {
      _getMoreRemoteData;
    }
  }

  void get _getMoreFromCache {
    final result = AboutTermsAndPrivacyModel.fromJson(
        jsonDecode(CacheStorage.read(widget.request.name))
    );
    context.read<MoreCubit>().fetchMoreDataFromCache(result);
  }

  Future<void> get _getMoreRemoteData async{
    await context.read<MoreCubit>().fetchMoreData(widget.request);
  }

  @override
  void initState() {
    _getMoreData;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AppRefreshIndicator(
      onRefresh: () => _getMoreRemoteData,
      child: BlocBuilder<MoreCubit, MoreState>(
        builder: (context, state) {
          return SizedBox(
            width: double.infinity,
            child: ListView(
              children: [
                SvgPicture.asset(Assets.svgAppFullLogo),
                Align(
                  alignment: Alignment.center,
                  child: AppText(
                      requestName,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp
                  ),
                ),
                BlocBuilder<MoreCubit, MoreState>(
                  builder: (context, state) =>
                  StatusBuilder(
                      status: state.baseStatus,
                      placeHolder: ' ' * 10,
                      builder: (placeHolder, isLoading) =>
                      isLoading? CustomLoading.showLoadingView() :
                      AppText(
                         state.aboutTermsAndPrivacyModel!.data,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                  ),
                ),
              ],
            ).withSeparator(SizedBox(height: 10.h))
                .defaultAppScreenPadding(),
          );
        },
      ),
    );
  }
}