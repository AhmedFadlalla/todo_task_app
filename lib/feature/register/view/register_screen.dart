import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_tast_app/core/helper/secure_storage/secure_storage.dart';
import 'package:todo_tast_app/core/util/app_functions/app_functions.dart';
import 'package:todo_tast_app/core/util/app_validator/app_validator.dart';
import 'package:todo_tast_app/core/util/secure_keys/secure_keys.dart';
import 'package:todo_tast_app/core/util/widgets/bottom_widget/bottom_widget.dart';
import 'package:todo_tast_app/core/util/widgets/text_form_field_widget/text_form_field_widget.dart';
import 'package:todo_tast_app/feature/register/view_model/register_cubit.dart';
import 'package:todo_tast_app/feature/register/view_model/register_state.dart';
import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import '../../../core/util/app_images/app_images.dart';
import '../../../core/util/secure_keys/secure_variables.dart';
import '../../home/view/home_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if(state is RegisterErrorState){
              AppFunctions.showToast(text: state.error);
            }
            if(state is RegisterSuccessState){
              SecureStorage.saveData(key: SecureKeys.token, value: state.token).then((value)async {
                SecureVariables.token=await SecureStorage.getData(key: SecureKeys.token);
              });

              AppFunctions.showToast(text: "Register Success");
              AppFunctions.navigateTo(context: context, navigatedScreen: HomeScreen());
            }
          },
          builder: (context, state) {
            var cubit = RegisterCubit.get(context);
            return Padding(
              padding: EdgeInsets.all(15.r),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.logo,
                      width: 120.w,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "Register",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23.sp,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    TextFormFieldWidget(
                        hintText: "Name",
                        controller: cubit.nameController,
                        keyboardType: TextInputType.text,
                        validator: AppValidators.generalValidator()),
                    SizedBox(
                      height: 8.h,
                    ),
                    TextFormFieldWidget(
                        hintText: "Email",
                        controller: cubit.emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: AppValidators.generalValidator()),
                    SizedBox(
                      height: 8.h,
                    ),
                    TextFormFieldWidget(
                        hintText: "Password",
                        controller: cubit.passwordController,
                        keyboardType: TextInputType.text,
                        validator: AppValidators.generalValidator()),
                    SizedBox(
                      height: 8.h,
                    ),
                    TextFormFieldWidget(
                        hintText: "Confirm Password",
                        controller: cubit.confirmPasswordController,
                        keyboardType: TextInputType.text,
                        validator:(value) {
                          if(value!.trim().isEmpty){
                            return "Confirm Password must not be empty";
                          }
                          else if(value!=cubit.passwordController.text){
                            return "Confirm password and password must be exactly the same";
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 8.h,
                    ),
                    AnimatedConditionalBuilder(condition: state is RegisterLoadingState,
                        builder: (context)=>Center(child: CircularProgressIndicator()),
                        fallback: (context)=>BottomWidget(text: "Register", onTap: (){
                          if(cubit.formKey.currentState!.validate()){
                            cubit.register(
                                name: cubit.nameController.text,
                                email: cubit.emailController.text,
                                password: cubit.passwordController.text,
                                confirmPassword: cubit.confirmPasswordController.text);
                          }

                        }))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
