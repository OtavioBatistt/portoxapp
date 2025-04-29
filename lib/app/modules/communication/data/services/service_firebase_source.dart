import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ServiceFirebaseSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
  }

  Future<void> persisteDataMessage({
    required String phone,
    required String schedule,
    required String message,
    required DateTime date,
  }) async {
    try {
      await firestore.collection('sms-log').add({
        'phone': phone,
        'schedule': schedule,
        'message': message,
        'date': date.toIso8601String(),
      });
      // print('Success saving');
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      // print('Failure saving');
    }
  }
}
