import 'package:agile/models/log_in_model/log_in_error_model.dart';
import 'package:agile/models/log_in_model/log_in_success_model.dart';
import 'package:agile/shared/network/remote/end_points.dart';
import 'package:agile/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;
  LoginErrorModel? loginErrorModel;
  void loginApp({required String email, required String password}) {
    emit(LoginLoadingState());

    DioHelper.postData(
        url: logIn,
        data: {'email': email, 'password': password})
        .then((value) {
          if(value.statusCode == 401){
            loginErrorModel = LoginErrorModel.fromJson(value.data);
          }
          else{
            loginModel = LoginModel.fromJson(value.data);
            emit(LoginSuccessState(loginModel!));
          }
    })
        .catchError((error) {

      emit(LoginErrorState(error.toString()));
    });
  }
}
