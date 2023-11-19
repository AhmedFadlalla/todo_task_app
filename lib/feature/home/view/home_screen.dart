import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_tast_app/core/util/app_functions/app_functions.dart';

import '../../add_task/view/add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  drawerScrimColor: Colors.white,
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("To Do Screen",style: TextStyle(
          color: Colors.white,
          fontSize: 22.sp,
          fontWeight: FontWeight.bold
        ),),
        actions: [
          IconButton(onPressed: (){
            showModalBottomSheet(context: context, builder: (context)=>Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
crossAxisAlignment: CrossAxisAlignment.start,              children: [
                  Text("Status",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: Colors.black
                  ),),
                  TextFormField(),
                Center(child: ElevatedButton(onPressed: (){}, child: Text("Apply Filter")))
                ],
              ),
            ));


          }, icon: Icon(Icons.filter_list,color: Colors.white,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.logout,color: Colors.white,))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.pink,
        onPressed: (){
          AppFunctions.navigateTo(context: context, navigatedScreen: AddTaskScreen());
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
      body: Padding(padding: EdgeInsets.all(22),
      child: ListView.separated(
          itemBuilder: (context,index)=>Container(

        decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.green)
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Go To Gym",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18.sp
              ),),
              SizedBox(height: 10,),
              Text("dfsdsjk",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 14.sp
              ),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.pink)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.timer_outlined),
                            SizedBox(width: 8,),
                            Text("1-9-2023")
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 4,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.pink)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.timer_off_outlined),
                            SizedBox(width: 8,),
                            Text("1-9-2023")
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
          separatorBuilder: (context,index)=>SizedBox(height: 8,),
          itemCount: 15),),
    );
  }
}
