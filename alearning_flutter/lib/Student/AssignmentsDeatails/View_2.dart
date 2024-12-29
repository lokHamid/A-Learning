import 'package:a_learning/Student/AssignmentsDeatails/Viewmodel.dart';
import 'package:a_learning/teacher/teacher_assignment_view/Studentsolution/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class AssignmentDetails2 extends StatelessWidget {
  final int idstudent;
  final int idpw;
  const AssignmentDetails2({super.key, required this.idstudent, required this.idpw});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromRGBO(241,244,248,1),
        borderRadius: BorderRadius.circular(12),

      ),
      child: Padding(padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Submission Form',style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),)
            ],
          ),
          SizedBox(height: 12,),
          Consumer<Details>(builder:(BuildContext context,detail,child){
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxHeight: 150
                  )
                 ,decoration: BoxDecoration(
                     color: Color.fromRGBO(255, 255,255, 1),
                   borderRadius: BorderRadius.circular(8)
                 )
                  ,child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(224,224,224,1),
                        ),

                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:Color.fromRGBO(224,224,224,1)
                        )
                      )

                      ,border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(224,224,224,1),
                        ),

                      ),
                      fillColor: Color.fromRGBO(255,255,255,1),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(224,224,224,1),
                        ),

                      ),
                      labelText: 'Solution',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      )
                    ),
                    maxLines: null,
                   controller: detail.t1,
                    onChanged: (value){
                      detail.controle(detail.t1);
                    },
                  ),
                ),
                SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ElevatedButton(onPressed: (){
                      detail.pickfile();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(57,210,192,1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    )
                    ,child:Text('Attach Files',style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(255, 255, 255,1),

                    ),)),
                    SizedBox(width: 10,),
                    ElevatedButton(onPressed: (){
                      detail.s1?.solution1=detail.t1.text;
                      detail.s1?.ref_student=idstudent;
                      detail.s1?.id_solution=145;
                      detail.s1?.ref_feedback=4;
                      detail.s1?.ref_pw=idpw;
                      detail.s1?.pdf.add(files(idfile: 99, name:'file', url: 'http',Role: 'none'));
                      //assign other values too here . missing!
                      detail.sendsolution();
                    },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(75,57,239,1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            )
                        )
                        ,child:Text('Submit',style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(255, 255, 255,1),

                        ),)),
                  ],
                )
              ],
            );
          })
        ],
      ),
      ),
    );
  }
}
