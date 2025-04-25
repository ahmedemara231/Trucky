part of '../imports/imports.dart';

class PhoneTextField extends StatefulWidget {

  final FocusNode focusNode;
  Function(String? phone) onEnterPhone;
  PhoneTextField({super.key,
    required this.onEnterPhone,
    required this.focusNode,
  });

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {

  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      autoFocus: true,
      focusNode: widget.focusNode,
      upperTitle: LocaleKeys.phoneNumber,
      controller: controller,
      title: LocaleKeys.phoneNumber,
      onChanged: (phoneNumber) => widget.onEnterPhone(phoneNumber),
      prefixIcon: SvgPicture.asset(Assets.iconsLoginPhoneLogo).paddingAll(16.r),
      validator: Validators.validatePhone,
      inputType: TextInputType.phone,
    );
  }
}
