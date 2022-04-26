import '../../domain/entities/post_entity.dart';

class PostMapper {
  static PostEntity fromJson(Map<String, dynamic> map) {
    return PostEntity(
        userId: map['userId'],
        id: map['id'],
        title: map['title'],
        body: map['body']);
  }
}
