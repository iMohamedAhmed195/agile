part of 'update_depart_cubit.dart';

abstract class UpdateDepartState {}

class UpdateDepartInitial extends UpdateDepartState {}

class EndListState extends UpdateDepartState {}

class UpdateDepartLoadingState extends UpdateDepartState {}
class UpdateDepartSuccessState extends UpdateDepartState {
  final UpdateDepartSuccessModel updateDepartSuccessModel;

  UpdateDepartSuccessState(this.updateDepartSuccessModel);
}
class UpdateDepartErrorState extends UpdateDepartState {
  final String error;

  UpdateDepartErrorState(this.error);
}
// class GetDepartLoadingState extends UpdateDepartState {}
// class GetDepartSuccessState extends UpdateDepartState {
//   final GetAllDepartmentModel getAllDepartmentModel;
//
//   GetDepartSuccessState(this.getAllDepartmentModel);
// }
// class GetDepartErrorState extends UpdateDepartState {
//   final String error;
//
//   GetDepartErrorState(this.error);
// }

class GetDepartmentLoadingState extends UpdateDepartState {}
class GetDepartmentSuccessState extends UpdateDepartState {
  final GetAllDepartmentModel getAllDepartmentModel;

  GetDepartmentSuccessState(this.getAllDepartmentModel);
}
class GetDepartmentErrorState extends UpdateDepartState {
  final String error;

  GetDepartmentErrorState(this.error);
}
