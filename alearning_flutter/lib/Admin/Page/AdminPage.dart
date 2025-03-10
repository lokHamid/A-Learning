import 'package:a_learning/Admin/View3.dart';
import 'package:a_learning/Admin/Viewmodel.dart';
import 'package:a_learning/Admin/view1.dart';
import 'package:a_learning/Admin/view2.dart';
import 'package:a_learning/widgets/dashboardcontainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Adminpage extends StatelessWidget {
  const Adminpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 244, 248,1),
      body: ChangeNotifierProvider(create: (_)=>Adminmanager()..Fetch(),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            dashboardcontainer(title: 'Welcome, Admin', description: 'Your learning journey starts here'),
            SizedBox(height: 24,),
            Statistics(),
            SizedBox(height: 24,),
            ManageUsers(),
            SizedBox(height: 24,),
            Adduser(),

          ],
        ),
      ),
      ),
    );
  }
}
