class UsersModel {
  String userId;
  String userName;
  String userPosition;
  final imageUrl;
  final status;
  DateTime enterTime;
  DateTime outTime;

  UsersModel(
      {required this.userId,
      required this.userName,
      required this.userPosition,
      required this.imageUrl,
      required this.status,
      required this.enterTime,
      required this.outTime});
}
