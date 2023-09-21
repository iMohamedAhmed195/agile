part of 'delete_cubit.dart';

@immutable
abstract class DeleteState {}

class DeleteInitial extends DeleteState {}

class ChooseValueState extends DeleteState {}

class GetTasksLoadingState extends DeleteState {}
class GetTasksSuccessState extends DeleteState {
  final GetAllTasksModel  getAllTasksModel;

  GetTasksSuccessState(this.getAllTasksModel);
}
class GetTasksErrorState extends DeleteState {
  final String errorMessage ;

  GetTasksErrorState(this.errorMessage);
}

class DeleteTasksLoadingState extends DeleteState {}
class DeleteTasksSuccessState extends DeleteState {
  final   DeleteTasksModel deleteTasksModel;

  DeleteTasksSuccessState(this.deleteTasksModel);
}
class DeleteTasksErrorState extends DeleteState {
  final String error;

  DeleteTasksErrorState(this.error);
}

class GetUserLoadingState extends DeleteState {}
class GetUserSuccessState extends DeleteState {
  final GetAllUserModel getAllUserModel;

  GetUserSuccessState(this.getAllUserModel);
}
class GetUserErrorState extends DeleteState {
  final String error;

  GetUserErrorState(this.error);
}

class DeleteUserLoadingState extends DeleteState {}
class DeleteUserSuccessState extends DeleteState {
  final DeleteUserModel deleteUserModel;

  DeleteUserSuccessState(this.deleteUserModel);
}
class DeleteUserErrorState extends DeleteState {
  final String error;

  DeleteUserErrorState(this.error);
}

class GetDepartLoadingState extends DeleteState {}
class GetDepartSuccessState extends DeleteState {
  final GetAllDepartmentModel getAllDepartmentModel;
  GetDepartSuccessState(this.getAllDepartmentModel);
}
class GetDepartErrorState extends DeleteState {
  final String messageError ;


  GetDepartErrorState(this.messageError);


}

class DeleteDepartLoadingState extends DeleteState {}
class DeleteDepartSuccessState extends DeleteState {
  final   DeleteDepartModel deleteDepartModel;

  DeleteDepartSuccessState(this.deleteDepartModel);
}
class DeleteDepartErrorState extends DeleteState {
  final String error;

  DeleteDepartErrorState(this.error);
}
