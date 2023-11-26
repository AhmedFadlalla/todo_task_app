import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_tast_app/core/util/app_functions/app_functions.dart';
import 'package:todo_tast_app/core/util/app_validator/app_validator.dart';
import 'package:todo_tast_app/core/util/widgets/bottom_widget/bottom_widget.dart';
import 'package:todo_tast_app/core/util/widgets/text_form_field_widget/text_form_field_widget.dart';
import 'package:todo_tast_app/feature/add_task/view_model/add_tesk_cubit.dart';
import 'package:todo_tast_app/feature/add_task/view_model/add_tesk_state.dart';

import '../../../core/util/widgets/app_bar_widget/app_bar_widget.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Add Task"),
      body: BlocProvider(
        create: (context) => AddTaskCubit(),
        child: BlocConsumer<AddTaskCubit, AddTaskState>(
          listener: (context, state) {
           if(state is AddTaskSuccessState){
             AppFunctions.showToast(text: "Add Task Success");
           }
          },
          builder: (context, state) {
            var cubit=AddTaskCubit.get(context);
            return Padding(
              padding: EdgeInsets.all(15.r),
              child: Form(
                key: cubit.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormFieldWidget(
                        hintText: "Title",
                        keyboardType: TextInputType.text,
                        controller:cubit.titleController,
                        validator: AppValidators.generalValidator(),
                      ),
                      SizedBox(height: 15.h,),
                      TextFormFieldWidget(
                        hintText: "Description",
                        controller:cubit.descriptionController,
                        keyboardType: TextInputType.text,

                        validator:AppValidators.generalValidator(),
                      ),
                      SizedBox(height: 15.h,),
                      TextFormFieldWidget(
                        hintText: "Start Date",
                        controller:cubit.startDateController,
                        keyboardType: TextInputType.none,
                        onTap:(){
                          AppFunctions.showDatePickerComponent(context: context).then((value) {
                            cubit.startDateController.text=value;
                          });
                        },
                        validator: AppValidators.generalValidator(),
                      ),
                      SizedBox(height: 15.h,),

                      TextFormFieldWidget(
                        hintText: "End Date",
                        keyboardType: TextInputType.none,
                        onTap:(){
                          AppFunctions.showDatePickerComponent(context: context).then((value) {
                            cubit.endDateController.text=value;
                          });
                        },
                        controller:cubit.endDateController,
                        validator: AppValidators.generalValidator(),
                      ),
                      SizedBox(height: 15.h,),
                      InkWell(
                        onTap: (){
                          cubit.getImage();
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: Colors.grey)
                          ),
                          child: cubit.image!=null?Image.file(cubit.image!):Padding(
                            padding:  EdgeInsets.all(20.r),
                            child: Column(
                              children: [
                                Icon(Icons.image,size: 120,),
                                Text("Add photo to your notes",style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h,),
                      BottomWidget(text: "Add Task", onTap: (){


                        if(cubit.formKey.currentState!.validate()){
                          cubit.addTask();

                        }
                      })
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
