import 'package:a_learning/teacher/teachersubmision/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Viewsubmit extends StatelessWidget {
  const Viewsubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=>Teachersubvm()..Fethdata(),
    child: Padding(
      padding:  EdgeInsets.all(16.0),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(16), // Optional: Rounded corners
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
                    Text("Recent Submissions",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
                    ElevatedButton(onPressed: (){},
                        style:ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            backgroundColor: Color.fromRGBO(75, 57, 239, 1)) ,
                        child: Text("View All",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 12),))
                  ],
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Filter by:",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color.fromRGBO(87, 99, 108, 1)),),
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(240, 240, 240, 1),

                          borderRadius: BorderRadius.circular(20)
                      ),
                      child:Padding(padding: EdgeInsets.only(left: 8,right: 8,bottom: 12,top: 12) ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("All Modules",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,),),
                            Icon(Icons.arrow_drop_down,color: Color.fromRGBO(75, 57, 239,1),size: 20,)
                          ],
                        ),
                      ),

                    )
                  ],
                ),
                SizedBox(height: 16,),
                Consumer<Teachersubvm>(
                  builder: (BuildContext context, teachersubvm, Widget? child) {
                    return SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemCount:teachersubvm.assigns.length,
                        itemBuilder: (BuildContext context, int index) {
                          Color containerColor;
                          Color textcolor;
                          switch (teachersubvm.assigns[index].condition) {
                            case "Late":
                              textcolor = Color.fromRGBO(255, 111, 0, 1);
                              containerColor = Color.fromRGBO(255, 248, 225, 1);
                              break;
                            case "Submitted":
                              textcolor = Color.fromRGBO(46, 125, 50, 1);
                              containerColor = Color.fromRGBO(232, 245, 233, 1);
                              break;
                            case "notSubmitted":
                              containerColor = Colors.orange;
                              textcolor = Colors.red;
                              break;
                            default:
                              containerColor = Colors.grey;
                              textcolor =
                                  Colors.grey; // Default color if no match
                          }

                          return Column(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(240, 240, 240, 1),
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(teachersubvm.assigns[index].name, style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),),
                                        Text(teachersubvm.assigns[index].subject, style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                                87, 99, 108, 1)),)

                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: containerColor
                                      ),
                                      child: Text(teachersubvm.assigns[index].condition,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: textcolor),),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 12,)
                            ],
                          );
                        },

                      ),
                    );
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
