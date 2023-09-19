part of 'create_task_cubit.dart';

@immutable
abstract class CreateTaskState {}

class CreateTaskInitial extends CreateTaskState {}
class CreateTaskLoadingState extends CreateTaskState {}
class CreateTaskSuccessState extends CreateTaskState {
  final CreateTaskModel createTaskModel;

  CreateTaskSuccessState(this.createTaskModel);
}
class CreateTaskErrorState extends CreateTaskState {
  final String messageError ;

  CreateTaskErrorState(this.messageError);
}

class GetEmployeeLoadingState extends CreateTaskState {}
class GetEmployeeSuccessState extends CreateTaskState {
  final GetEmployeeModel getEmployeeModel;
  GetEmployeeSuccessState(this.getEmployeeModel);
}
class GetEmployeeErrorState extends CreateTaskState {
  final String messageError ;
  final ErrorModel errorModel ;

  GetEmployeeErrorState(this.messageError, this.errorModel);


}
