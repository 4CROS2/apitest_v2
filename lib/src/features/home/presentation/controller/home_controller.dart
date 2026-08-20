import 'package:apitest/injection_container.dart';
import 'package:apitest/src/core/entities/controller_status.dart';
import 'package:apitest/src/features/home/domain/entity/product_entity.dart';
import 'package:apitest/src/features/home/domain/usecase/home_usecase.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  HomeController({this._status = .idle, this._products = const []})
    : _homeUsecase = sl<HomeUsecase>();

  final HomeUsecase _homeUsecase;

  ControllerStatus _status;
  List<ProductEntity> _products;

  ControllerStatus get status => _status;
  List<ProductEntity> get products => _products;
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<void> fetchData() async {
    try {
      _status = .loading;
      notifyListeners();

      final response = await _homeUsecase.fetchData();

      _status = .success;
      _products = response;
    } catch (e) {
      _status = .error;
      _errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }
}
