import 'package:a_learning/widgets/dashboardcontainer.dart';
import 'package:flutter/material.dart';

import '../teacherassignmantsmnage/view.dart';
class teacherassignm extends StatelessWidget {
  final String module;
  final String modid;
  const teacherassignm({super.key, required this.module, required this.modid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          dashboardcontainer(title: module, description:'Assignments'),
          SizedBox(
            height:24 ,
          ),
          Padding(padding: EdgeInsets.only(left: 24,right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Teacheraddassignment(),

            ],
          ),
          ),
        ],
      ),
    );
  }
}
