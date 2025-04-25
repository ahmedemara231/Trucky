part of '../imports/categories_imports.dart';

class RatesStatusAndNumbersCollection extends StatelessWidget {
  const RatesStatusAndNumbersCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RatesStatusAndNumbers(
            child: SecondChild.rate,
            title: LocaleKeys.rates,
            rate: context
                .read<DetailsCubit>()
                .detailsState
                ?.data
                .rateAvg
                .toInt()),
        RatesStatusAndNumbers(
          child: SecondChild.text,
          title: LocaleKeys.restaurantState,
          value: context.read<DetailsCubit>().detailsState?.data.statusTitle,
        ),
        if (context.read<DetailsCubit>().detailsState?.data.storeMobile != null)
          InkWell(
              onTap: () => LauncherHelper.callPhone(
                  phone: context
                      .read<DetailsCubit>()
                      .detailsState
                      ?.data
                      .storeMobile
                      .toString()),
              child: RatesStatusAndNumbers(
                  child: SecondChild.text,
                  title: LocaleKeys.phoneNumber,
                  value: context
                      .read<DetailsCubit>()
                      .detailsState
                      ?.data
                      .storeMobile
                      .toString())),
        if (context.read<DetailsCubit>().detailsState?.data.storeWhatsapp !=
            null)
          InkWell(
              onTap: () => LauncherHelper.launchWhatsApp(context
                  .read<DetailsCubit>()
                  .detailsState!
                  .data
                  .storeWhatsapp
                  .toString()),
              child: RatesStatusAndNumbers(
                child: SecondChild.text,
                title: LocaleKeys.whatsappNumber,
                value: context
                    .read<DetailsCubit>()
                    .detailsState
                    ?.data
                    .storeWhatsapp
                    .toString(),
              )),
      ],
    );
  }
}
