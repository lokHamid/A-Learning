import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Admin/Page/AdminPage.dart';
import '../Login/Viewmodel.dart';
import 'control.dart';
class viewmvc extends StatelessWidget {
  const viewmvc({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=>Loginmanager(),
      child: Consumer<Loginmanager>(
        builder: (BuildContext context, manage, child) {
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
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
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      child: Icon(Icons.school, size: 90,
                        color: Color.fromRGBO(255, 255, 255, 1),),
                    ),
                    SizedBox(height: 24,),
                    Text('Welcome Back', style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 255, 255, 1),),

                    ),
                    SizedBox(height: 24,),
                    Text('Sign in to continue learning', style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color.fromRGBO(224, 224, 224, 1),
                    ),),
                    SizedBox(height: 24,),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color.fromRGBO(255, 255, 255, 0.2),

                      ),
                      child: Padding(padding: EdgeInsets.all(24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Email', style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(255, 255, 255, 1),

                                ),),
                                SizedBox(height: 8,),
                                TextField(

                                    maxLines: 1,

                                    controller: manage.email,
                                    decoration: InputDecoration(

                                      labelText: 'Enter your email',
                                      labelStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,

                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                          color: Color.fromRGBO(
                                              255, 255, 255, 1),

                                        ),

                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                          color: Color.fromRGBO(
                                              255, 255, 255, 1),

                                        ),

                                      ),
                                    )
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Password', style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(255, 255, 255, 1),

                                ),),
                                SizedBox(height: 8,),
                                TextField(
                                    obscureText: !manage.isvisible,
                                  controller: manage.password,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(onPressed: (){
                                        manage.visible();
                                      }, icon:manage.isvisible?Icon(Icons.visibility):Icon(Icons.visibility_off)),

                                      labelText: 'Enter your password',
                                      labelStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,

                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(

                                            color: manage.iscorect?
                                            Color.fromRGBO(255, 255,255,1)
                                                :Color.fromRGBO(255, 89,99,1)

                                        ),

                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                          color: Color.fromRGBO(
                                              255, 255, 255, 1),

                                        ),

                                      ),
                                    )
                                ),
                                !manage.iscorect?
                                SizedBox(height: 5,)
                                    :SizedBox(height: 0,),
                                !manage.iscorect?
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    manage.iscorect?
                                    Text('')
                                        :Icon(Icons.error,color:Color.fromRGBO(255, 89,99,1) ,),
                                    Text(manage.iscorect?'':'Invalid credentials',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: manage.iscorect?
                                          Color.fromRGBO(255,255,255,1)
                                              :Color.fromRGBO(255, 89,99,1)
                                      ),
                                    ),
                                  ],
                                )
                                    :SizedBox(height: 0,)
                              ],
                            ),
                            SizedBox(height: 20,),
                            Container(
                              width: double.infinity,
                              height: 50,

                              child: ElevatedButton(onPressed: () async {
                                await manage.loginUser(manage.email.text, manage.password.text);
                                manage.checktest(context);
                              },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color.fromRGBO(
                                          75, 57, 239, 1)
                                  ),
                                  child: Text('Login', style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(255, 255, 255, 1)
                                  ),)),
                            ),
                            SizedBox(height: 20,),
                            Text('Forgot Password?', style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color.fromRGBO(255, 255, 255, 1)
                            ),)

                          ],
                        ),
                      ),
                    )

                  ],
                ),),
            ),
          );
        }
      ),
    );
  }
}
