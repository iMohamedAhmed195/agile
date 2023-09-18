part of 'add_depart_cubit.dart';

abstract class AddDepartState {}

class AddDepartInitial extends AddDepartState {}
class AddDepartLoadingState extends AddDepartState {}
class AddDepartSuccessState extends AddDepartState {
  AddDepartModel addDepartModel;

  AddDepartSuccessState(this.addDepartModel);
}

class AddDepartErrorState extends AddDepartState {
  final String message ;

  AddDepartErrorState(this.message);
}
