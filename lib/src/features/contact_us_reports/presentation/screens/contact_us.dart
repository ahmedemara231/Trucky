part of '../imports/imports.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Helpers.setScaffoldBackgroundColor(AppBackgroundColors.mintGreen),
      appBar: CustomAppBar(
        title: AppText(LocaleKeys.contactUs, fontWeight: FontWeight.bold),
      ),
      body: BlocProvider(
          create: (context) => ContactReportsCubit(sl<ContactAndReportsRepo>()),
          child: _ContactUsBody()
      )
    );
  }
}

class _ContactUsBody extends StatelessWidget {
   _ContactUsBody({super.key});
   ContactUsBody body = ContactUsBody();

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
              title: LocaleKeys.name,
              hintText: LocaleKeys.name,
              icon: Assets.iconsProfilePersonIcon,
              onEnterTitle: (title) => body.name = title??'',
            ),
            TitleWithTextField(
              inputType: TextInputType.phone,
              title: LocaleKeys.phoneNumber,
              hintText: '${LocaleKeys.phoneNumber} (${LocaleKeys.mandatory})',
              icon: Assets.iconsLoginPhoneLogo,
              onEnterTitle: (title) => body.phoneNumber = title??'',
            ),
            TitleWithTextField(
              title: LocaleKeys.messageContent,
              hintText: LocaleKeys.messageContent,
              icon: Assets.iconsMessageContentIcon,
              onEnterTitle: (title) => body.title = title??'',
            ),
            TitleWithTextField(
              title: LocaleKeys.message,
              hintText: LocaleKeys.message,
              inputType: TextInputType.multiline,
              onEnterTitle: (title) => body.message = title??'',
            ),
            BlocListener<ContactReportsCubit, ContactReportsState>(
              listener: (context, state) => Helpers.manageBlocConsumer(
                  state.baseStatus,
                  msg: state.msg,
                  actionWhenSuccess: () => Navigator.pop(context)
              ),
              child: LoadingButton(
                  title: LocaleKeys.send,
                  onTap: () async => _formKey.currentState!.validate()?
                  await context.read<ContactReportsCubit>().contactUs(body) : null
              ),
            )
          ],
        ).screenPaddingWithWhiteContainer().defaultAppScreenPadding(),
      ),
    );
  }
}
