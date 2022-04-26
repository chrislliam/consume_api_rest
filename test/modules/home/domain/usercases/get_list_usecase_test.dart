import 'package:consume_api_rest/modules/home/domain/entities/post_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:consume_api_rest/modules/home/domain/usercases/get_list_usecase.dart';
import 'package:consume_api_rest/modules/home/external/data_source/home_repository_impl.dart';

class DioMock extends Mock implements Dio {}

void main() {
  // ignore: avoid_print
  setUpAll(() => print('Teste de getListUsecase iniciado'));
  // ignore: avoid_print
  tearDownAll(() => print('teste finalizado'));
  final dioMock = DioMock();
  final mockRepository = HomeRepositoryImpl(dio: dioMock);
  final usecase = GetListUseCase(repository: mockRepository);

  group('Teste de lista', () {
    test('Confirmar tipo List', () async {
      when(() => dioMock.get(any())).thenAnswer((invocation) async =>
          Response(data: resultTest, requestOptions: RequestOptions(path: '')));
      var response = await usecase();
      expect(response.runtimeType, equals(List<PostEntity>));
    });
  });
  test('A lista não está vazia', () async {
    when(() => dioMock.get(any())).thenAnswer((invocation) async =>
        Response(data: resultTest, requestOptions: RequestOptions(path: '')));
    var response = await usecase();
    expect(response, isNotEmpty);
  });
  test('Confirmar primeiro título', () async {
    when(() => dioMock.get(any())).thenAnswer((invocation) async =>
        Response(data: resultTest, requestOptions: RequestOptions(path: '')));
    var response = await usecase();
    expect(response.first.title, equals('título 0'));
  });
}

var resultTest = List.generate(
    20,
    (index) => {
          'userId': index,
          'id': index + 2,
          'title': 'titulo $index',
          'body': 'conteudo do post $index'
        });
