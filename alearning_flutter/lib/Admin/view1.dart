import 'package:a_learning/Admin/Viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Adminmanager>(builder:(BuildContext context,stat,child){
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding: EdgeInsets.all(16),
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255,255,255,1),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.people,size: 32,color: Color.fromRGBO(75, 57,239,1),),
                        SizedBox(height: 8,),
                        Text('Total Students',style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),),
                        SizedBox(height: 8,),
                        Text(stat.studentsnumber.toString(),style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(75, 57,239,1)
                        ),),
                      ],
                    ),
                    ),
                  ),
                ),
                ),
                SizedBox(width: 16,),
                Padding(padding: EdgeInsets.all(16),
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255,255,255,1),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Padding(padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.assignment_turned_in,size: 32,color: Color.fromRGBO(57, 210,192,1),),
                            SizedBox(height: 8,),
                            Text('Submissions',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),),
                            SizedBox(height: 8,),
                            Text(stat.sub.toString(),style: TextStyle(
                                fontSize: 44,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(57, 210,192,1)
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16,),
                Padding(padding: EdgeInsets.all(16),
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255,255,255,1),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Padding(padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.feedback,size: 32,color: Color.fromRGBO(238, 139,96,1),),
                            SizedBox(height: 8,),
                            Text('Feedback Given',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),),
                            SizedBox(height: 8,),
                            Text(stat.feedn.toString(),style: TextStyle(
                                fontSize: 44,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(238, 139,96,1)
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      );
    });
  }
}
