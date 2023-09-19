part of 'update_user_cubit.dart';

abstract class UpdateUserState {}

class UpdateUserInitial extends UpdateUserState {}
class UpdateUserChange extends UpdateUserState {}
class UpdateUserLoadingState extends UpdateUserState {}
class UpdateUserSuccessState extends UpdateUserState {
  final UpdateUserModel updateUserModel;

  UpdateUserSuccessState(this.updateUserModel);
}
class UpdateUserErrorState extends UpdateUserState {
  final String error;

  UpdateUserErrorState(this.error);
}
class GetUserLoadingState extends UpdateUserState {}
class GetUserSuccessState extends UpdateUserState {
  final GetAllUserModel getAllUserModel;

GetUserSuccessState(this.getAllUserModel);
}
class GetUserErrorState extends UpdateUserState {
  final String error;

  GetUserErrorState(this.error);
}


class ChooseValueState extends UpdateUserState {}

class GetDepartLoadingState extends UpdateUserState {}
class GetDepartSuccessState extends UpdateUserState {
  final GetAllDepartmentModel getAllDepartmentModel;
  GetDepartSuccessState(this.getAllDepartmentModel);
}
class GetDepartErrorState extends UpdateUserState {
  final String messageError ;


  GetDepartErrorState(this.messageError);


}

