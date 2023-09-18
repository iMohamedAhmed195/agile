part of 'add_user_cubit.dart';

abstract class AddUserState {}

class AddUserInitial extends AddUserState {}
class AddUserChange extends AddUserState {}
class AddUserLoadingState extends AddUserState {}
class AddUserSuccessState extends AddUserState {
  AddUserModel addUserModel;

  AddUserSuccessState(this.addUserModel);
}
class AddUserErrorState extends AddUserState {
  final String error;

  AddUserErrorState(this.error);
}
