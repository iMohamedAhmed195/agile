
import 'package:agile/shared/network/remote/end_points.dart';
import 'package:agile/models/update_depart_mode/update_depart_failure_mode.dart';
import 'package:agile/models/update_depart_mode/update_depart_success_mode.dart';
import 'package:agile/shared/network/remote/dio_helper.dart';
import 'package:agile/shared/service/secure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_depart_state.dart';

class UpdateDepartCubit extends Cubit<UpdateDepartState> {
  UpdateDepartCubit() : super(UpdateDepartInitial());
  static UpdateDepartCubit get(context) => BlocProvider.of(context);

  UpdateDepartSuccessModel? updateDepartSuccessModel;
  UpdateDepartFailureModel? updateDepartFailureModel;


  void updateDepartment({required String nameDepart , required String managerId}) async{
    emit(UpdateDepartLoadingState());

    DioHelper.postData(
      url: updateDepart,
      data: {
        'name': nameDepart,
        'manager_id': managerId
      },
      token: await Secure().secureGetData(key: 'token'),
    )
        .then((value) {
      if(value.statusCode == 401){
        updateDepartFailureModel = UpdateDepartFailureModel.fromJson(value.data);
      }
      else{
        updateDepartSuccessModel = UpdateDepartSuccessModel.fromJson(value.data);
        emit(UpdateDepartSuccessState(updateDepartSuccessModel!));
      }
    })
        .catchError((error) {
      print(error.toString());
      emit(UpdateDepartErrorState(error.toString()));
    });
  }
}
