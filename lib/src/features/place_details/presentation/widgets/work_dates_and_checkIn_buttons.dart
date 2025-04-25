part of '../imports/categories_imports.dart';

class WorkDateAndCheckInButtons extends StatelessWidget {
  const WorkDateAndCheckInButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        WorkDateButton(
            buttonTitle: LocaleKeys.workDates,
            times: context.read<DetailsCubit>().detailsState!.data.workTimes
        ),
        BlocListener<DetailsCubit, DetailsState>(
          listener: (context, state) => Helpers.manageBlocConsumer(
            state.baseStatus,
            msg: state.msg,
            actionWhenError: () => MessageUtils.showSimpleToast(msg: state.msg?? '', color: Colors.red),
          ),
          child: BlocSelector<DetailsCubit, DetailsState, BaseStatusWithData<bool>>(
            selector: (state) => state.checkStatus!,
            builder: (context, state) {
              return LoadingButton(
                  loaderColor: AppColors.primaryColor,
                  margin: EdgeInsets.zero,
                  textColor: AppColors.forth,
                  color: Colors.white,
                  borderSide: const BorderSide(color: AppColors.forth),
                  borderRadius: 40.r,
                  width: context.width,
                  height: 30.h,
                  fontWeight: FontWeight.bold,
                  title: state.data?
                  LocaleKeys.quit : LocaleKeys.enter,
                  onTap: () async {
                    log('the check status is ${state.data}'); // true = checked in, false = out
                    await context.read<DetailsCubit>().check(
                        id: context.read<DetailsCubit>().detailsState!.data.id,
                        checkStatus: state.data?
                        CheckStatus.check_out : CheckStatus.check_in
                    );
                  }
              );
            },
          ),
        )
      ],
    );
  }
}
