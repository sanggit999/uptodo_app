import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_app/core/usecase/usecase.dart';
import 'package:uptodo_app/navigation/cubit/task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  Future<void> execute({required UseCase useCase, dynamic params}) async {
    emit(TaskLoading());
    try {
      Either returnedData = await useCase.call(params: params);
      returnedData.fold(
        (error) {
          emit(TaskFailure(errorMessage: error));
        },
        (data) {
          emit(TaskSuccess());
        },
      );
    } catch (e) {
      emit(TaskFailure(errorMessage: e.toString()));
    }
  }
}
