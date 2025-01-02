import 'package:a_learning/teacher/teachersubmision/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/Teacherpages/teacherview.dart';
import '../teacher course/viewmodel.dart';
class Viewsubmit extends StatelessWidget {
 final int id;
 final String name;
  const Viewsubmit({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => Teachersubvm()..Fethdata(id),
       child: Padding(
         padding: EdgeInsets.all(16.0),
         child: Material(
           elevation: 4,
           borderRadius: BorderRadius.circular(16),
           // Optional: Rounded corners
           shadowColor: Colors.grey.withOpacity(0.5),
           child: Container(
             width: double.infinity,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(16),
               color: Color.fromRGBO(255, 255, 255, 1),

             ),
             child: Padding(padding: EdgeInsets.all(20),
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     mainAxisSize: MainAxisSize.max,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text("Recent Submissions", style: TextStyle(
                           fontSize: 24, fontWeight: FontWeight.w600),),
                       ElevatedButton(onPressed: () {},
                           style: ElevatedButton.styleFrom(
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(20)
                               ),
                               backgroundColor: Color.fromRGBO(
                                   75, 57, 239, 1)),
                           child: Text("View All", style: TextStyle(
                               color: Colors.white,
                               fontWeight: FontWeight.w400,
                               fontSize: 12),))
                     ],
                   ),
                   SizedBox(height: 16,),
                   Row(
                     mainAxisSize: MainAxisSize.max,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Filter by:", style: TextStyle(fontSize: 14,
                           fontWeight: FontWeight.w400,
                           color: Color.fromRGBO(87, 99, 108, 1)),),
                       Container(
                         width: 120,
                         decoration: BoxDecoration(
                             color: Color.fromRGBO(240, 240, 240, 1),

                             borderRadius: BorderRadius.circular(20)
                         ),
                         child: Padding(padding: EdgeInsets.only(
                             left: 8, right: 8, bottom: 12, top: 12),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             mainAxisSize: MainAxisSize.max,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Text("All Modules", style: TextStyle(
                                 fontWeight: FontWeight.w400, fontSize: 12,),),
                               Icon(Icons.arrow_drop_down,
                                 color: Color.fromRGBO(75, 57, 239, 1),
                                 size: 20,)
                             ],
                           ),
                         ),

                       )
                     ],
                   ),


                   SizedBox(height: 16,),
                   Consumer<Teachersubvm>(
                       builder: (BuildContext context, teachersubvm,
                           Widget? child) {
                         if (teachersubvm.isLoding) {
                           return Center(child: CircularProgressIndicator(),);
                         } else {
                           if (teachersubvm.solution1.isEmpty) {
                          return Center(child: Text('no solutions'),);
                           } else {
                             return Column(
                               children: [

                                 SizedBox(
                                   height: 100,
                                   child: ListView.builder(
                                     itemCount: teachersubvm.solution1.length,
                                     itemBuilder: (BuildContext context,
                                         int index) {
                                       Color containerColor=Colors.blue;
                                       Color textcolor=Colors.green;


                                       return GestureDetector(
                                         onTap: () {
                                           Navigator.push(context,
                                               MaterialPageRoute(
                                                   builder: (context) =>
                                                       Teacherview(
                                                         student: (teachersubvm.solution1[index].firstname?? '')+' '+(teachersubvm.solution1[index].lastname?? ''),
                                                         id: teachersubvm.solution1[index].id?? 0,
                                                         course: teachersubvm.solution1[index].pwname??'',
                                                        solution1: teachersubvm.solution1[index],
                                                       )));
                                         },
                                         child: Column(
                                           children: [
                                             Container(
                                               width: double.infinity,
                                               decoration: BoxDecoration(
                                                   color: Color.fromRGBO(
                                                       240, 240, 240, 1),
                                                   borderRadius: BorderRadius
                                                       .circular(8)
                                               ),
                                               child: Row(
                                                 mainAxisSize: MainAxisSize.max,
                                                 crossAxisAlignment: CrossAxisAlignment
                                                     .center,
                                                 mainAxisAlignment: MainAxisAlignment
                                                     .spaceBetween,
                                                 children: [
                                                   Column(
                                                     mainAxisAlignment: MainAxisAlignment
                                                         .start,
                                                     crossAxisAlignment: CrossAxisAlignment
                                                         .start,
                                                     mainAxisSize: MainAxisSize
                                                         .min,
                                                     children: [
                                                       Text(
                                                         (teachersubvm
                                                             .solution1[index]
                                                             .firstname ?? '') +
                                                             ' ' + (teachersubvm
                                                             .solution1[index]
                                                             .lastname ?? ''),


                                                         style: TextStyle(
                                                             fontSize: 14,
                                                             fontWeight: FontWeight
                                                                 .w600),),
                                                       Text(teachersubvm
                                                           .solution1[index]
                                                           .pwname ?? ''
                                                         ,
                                                         style: TextStyle(
                                                             fontSize: 12,
                                                             fontWeight: FontWeight
                                                                 .w400,
                                                             color: Color
                                                                 .fromRGBO(
                                                                 87, 99, 108,
                                                                 1)),)

                                                     ],
                                                   ),
                                                   Container(
                                                     decoration: BoxDecoration(
                                                         borderRadius: BorderRadius
                                                             .circular(12),
                                                         color: containerColor
                                                     ),
                                                     child: Text(
                                                       'late',
                                                       style: TextStyle(
                                                           fontWeight: FontWeight
                                                               .w400,
                                                           fontSize: 12,
                                                           color: textcolor),),
                                                   )
                                                 ],
                                               ),
                                             ),
                                             SizedBox(height: 12,)
                                           ],
                                         ),
                                       );
                                     },

                                   ),
                                 ),
                               ],
                             );
                           }
                         }
                       }

                   )
                 ],
               ),
             ),
           ),
         ),
       ),
     );

  }
}
