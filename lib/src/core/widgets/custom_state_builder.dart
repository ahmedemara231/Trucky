import 'package:flutter/material.dart';
import 'package:flutter_base/src/core/shared/base_state.dart';
import 'package:flutter_base/src/core/widgets/app_text.dart';
import 'package:flutter_base/src/core/widgets/custom_loading.dart';

// enum LoadingType {simpleLoading, fullScreen, customLoading}

class CustomStateBuilder extends StatefulWidget {
  final BaseStatus baseStatus;
  // final LoadingType? loadingType;
  final Widget successWidget;
  final Widget? customErrorWidget;
  final Widget? customLoadingWidget;
  final void Function()? actionOnLoading;
  final void Function()? actionOnSuccess;
  final void Function()? actionOnError;

  const CustomStateBuilder({super.key,
    required this.baseStatus,
    // this.loadingType = LoadingType.simpleLoading,
    this.customLoadingWidget,
    required this.successWidget,
    this.customErrorWidget,
    this.actionOnLoading,
    this.actionOnSuccess,
    this.actionOnError
  });

  @override
  State<CustomStateBuilder> createState() => _CustomStateBuilderState();
}

class _CustomStateBuilderState extends State<CustomStateBuilder> {

  late Widget _view;

  void makeSuccessViewAndAction(){
    widget.actionOnSuccess?? ();
    setState(() =>  _view = widget.successWidget);
  }

  void makeErrorViewAndAction(){
    widget.actionOnError?? ();
    setState(() =>  _view = widget.customErrorWidget?? const AppText('error'));
  }

  void makeLoadingViewAndAction(){
    widget.actionOnLoading?? ();
    setState(() =>  _view = widget.customLoadingWidget?? CustomLoading.showLoadingView());
  }

  void checkCurrentState(){
    switch(widget.baseStatus){
      case BaseStatus.success:
        makeSuccessViewAndAction();
        break;

      case BaseStatus.error:
        makeErrorViewAndAction();
        break;

      case BaseStatus.initial:
      case BaseStatus.loading:
        makeLoadingViewAndAction();
        break;
    }
  }

  @override
  void initState() {
    checkCurrentState();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomStateBuilder oldWidget) {
    checkCurrentState();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return _view;
  }
}