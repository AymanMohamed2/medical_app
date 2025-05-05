class FireStoreException implements Exception {
  final String message;
  FireStoreException(this.message);
  @override
  String toString() {
    return message;
  }
}
