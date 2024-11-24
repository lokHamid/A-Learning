import 'package:flutter/material.dart';
class dashboardcontainer extends StatelessWidget {

  const dashboardcontainer({super.key, required this.title, required this.description});
final String title;
final String description;

  @override
  Widget build(BuildContext context) {
    return
       Padding(
        padding:EdgeInsets.only(left: 24,right: 24),
        child:Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(75, 57, 239, 1), // Starting color
                Color.fromRGBO(57, 210, 192, 1), // Ending color
              ],
              begin: Alignment.topCenter, // Start point of the gradient
              end: Alignment.bottomCenter, // End point of the gradient
            ),
          ),
          child: Padding(padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(title,style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.white),),
                Text(description,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Color.fromRGBO(224, 224, 224, 1)),)
              ],

            ),
          ),
        ),



    );
  }
}
