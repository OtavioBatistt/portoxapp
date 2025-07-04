import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ServiceFirebaseChecklist {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
  }

  String _formatTime(int seconds) {
    final hours = (seconds ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((seconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');

    return '$hours:$minutes:$secs';
  }

  Future<void> persisteDataFlowTime({
    required String user,
    required String schedule,
    required String flowCode,
    required String flowTime,
    required int elapsedTime,
  }) async {
    try {
      await firestore.collection('flowTime-log').add({
        'user': user,
        'schedule': schedule,
        'flowCode': flowCode,
        'flowTime': flowTime,
        'elapsedTime': _formatTime(elapsedTime),
      });
      // print('Success saving');
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      // print('Failure saving');
    }
  }
}
