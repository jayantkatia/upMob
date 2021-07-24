import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class InheritedDatabase extends InheritedWidget {
  final Database database;
  InheritedDatabase({required Widget child, required this.database}) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static InheritedDatabase of(BuildContext context) {
    final InheritedDatabase? result = context.dependOnInheritedWidgetOfExactType<InheritedDatabase>();
    assert(result != null, 'No InheritedDatabase found in context');
    return result!;
  }
}
