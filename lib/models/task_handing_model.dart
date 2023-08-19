import 'package:image_picker/image_picker.dart';

class TaskHandingModel {
  String taskHandingId;
  String taskName;
  String taskDate;
  String taskFile;

  TaskHandingModel(
      {required this.taskHandingId,
      required this.taskName,
      required this.taskDate,
      required this.taskFile});
}
