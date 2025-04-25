import 'package:flutter/material.dart';

extension Separator on Widget{
  Widget withSeparator(Widget separator){
    if (this is Column) {
      return _handleColumnCase(separator);
    }else if(this is ListView){
      return _handleListViewCase(separator);
    }
    else if (this is Row) {
      return _handleRowCase(separator);
    }

    return this;
  }

  Widget _handleColumnCase(Widget separator){
    final column = this as Column;
    final children = List<Widget>.from(column.children);
    final separatedChildren = <Widget>[];

    for (int i = 0; i < children.length; i++) {
      separatedChildren.add(children[i]);
      if (i < children.length - 1) {
        separatedChildren.add(separator);
      }
    }

    return Column(
      children: separatedChildren,
    );
  }

  Widget _handleListViewCase(Widget separator){
    final listView = this as ListView;
    final SliverChildListDelegate delegate = listView.childrenDelegate as SliverChildListDelegate;
    final List<Widget> children = List<Widget>.from(delegate.children);
    final List<Widget> separatedChildren = <Widget>[];

    for (int i = 0; i < children.length; i++) {
      separatedChildren.add(children[i]);
      if (i < children.length - 1) {
        separatedChildren.add(separator);
      }
    }

    return ListView(
      children: separatedChildren,
    );
  }

  Widget _handleRowCase(Widget separator){
    final row = this as Row;
    final children = List<Widget>.from(row.children);
    final separatedChildren = <Widget>[];

    for (int i = 0; i < children.length; i++) {
      separatedChildren.add(children[i]);
      if (i < children.length - 1) {
        separatedChildren.add(separator);
      }
    }

    return Row(
      children: separatedChildren,
    );
  }
}