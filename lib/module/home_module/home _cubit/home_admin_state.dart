part of 'home_admin_cubit.dart';


abstract class HomeAdminState {}

class HomeAdminInitial extends HomeAdminState {}
class GetDepartLoadingState extends HomeAdminState {}
class GetDepartSuccessState extends HomeAdminState {
  final GetAllDepartmentModel getAllDepartmentModel;
  GetDepartSuccessState(this.getAllDepartmentModel);
}
class GetDepartErrorState extends HomeAdminState {
  final String messageError ;


  GetDepartErrorState(this.messageError);
}

class GetTasksLoadingState extends HomeAdminState {}
class GetTasksSuccessState extends HomeAdminState {
  GetAllTasksModel?  getAllTasksModel;

  GetTasksSuccessState(this.getAllTasksModel);
}
class GetTasksErrorState extends HomeAdminState {
  final String errorMessage ;

  GetTasksErrorState(this.errorMessage);
}
