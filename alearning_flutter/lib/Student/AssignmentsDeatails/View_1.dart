import 'package:a_learning/teacher/teacherassignmantsmnage/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../teacher/teacherdektab.dart';
import 'View_2.dart';
import 'View_3.dart';
import 'View_4.dart';
import 'Viewmodel.dart';
class AssignmentsDetails1 extends StatelessWidget {
  final assignment asign1;
  final int iduser;
  const AssignmentsDetails1({super.key, required this.asign1, required this.iduser});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final details = Details();
        details.setassign(asign1);
        details.Fetchfeedback(asign1.pwid,iduser);// Set the assignment data here
        return details; // Return the same instance of Details
      },
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          height: 1200,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255,255,1),
            borderRadius: BorderRadius.circular(16)
          ),
          child: Padding(padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Assignment Details',style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600
              ),),
              SizedBox(height: 16,),
              Text('Lab:'+asign1.pwname,style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),),
              SizedBox(height: 16,),
              asign1.objectives != null && asign1.objectives!.isNotEmpty
                  ? Column(
                    children: [
                      Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                      color: Color.fromRGBO(241, 244, 248, 1),
                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Objectives:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(asign1.objectives??'',style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color.fromRGBO(87,99,108,1)
                          ),),
                        ],
                      ),
                    ),
                    ),
                      SizedBox(height: 16,)
                    ],
                  )
               :SizedBox.shrink(),
               asign1.steps.isNotEmpty?
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(241, 244, 248, 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Steps:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(asign1.steps,style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color.fromRGBO(87,99,108,1)
                      ),),
                      SizedBox(height: 16,),

                    ],
                  ),
                ),
              )
                   :SizedBox.shrink(),
              SizedBox(height: 16,),
              asign1.materials != null && asign1.materials!.isNotEmpty?
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(241, 244, 248, 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Materials:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(asign1.materials?? '',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color.fromRGBO(87,99,108,1)
                      ),),
                      SizedBox(height: 16,),

                    ],
                  ),
                ),
              )
                  :SizedBox.shrink(),
              SizedBox(height: 16,),
              Assignmentsfiles(),
              SizedBox(height: 16,),
              AssignmentDetails2(),
              SizedBox(height: 16,),
              Feedbackdetails()

            ],
          ),
          ),
        ),
      ),
    );
  }
}
