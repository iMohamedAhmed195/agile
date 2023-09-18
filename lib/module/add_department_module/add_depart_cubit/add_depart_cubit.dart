import 'package:agile/models/addd_depart_model/add_depart_failure_model.dart';
import 'package:agile/models/addd_depart_model/add_depart_success_model.dart';
import 'package:agile/shared/network/remote/dio_helper.dart';
import 'package:agile/shared/network/remote/end_points.dart';
import 'package:agile/shared/service/secure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'add_depart_state.dart';

class AddDepartCubit extends Cubit<AddDepartState> {
  AddDepartCubit() : super(AddDepartInitial());

 static AddDepartCubit get(context) => BlocProvider.of(context);

  AddDepartSuccessModel? addDepartModel;
  AddDepartFailureModel? addDepartFailureModel;
  void addedDepartment({required String nameDepart}) async{
    emit(AddDepartLoadingState());

    DioHelper.postData(
      url: addDepartment,
      data: {
        'name': nameDepart,
      },
      token: await Secure().secureGetData(key: 'token'),
    )
        .then((value) {
      if(value.statusCode == 401){
        addDepartFailureModel = AddDepartFailureModel.fromJson(value.data);
      }
      else{
        addDepartModel = AddDepartSuccessModel.fromJson(value.data);
        emit(AddDepartSuccessState(addDepartModel!));
      }
    })
        .catchError((error) {
      print(error.toString());
      emit(AddDepartErrorState(error.toString()));
    });
  }

}
