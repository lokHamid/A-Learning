import 'package:a_learning/widgets/Chipchoice/Viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Chips extends StatelessWidget {
  const Chips({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Chipchoicemanager>(builder:(BuildContext context,Chip,child){
      return Container(
        constraints: BoxConstraints(
          maxWidth: double.infinity,

        ),
        height: 30,
        child: ListView.builder(
          scrollDirection:Axis.horizontal,
            itemCount: Chip.Choices.length,
            itemBuilder: (context,index){
              return Row(

                children: [

                  ElevatedButton(onPressed: (){
                    Chip.determine(index);
                  }, child:Text(Chip.Choices[index].choice,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Chip.Choices[index].text
                  ),

                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Chip.Choices[index].color
                     , shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)
                  )

                  ),),
                  SizedBox(width: 12,)
                ],
              );
            }),
      );
    });
  }
}
