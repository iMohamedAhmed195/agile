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

class GetManagerLoadingState extends UpdateDepartState {}
class GetManagerSuccessState extends UpdateDepartState {
  final GetAllManagersModel getAllManagersModel;

  GetManagerSuccessState(this.getAllManagersModel);
}
class GetManagerErrorState extends UpdateDepartState {
  final String error;

  GetManagerErrorState(this.error);
}

class GetUserLoadingState extends UpdateDepartState {}
class GetUserSuccessState extends UpdateDepartState {
  final GetAllUserModel getAllUserModel;

  GetUserSuccessState(this.getAllUserModel);
}
class GetUserErrorState extends UpdateDepartState {
  final String error;

  GetUserErrorState(this.error);
}


class ChooseValueState extends UpdateDepartState {}