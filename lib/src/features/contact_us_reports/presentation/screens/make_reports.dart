part of '../imports/imports.dart';

class MakeReports extends StatelessWidget {
  const MakeReports({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Helpers.setScaffoldBackgroundColor(AppBackgroundColors.mintGreen),
      appBar: CustomAppBar(
        title: AppText(LocaleKeys.reports, fontWeight: FontWeight.bold),
      ),
      body: _ReportsBody(),
    );
  }
}

class _ReportsBody extends StatelessWidget {
  _ReportsBody({super.key});
  SendReportBody body = SendReportBody();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          spacing: 16.h,
          children: [
            TitleWithTextField(
              title: LocaleKeys.complaintTitle,
              icon: Assets.iconsMessageContentIcon,
              hintText: LocaleKeys.complaintTitle,
              onEnterTitle: (title) => body.title = title?? '',
            ),
            TitleWithTextField(
              title: LocaleKeys.complaintText,
              hintText: LocaleKeys.complaintText,
              inputType: TextInputType.multiline,
              onEnterTitle: (title) => body.message = title?? '',
            ),
            SelectImageContainer(onSelectImages: (selectedImages) => body.images = selectedImages),
            BlocListener<ContactReportsCubit, ContactReportsState>(
              listener: (context, state) => Helpers.manageBlocConsumer(
                  state.baseStatus,
                  msg: state.msg,
                  actionWhenSuccess: () => showCustomDialog(
                      context,
                      barrierDismissible: false,
                      duration: const Duration(seconds: 2),
                      actionWhenPop: () => 2.popUntil(),
                      child: const DialogChild()
                  )
              ),
              child: LoadingButton(
                  title: LocaleKeys.send,
                  onTap: () async => _formKey.currentState!.validate()?
                  await context.read<ContactReportsCubit>().sendReport(body) : null
              ),
            ),
          ],
        ).screenPaddingWithWhiteContainer().defaultAppScreenPadding(),
      ),
    );
  }
}