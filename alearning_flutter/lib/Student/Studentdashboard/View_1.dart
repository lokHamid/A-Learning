import 'package:a_learning/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Pages/Assignments.dart';
import 'ViewModel.dart';
class Studentdash extends StatelessWidget {
  final int studentID;
  final Level level;
  const Studentdash({super.key,required this.studentID, required this.level});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=>Studentdashboard()..Fetchcourses(level)
    ,child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          constraints: BoxConstraints(
            minHeight: 250,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(padding: EdgeInsets.all(20),
          child: Column(
           mainAxisSize: MainAxisSize.min,
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Text('My Courses',style: TextStyle(
               fontWeight: FontWeight.w600,
               fontSize: 24
             ),),
             SizedBox(height: 16,),
            Consumer<Studentdashboard>(builder: (BuildContext context, Studentdashboard course, Widget? child) {
              if(course.isloading) {
               return Center(
                 child: CircularProgressIndicator(
                   color: Color.fromRGBO(75, 57, 239, 1),

                 ),
               ) ;
              }
              if(course.courses.isEmpty){
                return Center(
                  child: Text('No course is found',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                  ),
                  ),
                );
              }else {
                return SizedBox(height: 200,
                  child: ListView.builder(
                      itemCount: course.courses.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context)=>Courseassignments(coursename: 'Intro to Python', studentID: studentID,courseid: course.courses[index].courseID,)));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                    Text(course.courses[index].coursename,style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),),
                                      Text('Prof. '+course.courses[index].teacher,style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(87, 99, 108,1),

                                      ),),
                                    ],
                                  ),
                                  Icon(Icons.computer,size: 30,color: Color.fromRGBO(75, 57, 239,1),)
                                ],
                              ),
                            ),
                            SizedBox(height: 16,)
                          ],
                        );
                      }),
                );
              }
            },)
           ],
          ),
          ),
        ),
    ),
    );
  }
}
