import 'package:a_learning/Admin/Viewmodel.dart';
import 'package:a_learning/widgets/Chipchoice/View.dart';
import 'package:a_learning/widgets/Chipchoice/Viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ManageUsers extends StatelessWidget {
  const ManageUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Adminmanager>(builder:(BuildContext context,users,child){
      return ChangeNotifierProvider(create: (_)=>Chipchoicemanager()..fetch(users.roles),
        child: Container(
          padding: EdgeInsets.all(24),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('User Management',style:
                TextStyle(fontWeight: FontWeight.w600,
                fontSize: 24),),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromRGBO(255,255,255,1)
                      ),
                      child: TextField(

                       decoration: InputDecoration(
                         labelText: 'Search users...',
                         labelStyle: TextStyle(
                           fontSize: 14,
                           fontWeight: FontWeight.w400
                         ),
                         suffixIcon: Icon(Icons.search,),
                         enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(8),
                           borderSide: BorderSide(
                             color: Color.fromRGBO(224, 224,224,1),

                           ),

                         ),
                         disabledBorder:OutlineInputBorder(
                           borderRadius: BorderRadius.circular(8),
                           borderSide: BorderSide(
                             color: Color.fromRGBO(224, 224,224,1),

                           ),

                         ),
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(8),
                           borderSide: BorderSide(
                             color: Color.fromRGBO(224, 224,224,1),

                           ),

                         ),
                       ),
                        controller: users.search,
                        onChanged: (value){
                          users.filter(value,users.search);

                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 16,),
                 Consumer<Chipchoicemanager>(builder: (BuildContext context,choic,child){
                   WidgetsBinding.instance.addPostFrameCallback((_) {
                     users.filteru(choic.Choices);
                   });
                    return Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255,1)
                      ),
                      width: 200,
                     child: Chips(), // Make sure Chips widget is constrained
                                     );
                 })

                ],
              ),
              SizedBox(height: 16,),
              Material(
                borderRadius: BorderRadius.circular(12),
                elevation: 2,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                   color: Color.fromRGBO(255, 255,255, 1),
                   borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(padding: EdgeInsets.all(16),
                  child:Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(width: 80,

                          child: Text('Name',style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14
                          ),),
                          ),
                          SizedBox(width: 80,


                            child: Text('Email',style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14
                            ),),
                          ),
                          SizedBox(width: 80,

                            child: Text('Role',style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14
                            ),),
                          ),
                          SizedBox(width: 80,

                            child: Text('Actions',style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14
                            ),),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 170,
                        child: ListView.builder(
                            itemCount: users.users.length,
                            itemBuilder: (context,index){
                          return Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(width: 80,
                                    height: 40,
                                    child: Text(users.users[index].fullname,style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14
                                    ),),
                                  ),

                                  SizedBox(width: 80,
                                    height:40,
                                    child: Text(users.users[index].email,style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14
                                    ),),
                                  ),
                                    users.determinrole(users.users[index].role.toString().split('.').last),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      IconButton(onPressed: (){}, icon:Icon(Icons.edit,size: 20,
                                      color: Color.fromRGBO(21, 101,192,1),

                                      ),
                                      color: Color.fromRGBO(227, 242,253,1),
                                        constraints: BoxConstraints(minHeight: 40,
                                        minWidth: 40),

                                      ),
                                      SizedBox(width: 8,),
                                      IconButton(onPressed: (){
                                        users.delete(index,users.users[index].userid);
                                      }, icon:Icon(Icons.delete,size: 20,
                                        color: Color.fromRGBO(198, 40,40,1),
                                      ),
                                        color: Color.fromRGBO(255, 235,238,1),
                                        constraints: BoxConstraints(minHeight: 40,
                                            minWidth: 40),
                                      ),

                                    ],
                                  )


                                ],
                              ),
                              SizedBox(height: 12,)
                            ],
                          );
                        }),
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
