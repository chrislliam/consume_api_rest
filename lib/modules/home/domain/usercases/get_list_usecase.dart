import '../entities/post_entity.dart';
import '../repository/home_repository_interface.dart';

class GetListUseCase {
  final IHomeRepository repository;
  GetListUseCase({required this.repository});

  Future<List<PostEntity>> call() async {
    return await repository.fetchPots();
  }
}
