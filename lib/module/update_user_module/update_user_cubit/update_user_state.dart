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


