import 'package:agile/models/log_in_model/log_in_model.dart';
import 'package:agile/shared/network/remote/End_Points.dart';
import 'package:agile/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;
  void loginApp({required String email, required String password}) {
    emit(LoginLoadingState());

    DioHelper.postData(
        url: LOG_IN,
        data: {'email': email, 'password': password})
        .then((value) {
          print(' ana hennnnnnaaaaaaaa cubit 1');
            loginModel = LoginModel.fromJson(value.data);
          print(' ana hennnnnnaaaaaaaa cubit 2');
            emit(LoginSuccessState(loginModel!));
    })
        .catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }
}
