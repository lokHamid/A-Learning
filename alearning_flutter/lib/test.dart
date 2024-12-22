import 'package:a_learning/widgets/Chipchoice/View.dart';
import 'package:a_learning/widgets/Chipchoice/Viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ChangeNotifierProvider(create: (_)=>Chipchoicemanager()

      ,child: Consumer<Chipchoicemanager>(
        builder: (BuildContext context, chip, Widget? child) {
          return Container(
            color:Color.fromRGBO(255, 255,255,1),
            width: double.infinity,
            child:Chips(),
          );
        },
      ),
      ),
    );
  }
}
