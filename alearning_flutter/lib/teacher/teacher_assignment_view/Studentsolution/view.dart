import 'package:a_learning/teacher/teacher_assignment_view/Studentsolution/model.dart';
import 'package:a_learning/teacher/teacher_assignment_view/Studentsolution/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a_learning/teacher/teacher_assignment_view/Studentsolution/viewmodel.dart';

class Teachersolview extends StatelessWidget {
  const Teachersolview({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Teachersolvm()..fetchSolution(), // Fetch solution during provider initialization
      child: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 16),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Student Solution",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                  SizedBox(height: 16),
                  Consumer<Teachersolvm>(builder: (context, techersol, child) {
                    if (techersol.isLoading) {
                      // Show a loading indicator while data is being fetched
                      return const Center(child: CircularProgressIndicator());
                    }

                    // Ensure the solution is not null
                    if (techersol.solutions == null) {
                      return Center(child: Text('No solution available'));
                    }

                    return Padding(
                      padding: EdgeInsets.all(12),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(241, 244, 248, 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Solution",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                techersol.solutions?.solution1 ?? 'No solution text',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                  SizedBox(height: 16),
                  Consumer<Teachersolvm>(builder: (context, techsol, child) {
                    return Padding(
                      padding: EdgeInsets.all(12),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(241, 244, 248, 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Attached Files:",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 14),
                              ),
                              SizedBox(height: 8),
                              SizedBox(
                                height: 100,
                                child: ListView.builder(
                                  itemCount: techsol.solutions?.pdf.length ?? 0,
                                  itemBuilder: (context, i) {
                                    return GestureDetector(
                                      onTap: () {
                                        techsol.launchURL(
                                            techsol.solutions?.pdf[i].url ??
                                                '');
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.attach_file,
                                            color:
                                            Color.fromRGBO(75, 57, 239, 1),
                                            size: 20,
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            techsol.solutions?.pdf[i].name ??
                                                '',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
