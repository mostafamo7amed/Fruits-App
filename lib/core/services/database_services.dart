abstract class DatabaseServices {
  Future<void> addData(
      {required String path,
      required String documentId,
      required Map<String, dynamic> data});
  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId});

  Future<bool> checkIfDataExist({required String path, required String documentId});
}
