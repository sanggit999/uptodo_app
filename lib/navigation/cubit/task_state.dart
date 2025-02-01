abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskSuccess extends TaskState {}

class TaskFailure extends TaskState {
  final String errorMessage;

  TaskFailure({required this.errorMessage});
}
