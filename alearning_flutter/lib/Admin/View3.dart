import 'package:a_learning/Admin/Viewmodel.dart';
import 'package:a_learning/User.dart';
import 'package:a_learning/widgets/Chipchoice/View.dart';
import 'package:a_learning/widgets/Chipchoice/Viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../User.dart';
class Adduser extends StatelessWidget {
  const Adduser({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Adminmanager>(builder:(BuildContext context,user,child){
      return ChangeNotifierProvider(create: (_)=>Chipchoicemanager()..fetch(user.Assigns),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Add User',style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
        
            ),),
            SizedBox(height: 16,),
            Material(
              elevation: 12,
              borderRadius: BorderRadius.circular(12),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color.fromRGBO(255,255,255,1),
              ),
              child: Padding(padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(224,227,231,1)
                            )
                          ),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(224,227,231,1)
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(224,227,231,1)
                              )
                          ),
                          fillColor: Color.fromRGBO(255, 255,255,1),
                          labelText: 'Firstname',
                          labelStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                          )
                        ),
                          controller:user.t1 ,
                      )),
                      SizedBox(width: 20,),
                      Expanded(child: TextField(
                        controller:user.t2,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(224,227,231,1)
                                )
                            ),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(224,227,231,1)
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(224,227,231,1)
                                )
                            ),
                            fillColor: Color.fromRGBO(255, 255,255,1),
                            labelText: 'Last name',
                            labelStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            )
                        ),
        
                      )),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: TextField(
                        controller:user.t3 ,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(224,227,231,1)
                                )
                            ),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(224,227,231,1)
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(224,227,231,1)
                                )
                            ),
                            fillColor: Color.fromRGBO(255, 255,255,1),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            )
                        ),
        
                      )),
                      SizedBox(width: 20,),
                      Expanded(child: TextField(
                        controller:user.t4 ,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(224,227,231,1)
                                )
                            ),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(224,227,231,1)
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(224,227,231,1)
                                )
                            ),
                            fillColor: Color.fromRGBO(255, 255,255,1),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            )
                        ),
        
                      )),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255,255,1),
                      borderRadius: BorderRadius.circular(8),
                      border:Border.all(
                        color: Color.fromRGBO(224,224,224,1),
                        width: 1,
                      )
                    ),
                    child: Padding(padding: EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Role',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
        
                        ),),
                        Consumer<Chipchoicemanager>(builder:(BuildContext context,choice,child){
                          return Chips();
                        }),
                      ],
                    ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Consumer<Chipchoicemanager>(
                        builder: (BuildContext context, choce, Widget? child) {

                         return ElevatedButton(onPressed: () async {
                           Role role=Role.NONE;
                           for(int i=0;i<choce.Choices.length;i++){
                             if(choce.Choices[i].selected==1){
                                role = Role.values.firstWhere((e) => e.toString().split('.').last == choce.Choices[i].choice);

                             }
                           }
                          user.newuser=User(fullname: user.t1.text, email: user.t3.text, password: user.t4.text, role:role, userid: 5, last_name: user.t2.text);
                           await  user.addUser();
                          }, child:Text('Save User',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(255,255,255,1),
                          ),),
                          style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(75, 57, 239,1
                          )
                          ,

                          )
                          ,
                          );

                        }
                      )
                    ],
                  )
                ],
              ),
              ),
            ),
            ),
        
          ],
        ),
      ),
      );
    });
  }
}
