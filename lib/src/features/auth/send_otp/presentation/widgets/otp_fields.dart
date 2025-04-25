part of '../imports/imports.dart';

class OtpFields extends StatelessWidget {
  OtpFields({super.key, required this.onChanged});
  void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: context.locale == const Locale('ar')?
      TextDirection.ltr : TextDirection.rtl,
      child: Pinput(
        defaultPinTheme: PinTheme(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(.3),
              borderRadius: BorderRadius.circular(10.r),
            )
        ),
        submittedPinTheme: PinTheme(
            width: 60.w,
            height: 60.h,
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                    color: AppColors.primaryColor
                )
            )
        ),
        focusedPinTheme: PinTheme(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                    color: AppColors.primaryColor
                )
            )
        ),
        errorTextStyle: TextStyle(
          fontFamily: ConstantManager.fontFamily,
          fontSize: 12.sp,
          color: Colors.red,
        ),
        onChanged: (value) => onChanged(value),
        validator: (code) => code!.length < 4?
        LocaleKeys.pleaseFillCodeFields : null,
        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
        showCursor: true,
        onCompleted: (pin) => log(pin),
        keyboardType: TextInputType.phone,
        obscureText: false,
        onSubmitted: (value) => log(value.toString()),
        onTapOutside: (event) => context.hideKeyboard(),
        pinAnimationType: PinAnimationType.scale,
      ),
    );
  }
}
