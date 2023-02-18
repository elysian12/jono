import 'package:firebase_auth/firebase_auth.dart';
import 'package:jono/common/errors/result_error.dart';
import 'package:jono/common/typedefs/typedefs.dart';
import 'package:jono/data/models/profile_model.dart';
import 'package:jono/data/services/remote/firestore_service.dart';
import 'package:multiple_result/multiple_result.dart';

import 'base_auth_repository.dart';

class AuthRepository implements BaseAuthRepository {
  final FirebaseAuth auth;
  final FireStoreService fireStoreService;

  AuthRepository({
    required this.auth,
    required this.fireStoreService,
  });

  @override
  FutureResult<User> loginViaEmail(String email, String password) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = credential.user;

      return Success(user!);
    } on FirebaseAuthException catch (e) {
      return Error(ResultError(
        error: e.message,
        stackTrace: e.stackTrace,
      ));
    }
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }

  @override
  FutureResult<User> signUp(
    String name,
    String email,
    String password,
    bool isHospital,
  ) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!isHospital) {
        await fireStoreService.createUserProfile(UserProfileModel(
          email: email,
          name: name,
          uid: credential.user!.uid,
        ));
      } else {
        await fireStoreService.createHospitalProfile(HospitalProfileModel(
          email: email,
          name: name,
          uid: credential.user!.uid,
        ));
      }

      return Success(credential.user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Error(ResultError(
          error: 'The password provided is too weak.',
          stackTrace: e.stackTrace,
        ));
      } else if (e.code == 'email-already-in-use') {
        return Error(ResultError(
          error: 'The account already exists for that email.',
          stackTrace: e.stackTrace,
        ));
      }
      return Error(ResultError(
        error: e.message,
        stackTrace: e.stackTrace,
      ));
    }
  }
}
