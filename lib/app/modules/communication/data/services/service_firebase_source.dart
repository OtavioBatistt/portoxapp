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

  Future<void> saveOrUpdateDriverInfo({
    required String driverName,
    required String driverLicense,
    required String phone,
  }) async {
    try {
      final querySnapshot = await firestore
          .collection('drivers-info')
          .where('driverName', isEqualTo: driverName)
          .where('driverLicense', isEqualTo: driverLicense)
          .limit(1)
          .get();

      final now = DateTime.now().toIso8601String();

      if (querySnapshot.docs.isNotEmpty) {
        // Documento já existe – atualizar telefone e data
        final docId = querySnapshot.docs.first.id;
        await firestore.collection('drivers-info').doc(docId).update({
          'phone': phone,
          'lastUpdated': now,
        });
      } else {
        // Novo documento
        await firestore.collection('drivers-info').add({
          'driverName': driverName,
          'driverLicense': driverLicense,
          'phone': phone,
          'lastUpdated': now,
        });
      }
    } catch (e) {
      // print('Failure saving driver info');
    }
  }

  Future<String?> getDriverPhone({
    required String driverName,
    required String driverLicense,
  }) async {
    try {
      final querySnapshot = await firestore
          .collection('drivers-info')
          .where('driverName', isEqualTo: driverName)
          .where('driverLicense', isEqualTo: driverLicense)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first['phone'] as String;
      } else {
        return null; // Motorista não encontrado
      }
    } catch (e) {
      // print('Erro ao buscar telefone do motorista');
      return null;
    }
  }
}
