import 'package:a_learning/Student/AssignmentsDeatails/Viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Feedbackdetails extends StatelessWidget {
  const Feedbackdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
          color: Color.fromRGBO(241,244,248,1)

      ),
      child: Padding(padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Teacher Feedback',style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,

          ),),
          SizedBox(height: 12,),
          Consumer<Details>(builder: (BuildContext context,detail,child){
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(detail.feedback != null ? detail.feedback!.message : 'No feedback available',style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(87, 99,108,1),
                ),),
                SizedBox(height: 12,),
                detail.score(detail.feedback?.grade ?? 0)
              ],
            );
          })
        ],
      ),
      ),
    );
  }
}
