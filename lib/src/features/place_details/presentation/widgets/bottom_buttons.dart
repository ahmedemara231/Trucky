part of '../imports/categories_imports.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  void visitPlaceBottomSheet(BuildContext context){
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder: (ctx) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
        ),
        child: BlocProvider.value(
            value: context.read<DetailsCubit>(),
            child: const _RateSheetBody()
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 4,
            child: LoadingButton(
                title: LocaleKeys.iVisitedTheRestaurant,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                onTap: () async => visitPlaceBottomSheet(context)
            )
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () => Helpers.shareProvider('https://trucky-sa.com/providers/${context.read<DetailsCubit>().state.providerDetailsModel?.data.id??0}'),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.green[50],
                  border: Border.all(color: AppColors.primaryColor, width: .4),
                  borderRadius: BorderRadius.circular(40.r)
              ),
              child: const Icon(Icons.share, color: AppColors.primaryColor).paddingAll(8),
            ),
          ),
        )
      ],
    ).paddingAll(10);
  }
}

class _RateSheetBody extends StatefulWidget {

  const _RateSheetBody({super.key});

  @override
  State<_RateSheetBody> createState() => _RateSheetBodyState();
}

class _RateSheetBodyState extends State<_RateSheetBody> {
  final _focusNode= FocusNode();

  double rate = 1.0;

  String comment = '';

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: IntrinsicHeight(
        child: SingleChildScrollView(
          child: Column(
            spacing: 10.h,
            children: [
              const SheetDivider(),
              AppText(LocaleKeys.placeRate, fontWeight: FontWeight.bold, fontSize: 18.sp, color: Colors.black87,),
              AppText(LocaleKeys.yourEvaluationMattersToUs, color: Colors.grey, fontSize: 12.sp),
              RatingBar.builder(
                itemPadding: EdgeInsets.symmetric(horizontal: 3.w),
                initialRating: 1,
                itemCount: 5,
                unratedColor: Colors.grey[300],
                minRating: 0.5,
                itemBuilder: (context, index) => SvgPicture.asset(
                  Assets.iconsRatingStar,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) => rate = rating,
              ),
              TitleWithTextField(
                title: LocaleKeys.writeYourFeedback,
                focusNode: _focusNode,
                hintText: LocaleKeys.pleaseWriteYourFeedback,
                inputType: TextInputType.multiline,
                onEnterTitle: (title) => comment = title?? '',
              ),
              BlocListener<DetailsCubit, DetailsState>(
                listener: (context, state) => Helpers.manageBlocConsumer(
                    state.baseStatus,
                    msg: state.msg,
                    actionWhenSuccess: () {
                      MessageUtils.showSimpleToast(msg: state.msg);
                      Navigator.pop(context);
                    }
                ),
                child: LoadingButton(
                  title: LocaleKeys.rateNow,
                  onTap: () async => _formKey.currentState!.validate()? await context.read<DetailsCubit>().addRate(
                      AddRateBody(
                          providerId: context.read<DetailsCubit>().state.providerDetailsModel?.data.id??0,
                          rate: rate.toString(),
                          comment: comment
                      )
                  ) : null,
                ),
              ),
            ],
          ).padding(
              EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                right: AppPadding.pW8,
                left: AppPadding.pW8,
              )
          ),
        ),
      ),
    );
  }
}

