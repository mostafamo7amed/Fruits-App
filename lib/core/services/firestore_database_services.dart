import 'package:cloud_firestore/cloud_firestore.dart';

import 'database_services.dart';

class FireStoreDatabaseServices implements DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String path,
      required String documentId,
      required Map<String, dynamic> data}) {
    return firestore.collection(path).doc(documentId).set(data);
  }

  @override
  Future<Map<String, dynamic>> getData({required String path, required String documentId}) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> checkIfDataExist({required String path, required String documentId}) async{
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }
}
