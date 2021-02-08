// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStore, Store {
  final _$isLoadingAtom = Atom(name: '_AppStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$fileAtom = Atom(name: '_AppStore.file');

  @override
  String get file {
    _$fileAtom.reportRead();
    return super.file;
  }

  @override
  set file(String value) {
    _$fileAtom.reportWrite(value, super.file, () {
      super.file = value;
    });
  }

  final _$_AppStoreActionController = ActionController(name: '_AppStore');

  @override
  void setImagePath(String path) {
    final _$actionInfo =
        _$_AppStoreActionController.startAction(name: '_AppStore.setImagePath');
    try {
      return super.setImagePath(path);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAllCars(List<Cars> allCars) {
    final _$actionInfo =
        _$_AppStoreActionController.startAction(name: '_AppStore.setAllCars');
    try {
      return super.setAllCars(allCars);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
file: ${file}
    ''';
  }
}
