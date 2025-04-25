part of '../imports/imports.dart';

class CustomizedQuestionAndAnswerWidget extends StatefulWidget {

  final QuestionAndAnswer questionAndAnswer;
  const CustomizedQuestionAndAnswerWidget({super.key,
    required this.questionAndAnswer,
  });

  @override
  State<CustomizedQuestionAndAnswerWidget> createState() => _CustomizedQuestionAndAnswerWidgetState();
}

class _CustomizedQuestionAndAnswerWidgetState extends State<CustomizedQuestionAndAnswerWidget> {
  bool isExpanded = false;

  void _changeExpandedState() => setState(() => isExpanded =!isExpanded);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: context.width,
          decoration: BoxDecoration(
            color: AppColors.fifth,
            borderRadius: BorderRadius.circular(5.r)
          ),
          child: InkWell(
            onTap: _changeExpandedState ,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: context.width /2,
                    child: AppText(
                      widget.questionAndAnswer.question,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ).paddingAll(20),
                  ),
                ),
                if(isExpanded)
                  const Icon(Icons.arrow_drop_up_sharp, color: Colors.white)
                else
                  const Icon(Icons.arrow_drop_down_sharp, color: Colors.white),
              ],
            ),
          ),
        ),

        Visibility(
          visible: isExpanded,
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(5.r)
            ),
            child: AppText(
              widget.questionAndAnswer.answers,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ).paddingAll(20),
          ).animate().fade(duration: 300.milliseconds).scaleY(begin: 0, end: 1, alignment: Alignment.topCenter),
        )
      ],
    ).paddingSymmetric(vertical: 3.h);
  }
}