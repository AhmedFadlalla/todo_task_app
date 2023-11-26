import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_tast_app/core/constant/end_points/end_points.dart';
import 'package:todo_tast_app/core/helper/network/dio_helper.dart';
import 'package:todo_tast_app/feature/register/view_model/register_state.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context)=>BlocProvider.of(context);
  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var confirmPasswordController=TextEditingController();
  var formKey=GlobalKey<FormState>();

  Future<void> register({
  required String name,
    required String email,
    required String password,
    required String confirmPassword
})async{
    emit(RegisterLoadingState());
    final response=await DioHelper.postData(url: EndPoints.register,
    data: {
      "name":name,
      "email":email,
      "password":password,
      "password_confirmation":confirmPassword,
    });
print("token${response.data["data"]["token"]}");
    if(response.statusCode==200){
emit(RegisterSuccessState(
  token: response.data["data"]["token"]
));
    }else{
      emit(RegisterErrorState(error: response.data["message"]));
    }
  }
}
