class AppListModel {
  final int appId;
  final String name;
  final String platform;

  AppListModel({required this.appId, required this.name, required this.platform});

  static AppListModel fromJson(Map<String, Object?> row) {
    return AppListModel(
      appId: int.tryParse(row['ZAPPID'].toString()) ?? -1,
      name: row['ZNAME']?.toString() ?? '',
      platform: row['ZPLATFORM']?.toString() ?? '',
    );
  }
}
