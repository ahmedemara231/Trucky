part of '../imports/categories_imports.dart';

class RateNumbersDescriptionAndButtons extends StatelessWidget {
  const RateNumbersDescriptionAndButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: const Column(
        children: [
          PlaceSocialMedia(),
          RatesStatusAndNumbersCollection(),
          Description(),
          WorkDateAndCheckInButtons()
        ],
      ).paddingAll(10)
    );
  }
}
