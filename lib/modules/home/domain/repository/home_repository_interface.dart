import '../entities/post_entity.dart';

abstract class IHomeRepository {
  Future<List<PostEntity>> fetchPots();
}
