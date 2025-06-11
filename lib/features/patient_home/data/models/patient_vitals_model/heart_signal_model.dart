class HeartSignalModel {
  List<String> heartSignal;
  HeartSignalModel({required this.heartSignal});
  factory HeartSignalModel.fromJson(Map<String, dynamic> json) {
    return HeartSignalModel(
        heartSignal:
            (json['heart_signal'] as List).map((e) => e.toString()).toList());
  }
}
