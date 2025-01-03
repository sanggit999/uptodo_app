import 'package:uptodo_app/data/auth/models/user.dart';
import 'package:uptodo_app/domain/auth/entities/user.dart';

class UserMapper {
  static UserEntity toEntity(UserModel userModel) {
    return UserEntity(
        userId: userModel.userId,
        username: userModel.username,
        image: userModel.image,
    );
  }
}
