import 'package:a_learning/Student/Student-assignments/Viewmodel.dart';
import 'package:a_learning/teacher/teacher_assignment_view/Studentsolution/model.dart';
import 'package:a_learning/teacher/teacherassignmantsmnage/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Pages/Detailedassignments.dart';
class Studentassi extends StatelessWidget {
  final  int studentID;
  final String courseid;
  const Studentassi({super.key, required this.studentID, required this.courseid});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=>Studentassign()..Fetchassign(courseid),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(16),
        child: Container(

          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255,1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Available Assignments',style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,

                ),),
                SizedBox(height: 16,),
                Consumer<Studentassign>(builder: (BuildContext context, Studentassign assign, Widget? child) {
                  if(assign.isloadingass){
                    return Center(child: CircularProgressIndicator(color: Color.fromRGBO(75, 57, 239,1),),);
                  }
                  if(assign.assignments.isEmpty){
                    return Center(child:Text('No assignments')
                      ,);
                  }else{
                    return SizedBox(
                      height: 600,
                      child: ListView.builder(
                          itemCount: assign.assignments.length,
                          itemBuilder: (context,index){
                            return Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(241, 244, 248,1),
                                    borderRadius: BorderRadius.circular(12),
                      
                                  ),
                                  child: Padding(padding: EdgeInsets.all(16),
                                    child:Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('Lab'+(index+1).toString()+':'+assign.assignments[index].pwname,style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                      
                                        ),),
                                        SizedBox(height: 12,),
                                        Text(assign.assignments[index].objectives ?? '',style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color.fromRGBO(87,99,108,1),
                      
                                        ),),
                                        SizedBox(height: 12,),
                                        assign.assigndeadline(assign.assignments[index].submissiondeadline),
                                        SizedBox(height: 12,),
                                        ElevatedButton(onPressed: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Detailedassignments(assign:assign.assignments[index],iduser: studentID,)));
                                        },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Color.fromRGBO(75, 57,239,1),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20)
                                                )
                                            )
                                            , child:Text('View Details',style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color: Colors.white,
                      
                                            ),))
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16,)
                              ],
                            );
                          }),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
