import 'package:firebase_auth/firebase_auth.dart';
import 'package:jono/common/typedefs/typedefs.dart';

abstract class BaseAuthRepository {
  FutureResult<User> loginViaEmail(String email, String password);
  FutureResult<User> signUp(
      String name, String email, String password, bool isUser);
  Future<void> signOut();
}
