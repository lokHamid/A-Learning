import 'package:a_learning/widgets/Chipchoice/model.dart';
import 'package:flutter/material.dart';
class Chipchoicemanager extends ChangeNotifier{
  List<Choice> Choices=[];
  void addchoice(String choice){
    Choices.add(Choice(choice: choice));
    notifyListeners();
  }
  void fetch(List<String> roles){
    for(int i=0;i<roles.length;i++){
      Choices.add(Choice(choice: roles[i]));
    }
    notifyListeners();
  }

  void determine(int index){
    for(int i=0;i<Choices.length;i++) {
      if (i != index) {
        Choices[i].selected=0;
        Choices[i].color = Color.fromRGBO(255,255,255,1);
        Choices[i].text=Color.fromRGBO(20, 24, 27,1);
      }
    }

      if (Choices[index].selected == 0) {
        Choices[index].selected=1;
        Choices[index].color=Color.fromRGBO(75, 57, 239, 1);
        Choices[index].text=Color.fromRGBO(255, 255, 255, 1);
      } else {
        Choices[index].selected=0;
        Choices[index].color=Color.fromRGBO(255,255,255,1);
        Choices[index].text=Color.fromRGBO(20, 24, 27,1);
      }
      notifyListeners();
  }
}