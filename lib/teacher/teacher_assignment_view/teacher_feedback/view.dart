import 'package:a_learning/teacher/teacher_assignment_view/teacher_feedback/viewmodel.dart';
import 'package:flutter/material.dart';
class Teacherfeedbackview extends StatefulWidget {
  const Teacherfeedbackview({super.key});

  @override
  State<Teacherfeedbackview> createState() => _TeacherfeedbackviewState();
}

class _TeacherfeedbackviewState extends State<Teacherfeedbackview> {
  TextEditingController solution=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(24),
    child: Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(16),

        ),
        child: Padding(padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Send Feedback",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 24),),

              ],
            ),
            SizedBox(height: 16,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(240, 240, 240, 1),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Padding(padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: TextField(
                      maxLines: null,
                      controller: solution,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: "Feedback",
                        labelStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(224, 224, 224, 1)
                            ),

                        ),

                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(224, 224, 224, 1)
                          )
                        )

                      ),
                    ),
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(onPressed: (){},

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(57, 210, 192, 1),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))

                          ),
                          child:Text("Grade Solution",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Color.fromRGBO(255, 255, 255, 1)),)),
                      SizedBox(width: 10,),
                      ElevatedButton(onPressed: (){
                        Techerfeedmv feed=Techerfeedmv();
                        feed.feedbacksave(solution.text, null);
                      },

                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(75, 57, 239, 1),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))

                          ),


                          child:Text("Send",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Color.fromRGBO(255, 255, 255, 1)),))

                    ],
                  )
                ],
              )
                ),
            )
          ],
        ),
        ),
      ),
    ),
    );
  }
}

