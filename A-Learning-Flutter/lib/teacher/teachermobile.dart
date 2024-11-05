import 'package:flutter/material.dart';
class Teachermobile extends StatefulWidget {
  const Teachermobile({super.key});

  @override
  State<Teachermobile> createState() => _TeachermobileState();
}

class _TeachermobileState extends State<Teachermobile> {
  List<module> m1=[];
  List<module> add(){
    module m=module("Introduction to Programming", "Learn the basics of programming with Python");
    module m2=module("Web Development Fundamentals", "HTML, CSS, and JavaScript essentials");
    m1.add(m);
    m1.add(m2);
    return m1;
  }
  List<assign> a=[];
  List<assign> adda(){
    assign a1=assign("John Doe", "Intro to Programming - PW1", "Submitted");
    assign a2=assign("Jane Smith", "Web Dev Fundamentals - PW2", "Late");
    a.add(a1);
    a.add(a2);
    return a;
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column( //mother layout
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:EdgeInsets.only(left: 24,right: 24),
              child:Container(
                width: double.infinity,
                height: 200,
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
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Teacher Dashboard",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.white),),
                      Text("Manage your modules and student submissions",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Color.fromRGBO(224, 224, 224, 1)),)
                    ],

                  ),
                ),
              ),


            ),
            Padding(padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(16), // Optional: Rounded corners
                    shadowColor: Colors.grey.withOpacity(0.5),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(16),

                      ),
                      child: Padding(padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("My Modules",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
                              ],
                            ),
                            SizedBox(height: 16,),
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                itemCount: add().length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Container(
                                        width:double.infinity ,
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(240, 240, 240, 1),
                                            borderRadius: BorderRadius.circular(8)
                                        ),
                                        child: Padding(padding: EdgeInsets.all(16),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(m1[index].name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                                                  IconButton(onPressed: (){}, icon: Icon(Icons.chevron_right,color: Color.fromRGBO(75, 57, 239, 1),size: 24,))
                                                ],
                                              ),
                                              SizedBox(height: 8,),
                                              Text(m1[index].description,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Color.fromRGBO(87, 99, 108, 1)),)
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16,)
                                    ],
                                  );
                                },


                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24,),
                  Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(16), // Optional: Rounded corners
                    shadowColor: Colors.grey.withOpacity(0.5),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color.fromRGBO(255, 255, 255, 1),

                      ),
                      child: Padding(padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Recent Submissions",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
                                ElevatedButton(onPressed: (){},
                                    style:ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        backgroundColor: Color.fromRGBO(75, 57, 239, 1)) ,
                                    child: Text("View All",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 12),))
                              ],
                            ),
                            SizedBox(height: 16,),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Filter by:",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color.fromRGBO(87, 99, 108, 1)),),
                                Container(
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(240, 240, 240, 1),

                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child:Padding(padding: EdgeInsets.only(left: 8,right: 8,bottom: 12,top: 12) ,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("All Modules",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,),),
                                        Icon(Icons.arrow_drop_down,color: Color.fromRGBO(75, 57, 239,1),size: 20,)
                                      ],
                                    ),
                                  ),

                                )
                              ],
                            ),
                            SizedBox(height: 16,),
                            SizedBox(
                              height: 100,
                              child: ListView.builder(
                                itemCount: adda().length,
                                itemBuilder: (BuildContext context, int index) {
                                  Color containerColor;
                                  Color textcolor;
                                  switch (a[index].condition) {
                                    case "Late":
                                      textcolor=Color.fromRGBO(255, 111, 0, 1);
                                      containerColor=Color.fromRGBO(255, 248, 225, 1);
                                      break;
                                    case "Submitted":
                                      textcolor=Color.fromRGBO(46, 125, 50, 1);
                                      containerColor = Color.fromRGBO(232, 245, 233, 1);
                                      break;
                                    case "notSubmitted":
                                      containerColor = Colors.orange;
                                      textcolor=Colors.red;
                                      break;
                                    default:
                                      containerColor = Colors.grey;
                                      textcolor=Colors.grey;// Default color if no match
                                  }

                                  return Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(240, 240, 240, 1),
                                            borderRadius: BorderRadius.circular(8)
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(a[index].name,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                                                Text(a[index].subject,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color.fromRGBO(87, 99, 108,1)),)

                                              ],
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(12),
                                                  color: containerColor
                                              ),
                                              child: Text(a[index].condition,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: textcolor),),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 12,)
                                    ],
                                  );
                                },

                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24,),
                  Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(16), // Optional: Rounded corners
                    shadowColor: Colors.grey.withOpacity(0.5),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(16),

                      ),
                      child: Padding(padding: EdgeInsets.all(20),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Add/Modify Practical Work",style: TextStyle(
                                fontSize: 24,fontWeight: FontWeight.w600
                            ),),
                            SizedBox(height: 16,),
                            TextField(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Color.fromRGBO(224, 224, 224, 1)),
                                  ),
                                  filled: true,
                                  fillColor: Color.fromRGBO(240, 240, 240, 1),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color:  Color.fromRGBO(224, 224, 224, 1)), // Border color when focused
                                  ),
                                  labelText: 'PW Title',
                                  floatingLabelStyle: TextStyle(color: Colors.black),
                                  labelStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 14)

                              ),
                            ),
                            SizedBox(height: 16,),
                            TextField(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Color.fromRGBO(224, 224, 224, 1)),
                                  ),
                                  filled: true,
                                  fillColor: Color.fromRGBO(240, 240, 240, 1),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color:  Color.fromRGBO(224, 224, 224, 1)), // Border color when focused
                                  ),
                                  labelText: 'Description',
                                  floatingLabelStyle: TextStyle(color: Colors.black),
                                  labelStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 14)

                              ),
                            ),
                            SizedBox(height: 16,),
                            TextField(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Color.fromRGBO(224, 224, 224, 1)),
                                  ),
                                  filled: true,
                                  fillColor: Color.fromRGBO(240, 240, 240, 1),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color:  Color.fromRGBO(224, 224, 224, 1)), // Border color when focused
                                  ),
                                  labelText: 'Due Date',
                                  floatingLabelStyle: TextStyle(color: Colors.black),
                                  labelStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 14)

                              ),
                            ),
                            SizedBox(height: 16,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ElevatedButton(onPressed: (){},

                                  child:Text("Attach Files",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,

                                      color: Color.fromRGBO(75, 57, 239, 1)),),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)
                                      )
                                  ),
                                ),
                                ElevatedButton(onPressed: (){},

                                  child:Text("Save Draft",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,

                                      color: Color.fromRGBO(75, 57, 239, 1)),),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)
                                      )
                                  ),
                                ),
                                ElevatedButton(onPressed: (){},

                                  child:Text("Publish",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,

                                      color: Colors.white),),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color.fromRGBO(75, 57, 239, 1),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)
                                      )
                                  ),
                                ),
                              ],
                            )
                          ],
                        ) ,

                      ),
                    ),
                  ),
                  SizedBox(height: 24,),
                  Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(16), // Optional: Rounded corners
                    shadowColor: Colors.grey.withOpacity(0.5),
                    child:Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Student Feedback",style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24

                            ),),
                            SizedBox(height: 16,),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color.fromRGBO(240, 240, 240,1)
                              ),
                              child: Padding(padding: EdgeInsets.all(16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("John Doe - Intro to Programming PW1",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),

                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(232, 245, 233, 1),
                                              borderRadius: BorderRadius.circular(12)
                                          ),
                                          child: Padding(padding: EdgeInsets.only(left: 4,right: 4,top: 8,bottom: 4),
                                            child: Text("Submitted",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Color.fromRGBO(45, 125, 50, 1)),),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 16,),
                                    TextField(
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            borderSide: BorderSide(color: Color.fromRGBO(224, 224, 224, 1)),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color:  Color.fromRGBO(224, 224, 224, 1)), // Border color when focused
                                          ),
                                          labelText: 'Description',
                                          floatingLabelStyle: TextStyle(color: Colors.black),
                                          labelStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 14)

                                      ),
                                    ),
                                    SizedBox(height: 16,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        ElevatedButton(onPressed: (){},

                                          child:Text("Save Draft",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,

                                              color: Color.fromRGBO(75, 57, 239, 1)),),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromRGBO(240, 240, 240, 1),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20)
                                              ),
                                              elevation: 0
                                          ),
                                        ),
                                        ElevatedButton(onPressed: (){},

                                          child:Text("Publish",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,

                                              color: Colors.white),),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromRGBO(75, 57, 239, 1),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20)
                                              )
                                          ),
                                        ),

                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
class module{
  late String name ;
  late String description ;
  module(String name,String description){
    this.name=name;
    this.description=description;

  }
}
class assign{
  late String name;
  late String subject;
  late String condition;
  assign(String name,String subject,String condition){
    this.name=name;
    this.condition=condition;
    this.subject=subject;
  }
}
