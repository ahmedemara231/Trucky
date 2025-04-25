part of '../imports/imports.dart';

enum SheetType {logout, removeAccount}
class LogoutAndRemoveAccountBottomSheet extends StatefulWidget {
  final SheetType sheetType;
  const LogoutAndRemoveAccountBottomSheet({super.key,
    required this.sheetType
  });

  @override
  State<LogoutAndRemoveAccountBottomSheet> createState() => _LogoutAndRemoveAccountBottomSheetState();
}

class _LogoutAndRemoveAccountBottomSheetState extends State<LogoutAndRemoveAccountBottomSheet> {
  Future<void> logout(BuildContext context)async{
    await context.read<UserCubit>().logout();
    SharedData.instance.backToInitial();
    Go.offAll(const SignUp());
  }

  final signUpCubit = SignUpCubit(sl<SignUpRepo>());

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: context.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))
        ),
        child: Column(
          children: [
            const Divider(thickness: 3).paddingSymmetric(vertical: 10.h, horizontal: 130.w),
            AppText(
              widget.sheetType == SheetType.logout?
              LocaleKeys.wantToLogOut : LocaleKeys.wantToDeleteYourAccount,
              color: Colors.red,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            AppText(
              widget.sheetType == SheetType.logout?
              LocaleKeys.areYouSureWantToLogout : LocaleKeys.areYouSureYouWantToDeleteAccount,
              color: Colors.grey,
              fontSize: 14.sp,
            ),
            BlocListener<SignUpCubit, SignUpState>(
              bloc: signUpCubit,
              listener: (context, state) => Helpers.manageBlocConsumer(
                state.baseStatus,
                msg: state.msg,
                actionWhenSuccess: () async => await logout(context),
              ),
              child: LoadingButton(
                title: LocaleKeys.confirm,
                onTap: () async => widget.sheetType == SheetType.logout
                    ? await signUpCubit.logout()
                    : await signUpCubit.deleteAccount(),
                color: Colors.red,
              ),
            ),
            Container(
              width: context.width,
              height: 50.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r),
                  border: Border.all(color: AppColors.primaryColor, width: 1)
              ),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Center(
                  child: AppText(
                      LocaleKeys.cancel,
                      color: AppColors.primaryColor
                  ),
                ),
              ),
            ).paddingSymmetric(
              horizontal: AppMargin.mW10,
              vertical: AppMargin.mH10,
            )
          ],
        ),
      ).paddingSymmetric(vertical: 12.h),
    );
  }
}