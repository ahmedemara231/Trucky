part of '../imports/imports.dart';

class ChangePhone extends StatelessWidget {
  const ChangePhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppText(LocaleKeys.changePhone, fontWeight: FontWeight.bold,),
      ),
      body: _ChangePhoneBody(),
    );
  }
}

class _ChangePhoneBody extends StatefulWidget {
  @override
  State<_ChangePhoneBody> createState() => _ChangePhoneBodyState();
}

class _ChangePhoneBodyState extends State<_ChangePhoneBody> {
  String? newPhone;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        const ChangePhoneTexts(),
        TitleWithTextField(
          hintText: LocaleKeys.phoneNumber,
          title: LocaleKeys.phoneNumber,
          icon: Assets.iconsLoginPhoneLogo,
          onEnterTitle: (phone) => setState(() => newPhone = phone),
        ),
        BlocListener<ProfileCubit, ProfileState>(
          listener: (context, state) => Helpers.manageBlocConsumer(
              state.baseStatus,
              msg: state.msg,
              actionWhenSuccess: () => Go.to(SendOtpToUpdatePhone(
                  phone: newPhone??'',
                  apiRequest: ApiRequest.toNewPhone
              ))
          ),
          child: LoadingButton(
              title: LocaleKeys.confirm,
              onTap: () async => context.read<ProfileCubit>().sendCodeToNewPhone(
                      newPhone ?? ''
                  )
          ),
        )
      ],
    ).defaultAppScreenPadding();
  }
}