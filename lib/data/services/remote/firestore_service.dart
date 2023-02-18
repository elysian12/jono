import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jono/data/models/profile_model.dart';

class FireStoreService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> createUserProfile(UserProfileModel userProfileModel) async {
    await _firebaseFirestore.collection('users').doc(userProfileModel.uid).set(
          userProfileModel.toMap(),
        );
  }

  Future<void> createHospitalProfile(
      HospitalProfileModel hospitalProfileModel) async {
    await _firebaseFirestore
        .collection('hospitals')
        .doc(hospitalProfileModel.uid)
        .set(
          hospitalProfileModel.toMap(),
        );
  }
}
