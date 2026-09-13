import 'package:flutter/material.dart';

class HomeState {
  final List<Map<String, dynamic>> listProduct;
  final String? errorMessage;

  const HomeState({this.listProduct = const [], this.errorMessage});

  HomeState copyWith({
    List<Map<String, dynamic>>? listProduct,
    String? errorMessage,
  }) {
    return HomeState(
      listProduct: listProduct ?? this.listProduct,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class HomeLogic extends ChangeNotifier {
  final List<Map<String, dynamic>> products = [];

  HomeState _homeState = const HomeState();
  HomeState get homeState => _homeState;

  Future<void> getData() async {
    final List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(
      products,
    );
    try {
      await Future.delayed(const Duration(seconds: 2));
      _homeState = homeState.copyWith(listProduct: list);
      notifyListeners();
    } catch (e) {
      _homeState = homeState.copyWith(errorMessage: e.toString());
      notifyListeners();
    }
  }
}
