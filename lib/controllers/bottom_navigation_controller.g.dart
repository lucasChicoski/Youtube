// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_navigation_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BottomNavigationController on BottomNavigationControllerBase, Store {
  final _$indexAtom = Atom(name: 'BottomNavigationControllerBase.index');

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$researchAtom = Atom(name: 'BottomNavigationControllerBase.research');

  @override
  String get research {
    _$researchAtom.reportRead();
    return super.research;
  }

  @override
  set research(String value) {
    _$researchAtom.reportWrite(value, super.research, () {
      super.research = value;
    });
  }

  @override
  String toString() {
    return '''
index: ${index},
research: ${research}
    ''';
  }
}
