class EmployeesModel {
  String employeeId;
  String employeeName;
  String employeePosition;
  final imageUrl;
  final status;
  DateTime entryTime;
  DateTime exitTime;

  EmployeesModel(
      {required this.employeeId,
      required this.employeeName,
      required this.employeePosition,
      required this.imageUrl,
      required this.status,
      required this.entryTime,
      required this.exitTime});
}
