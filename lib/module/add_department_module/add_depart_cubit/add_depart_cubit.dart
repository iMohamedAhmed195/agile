import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_depart_state.dart';

class AddDepartCubit extends Cubit<AddDepartState> {
  AddDepartCubit() : super(AddDepartInitial());
}
