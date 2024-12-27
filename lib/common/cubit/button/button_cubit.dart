import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_app/common/cubit/button/button_state.dart';
import 'package:uptodo_app/core/usecase/usecase.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(ButtonInitial());

  Future<void> execute({required UseCase useCase, dynamic params}) async {
    emit(ButtonLoading());
    try {
      Either returnData = await useCase.call(params: params);
      returnData.fold(
        (error) {
          emit(ButtonFailure(errorMessage: error));
        },
        (data) {
         emit(ButtonSuccess());
        },
      );
    } catch (e) {
      emit(ButtonFailure(errorMessage: e.toString()));
    }
  }
}
