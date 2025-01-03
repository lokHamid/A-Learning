import 'package:a_learning/teacher/teacher_assignment_view/teacher_feedback/model.dart';
import 'package:a_learning/teacher/teacher_assignment_view/teacher_feedback/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Teacherfeedbackview extends StatefulWidget {
  final int idsolution;

  const Teacherfeedbackview({super.key, required this.idsolution});

  @override
  State<Teacherfeedbackview> createState() => _TeacherfeedbackviewState();
}

class _TeacherfeedbackviewState extends State<Teacherfeedbackview> {
  double slider=0.0;

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
                    constraints: BoxConstraints(
                      maxHeight: 150.0,
                    ),
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
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:  Color.fromRGBO(224, 224, 224, 1),
                              )
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
                      ElevatedButton(onPressed: (){
    showDialog(context: context, builder:(BuildContext context){
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 40),
    contentPadding: EdgeInsets.all(0),
      content:Container(
        width: 600,

        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255,1),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
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
                  Text("Student Grade",style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                  ),)
                ],
              ),
              SizedBox(height: 20,),
             ChangeNotifierProvider(create: (_)=>Techerfeedmv(),

             child: Consumer<Techerfeedmv>(builder: (BuildContext context, vm, Widget? child) {

               return Column(
                 children: [
                   Slider(
                   value: vm.slider,
                   min: 0.0, // Minimum value
                   max: 20.0, // Maximum value
                   divisions: 20, // Number of divisions (optional)

                   onChanged: (double value) {
                   setState(() {
                     slider=value;
                   vm.update(value);

                   });
                   },
                   activeColor: Color.fromRGBO(75, 57, 239, 1), // Active color
                   inactiveColor: Colors.grey, // Inactive color
                   thumbColor: Color.fromRGBO(75, 57, 239, 1),
                   ),



              SizedBox(height: 20,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Grade:',style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16
                  ),),
                  Text(slider.toString() + '/20', style: TextStyle(
                     fontSize: 24,
                     fontWeight: FontWeight.w600,
                     color: Color.fromRGBO(75, 57, 239, 1)
                                      ),)
                ],
              ),
               ]
               );
             })),
              SizedBox(height: 16,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  Navigator.of(context).pop();
                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:Color.fromRGBO(75, 57, 239,1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ),
                    child: Text('Submit Grade',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,
                color: Color.fromRGBO(255,255,255,1)
                ),)),
              )
            ],
          ),
        ),
      ) ,
    );
    });

    },

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(57, 210, 192, 1),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))

                          ),
                          child:Text("Grade Solution",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Color.fromRGBO(255, 255, 255, 1)),)),
                      SizedBox(width: 10,),
                      ElevatedButton(onPressed: (){
                        Techerfeedmv feed=Techerfeedmv();
                        print(widget.idsolution);
                        Feedbacka feedback=Feedbacka(id_feedback: 4, message: solution.text,grade: slider);
                        feed.updateFeedback(widget.idsolution, feedback);
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

