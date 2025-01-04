import 'package:a_learning/Login/Viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(create: (_)=>Loginmanager(),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(75, 57, 239,1), Color.fromRGBO(57, 210, 192,1)], // Gradient colors
                      begin: Alignment.topCenter,  // Starting point of the gradient
                      end: Alignment.bottomCenter, // Ending point of the gradient
                    ),
            
                  ),
                  child: Padding(padding: EdgeInsets.all(24),
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                     SizedBox(height: 100,),
                      Container(
                        padding: EdgeInsets.only(left: 16,
                        right: 16),
                        child: Padding(padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.school,size: 150,color: Color.fromRGBO(255, 255,255,1),),
                            Text('A learning',style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 40,
                              color: Color.fromRGBO(255, 255,255,1),
                            ),),
                          ],
                        ),
                        ),
                      ),
            
                      Padding(padding: EdgeInsets.only(left: 16,right: 16),
                      child: Text('Welcome Back',style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(255, 255,255,1),
            
                      ),),
                      ),
                      Padding(padding: EdgeInsets.only(left: 16,right: 16),
                      child: Text('Sign in to continue',style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 23,color: Color.fromRGBO(224,224,224,1),

                      ),),
                      ),
            
                    ],
                  ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.5,  // Full width of the screen
                  height: MediaQuery.of(context).size.height,
            
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('A Learning',style: TextStyle(
                              fontSize: 44,
                              fontWeight: FontWeight.w700
                            ),),
                            Padding(padding: EdgeInsets.all(24),
                            child: Consumer<Loginmanager>(
                              builder: (BuildContext context, manage, Widget? child) {
                                return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Sign In',style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 28,

                                  ),),
                                  SizedBox(height: 24,),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color:Color.fromRGBO(241, 244, 248,1),
                                          borderRadius: BorderRadius.circular(8)

                                        )


                                        ,child: TextField(

                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                color: Color.fromRGBO(224, 227,231,1)

                                              ),
                                            ),
                                            disabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                  color: Color.fromRGBO(224, 227,231,1)

                                              ),
                                            ),
                                            focusedBorder:  OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                  color: Color.fromRGBO(224, 227,231,1)

                                              ),
                                            ),
                                            fillColor: Color.fromRGBO(241, 244, 248,1),
                                            labelText: 'Email',
                                            labelStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black
                                            )
                                          ),
                                        controller: manage.email,
                                        ),
                                      ),
                                      SizedBox(height: 16,),
                                      Container(
                                        decoration: BoxDecoration(
                                            color:Color.fromRGBO(241, 244, 248,1),
                                            borderRadius: BorderRadius.circular(8)

                                        )
                                        ,

                                        child: TextField(
                                          controller:manage.password
                                         , decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                borderSide: BorderSide(

                                                    color: manage.iscorect?
                                                    Color.fromRGBO(224, 227,231,1)
                                                        :Color.fromRGBO(255, 89,99,1)


                                                ),
                                              ),
                                              disabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                    color: manage.iscorect?
                                                    Color.fromRGBO(224, 227,231,1)
                                                        :Color.fromRGBO(255, 89,99,1)

                                                ),
                                              ),
                                              focusedBorder:  OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                borderSide: BorderSide(
                                                    color: manage.iscorect?
                                                    Color.fromRGBO(224, 227,231,1)
                                                        :Color.fromRGBO(255, 89,99,1)

                                                ),
                                              ),
                                              fillColor: Color.fromRGBO(241, 244, 248,1),
                                              labelText: 'Password',
                                              labelStyle: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                  color: manage.iscorect?
                                                 Colors.black
                                                      :Color.fromRGBO(255, 89,99,1)

                                              ),

                                            suffixIcon: IconButton(onPressed: (){
                                              manage.visible();
                                            }, icon:manage.isvisible?Icon(Icons.visibility):Icon(Icons.visibility_off)),


                                          ),
                                          obscureText: !manage.isvisible,
                                          style: TextStyle(fontSize: 18),
                                        ),

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
                                  SizedBox(height: 24,),
                                  SizedBox(
                                    width:double.infinity,
                                    child: ElevatedButton(onPressed: () async {
                                    await manage.loginUser(manage.email.text, manage.password.text);
                                     manage.checktest(context);
                                    }, child:Text('Sign In',style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color.fromRGBO(255, 255, 255,1)
                                    ),),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color.fromRGBO(75, 57, 239,1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25)
                                      )
                                    ),
                                    ),
                                  )
                                ],
                              );  },

                            ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}
