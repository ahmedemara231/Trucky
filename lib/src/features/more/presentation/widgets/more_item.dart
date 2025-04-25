part of '../imports/imports.dart';


class MoreItemWidget extends StatefulWidget {
  final MoreItemModel model;
  final int index;
  const MoreItemWidget({super.key,
    required this.model,
    required this.index,
  });

  @override
  State<MoreItemWidget> createState() => _MoreItemWidgetState();
}

class _MoreItemWidgetState extends State<MoreItemWidget> {
  void _to(Widget screen){
    Go.to(
        BlocProvider.value(
            value: context.read<MoreCubit>(),
            child: screen
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch(widget.index){
          case 0:
            _to(const Profile());

          case 1:
            _to(const AboutUsTermsAndPrivacyScreen(request: MoreRequest.about));

          case 2:
            _to(const AboutUsTermsAndPrivacyScreen(request: MoreRequest.terms));

          case 3:
            _to(const CommonQuestion());

          case 4:
            _to(const AboutUsTermsAndPrivacyScreen(request: MoreRequest.howTruckyWorks));

          case 5:
            _to(const ContactUs());

          case 6:
            _to(const ViewReports());

          case 7:
            Helpers.showChangeLangSheet(context, changeLangType: ChangeLangType.withApiRequest);

          case 8:
            _to(const Setting());
        }
      },
      child: Column(
        spacing: 10.h,
        children: [
          Row(
            children: [
              AppText(widget.model.title, fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.black87,),
              const Spacer(),
              SvgPicture.asset(widget.model.icon, color: Colors.black87)
            ],
          ),
          const AppDivider(),
        ],
      ).paddingSymmetric(vertical: 5.h),
    );
  }
}
