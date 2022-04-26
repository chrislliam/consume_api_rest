import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/post_entity.dart';
import '../../domain/repository/home_repository_interface.dart';
import '../mapper/post_mapper.dart';

class HomeRepositoryImpl implements IHomeRepository {
  final Dio dio;
  HomeRepositoryImpl({required this.dio});
  @override
  Future<List<PostEntity>> fetchPots() async {
    try {
      var response =
          await dio.get('https://jsonplaceholder.typicode.com/posts');

      return (response.data as List)
          .map((e) => PostMapper.fromJson(e))
          .toList();
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }
}
