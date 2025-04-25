part of '../imports/imports.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  Future<void> ensureLogout(BuildContext context)async{
    showModalBottomSheet(
      context: context,
      builder: (context) => const LogoutAndRemoveAccountBottomSheet(sheetType: SheetType.logout)
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => ensureLogout(context),
      child: Container(
        width: context.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.r),
          border: Border.all(color: Colors.red, width: 1)
        ),
        child: AppText(
          LocaleKeys.logOut,
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
          textAlign: TextAlign.center,
        ).paddingSymmetric(vertical: 10.h),
      ).paddingSymmetric(vertical: 10.h),
    );
  }
}