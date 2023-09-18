part of 'update_depart_cubit.dart';

abstract class UpdateDepartState {}

class UpdateDepartInitial extends UpdateDepartState {}
class UpdateDepartLoadingState extends UpdateDepartState {}
class UpdateDepartSuccessState extends UpdateDepartState {
  final UpdateDepartSuccessModel updateDepartSuccessModel;

  UpdateDepartSuccessState(this.updateDepartSuccessModel);
}
class UpdateDepartErrorState extends UpdateDepartState {
  final String error;

  UpdateDepartErrorState(this.error);
}
