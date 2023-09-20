import 'package:agile/models/add_user_model/add_user_model.dart';
import 'package:agile/shared/network/remote/dio_helper.dart';
import 'package:agile/shared/network/remote/end_points.dart';
import 'package:agile/shared/service/secure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_user_state.dart';

class AddUserCubit extends Cubit<AddUserState> {
  AddUserCubit() : super(AddUserInitial());
  static AddUserCubit get(context) => BlocProvider.of(context);
  AddUserModel? addUserModel;

  int index = 0;
  String selectValue ='admin';

  void changeRadio(String y){
    if(y == 'admin'){
      index =0;
      selectValue = y;
      emit(AddUserChange());
    }else if(y == 'manager'){
      index = 1;
      selectValue = y;
      emit(AddUserChange());

    }else if (y == 'user'){
      index = 2;
      selectValue = y;
      emit(AddUserChange());

    }

  }

  void addedUser({required String name, required String email,required String phone,required String password }) async{
    emit(AddUserLoadingState());

    DioHelper.postData(
        url: addUser,
        data: {
          'email': email,
          'password': password,
          'name': name,
          'phone': phone,
          'user_type':  index ,
        },
        token: await Secure().secureGetData(key: 'token'),
    )
        .then((value) {
          print(1);
          print(email);
          print(password);
          print(name);
          print(phone);
          print(index);
      if(value.statusCode == 401){
        print(2);
        print(email);
        print(password);
        print(name);
        print(phone);
        print(index);
        addUserModel = AddUserModel.fromJson(value.data);
      }
      else{
        print(3);
        print(email);
        print(password);
        print(name);
        print(phone);
        print(index);
        addUserModel = AddUserModel.fromJson(value.data);
        emit(AddUserSuccessState(addUserModel!));
      }
    })
        .catchError((error) {
      print(4);
      print(email);
      print(password);
      print(name);
      print(phone);
      print(index);
      print(error.toString());
      emit(AddUserErrorState(error.toString()));
    });
  }
}
