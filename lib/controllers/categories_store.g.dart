// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoriesStore on _CategoriesStoreBase, Store {
  final _$categoriesProductsAtom =
      Atom(name: '_CategoriesStoreBase.categoriesProducts');

  @override
  ObservableList<CategoriesApi>? get categoriesProducts {
    _$categoriesProductsAtom.reportRead();
    return super.categoriesProducts;
  }

  @override
  set categoriesProducts(ObservableList<CategoriesApi>? value) {
    _$categoriesProductsAtom.reportWrite(value, super.categoriesProducts, () {
      super.categoriesProducts = value;
    });
  }

  final _$selectedIndexAtom = Atom(name: '_CategoriesStoreBase.selectedIndex');

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  final _$_CategoriesStoreBaseActionController =
      ActionController(name: '_CategoriesStoreBase');

  @override
  dynamic getCategoriesList() {
    final _$actionInfo = _$_CategoriesStoreBaseActionController.startAction(
        name: '_CategoriesStoreBase.getCategoriesList');
    try {
      return super.getCategoriesList();
    } finally {
      _$_CategoriesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categoriesProducts: ${categoriesProducts},
selectedIndex: ${selectedIndex}
    ''';
  }
}
