import 'package:a_learning/teacher/teacher%20course/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/Teacherpages/teacherassignmentsm.dart';

class Viewt extends StatelessWidget {
  final int id;
  const Viewt({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child:
            // Container with ListView
            Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(12),

                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [


                       Row(
                         mainAxisSize: MainAxisSize.max,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           const Text(
                            "My Courses",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                                                 ),
                         ],
                       ),
                      const SizedBox(height: 16),

                      Consumer<Teachercourseviewmodel>(
                        builder: (context, courseview, child) {
                          if (courseview.courses.isEmpty) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          return SizedBox(
                            height: 250,
                            child: ListView.builder(
                               // Makes the ListView take only the space it needs
                              itemCount: courseview.courses.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                 onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>teacherassignm(module:courseview.courses[index].coursename, modid: courseview.courses[index].courseID,)));
                                 }
                                 , child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 6),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(241, 244, 248, 1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            // Course Details
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  courseview.courses[index].coursename,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(height: 4), // Spacing
                                                Text(
                                                  " students",
                                                  style: const TextStyle(
                                                    color: Color.fromRGBO(87, 99, 108, 1),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),


      ),
    );
  }
}
