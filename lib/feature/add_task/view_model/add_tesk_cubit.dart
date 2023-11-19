import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'add_tesk_state.dart';


class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  static AddTaskCubit get(context)=>BlocProvider.of(context);


  var titleController=TextEditingController();
  var descriptionController=TextEditingController();
  var startDateController=TextEditingController();
  var endDateController=TextEditingController();

  var formKey=GlobalKey<FormState>();
}
