part of '../imports/imports.dart';

class ConditionsTerms extends StatefulWidget {
  const ConditionsTerms({super.key});

  @override
  State<ConditionsTerms> createState() => _ConditionsTermsState();
}

class _ConditionsTermsState extends State<ConditionsTerms> {
  bool isAgree = false;

  void changeAgree(bool? value) => setState(() => isAgree = value?? false);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValidationHost<bool>(
            builderWidget: (state) => Column(
              children: [
                ConditionsAndTerms(onChanged: (val) => state.didChange(val)),
                if(state.hasError)
                  AppText(state.errorText!, color: Colors.red)
              ],
            ),
            onSaved: (newValue) {},
            validator: (value) => value == false?
            LocaleKeys.termsAndConditionsMustBeAgreedTo : null,
            initialValue: false
        ),

      ],
    );
  }
}

class ConditionsAndTerms extends StatefulWidget {

  final void Function(bool?)? onChanged;
  const ConditionsAndTerms({super.key,
    required this.onChanged
  });

  @override
  State<ConditionsAndTerms> createState() => _ConditionsAndTermsState();
}

class _ConditionsAndTermsState extends State<ConditionsAndTerms> {
  bool agreement = false;

  void changeVal() => setState(() => agreement = !agreement);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: agreement,
          onChanged: (value) {
            widget.onChanged!(value);
            changeVal();
          },
        ),
        TextButton(
            onPressed: () => Go.to(BlocProvider(
                create: (context) => MoreCubit(sl<MoreRepository>()),
                child: const AboutUsTermsAndPrivacyScreen(request: MoreRequest.terms)
            )),
            child: AppText(
                LocaleKeys.agreeToTheTermsAndConditions,
                fontSize: 14.sp,
                color: AppColors.primaryColor
            )
        ),
      ],
    );
  }
}