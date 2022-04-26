import 'package:flutter/material.dart';

import '../../domain/entities/post_entity.dart';
import '../../domain/usercases/get_list_usecase.dart';

abstract class HomeState {}

class Loading extends HomeState {}

class Loaded extends HomeState {
  final List<PostEntity> list;

  Loaded(this.list);
}

class Error extends HomeState {
  final String errorMessage;

  Error(this.errorMessage);
}

class HomeController extends ValueNotifier<HomeState> {
  final GetListUseCase usecase;
  HomeController({required this.usecase}) : super(Loading());

  Future<void> fetchData() async {
    value = Loading();
    try {
      usecase.call().then((list) {
        value = Loaded(list);
      });
    } catch (e) {
      value = Error(e.toString());
    }
  }
}
