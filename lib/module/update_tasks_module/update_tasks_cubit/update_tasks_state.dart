part of 'update_tasks_cubit.dart';


abstract class UpdateTasksState {}

class UpdateTasksInitial extends UpdateTasksState {}
class UpdateTasksLoadingState extends UpdateTasksState {}
class UpdateTasksSuccessState extends UpdateTasksState {
  final UpdateTasksModel updateTasksModel ;

  UpdateTasksSuccessState(this.updateTasksModel);
}
class UpdateTasksErrorState extends UpdateTasksState {
  final String errorMessage ;

  UpdateTasksErrorState(this.errorMessage);
}


class GetTasksLoadingState extends UpdateTasksState {}
class GetTasksSuccessState extends UpdateTasksState {
  GetAllTasksModel?  getAllTasksModel;

  GetTasksSuccessState(this.getAllTasksModel);
}
class GetTasksErrorState extends UpdateTasksState {
  final String errorMessage ;

  GetTasksErrorState(this.errorMessage);
}

class GetUserLoadingState extends UpdateTasksState {}
class GetUserSuccessState extends UpdateTasksState {
  final GetAllUserModel getAllUserModel;

  GetUserSuccessState(this.getAllUserModel);
}
class GetUserErrorState extends UpdateTasksState {
  final String error;

  GetUserErrorState(this.error);
}


class ChooseValueState extends UpdateTasksState {}
class ChangeReadOnlyState extends UpdateTasksState {}
class AddUserChange extends UpdateTasksState {}
class DateChange extends UpdateTasksState {}
class ProfileImageSuccessStates extends UpdateTasksState {}
class ProfileImageErrorStates extends UpdateTasksState {}

class GetDepartLoadingState extends UpdateTasksState {}
class GetDepartSuccessState extends UpdateTasksState {
  final GetAllDepartmentModel getAllDepartmentModel;
  GetDepartSuccessState(this.getAllDepartmentModel);
}
class GetDepartErrorState extends UpdateTasksState {
  final String messageError ;


  GetDepartErrorState(this.messageError);


}
