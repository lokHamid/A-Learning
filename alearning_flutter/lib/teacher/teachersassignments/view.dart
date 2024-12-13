
import 'package:a_learning/teacher/teachersassignments/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class teachersassignui extends StatelessWidget {
  const teachersassignui({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=>Teacherassignments()..Fetchdatat(),
    child: Material(
        elevation: 2,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(16)
        ),
        child: Padding(padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Published Assignments",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
            SizedBox(height: 16,),
            Consumer<Teacherassignments>(builder: (context,teachass,child){
              if(teachass.isloading){
                return Center(child: CircularProgressIndicator(color:Color.fromRGBO(75, 57, 239,1) ,),);
              }
              if(teachass.assign==null){
                return Center(child: Text("Nothing to show",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),);
              }else{
               return SizedBox(
                 height: 200,
                 child: ListView.builder(
                     itemCount: teachass.assign.length,
                     itemBuilder: (context,index){
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(241, 244, 248, 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(padding: EdgeInsets.all(6),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Lab '+(index+1).toString()+':'+teachass.assign![index].pwname,style: TextStyle(
                                    fontWeight:FontWeight.w600,
                                    fontSize: 18
                                  ),),

                                  SizedBox(height: 12,),
                                  Text(teachass.assign[index].objectives ?? '',style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(87, 99, 108, 1)
                                  ),)
                                ],
                              ),
                            ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ElevatedButton(onPressed: (){
                                    teachass.change(teachass.t1, teachass.assign[index].pwname);
                                    teachass.change(teachass.t2, teachass.assign[index].objectives?? "");
                                    teachass.change(teachass.t3, teachass.assign[index].steps);
                                    showDialog(context: context, builder:(BuildContext context){
                                      return AlertDialog(
                                       insetPadding: EdgeInsets.zero,
                                        content:Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(padding: EdgeInsets.only(left: 12,right: 12),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("Edit Assignment",style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 24,
                                                ),),
                                                SizedBox(
                                                  height: 40,
                                                  width: 40,
                                                  child: IconButton(onPressed: (){
                                                    Navigator.of(context).pop();
                                                  },icon: Icon(Icons.close_rounded,size: 24,color: Color.fromRGBO(87, 99, 108, 1),)))
                                              ],
                                            ),
                                            ),
                                            SizedBox(height: 16,),
                                            Container(
                                              width: double.infinity,
                                              decoration:  BoxDecoration(
                                                color: Color.fromRGBO(224, 227, 231,1),
                                                borderRadius: BorderRadius.circular(8)
                                              ),
                                              child: Padding(padding: EdgeInsets.all(12),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  TextButton(onPressed: (){}, child:Row(
                                                    children: [
                                                      Icon(Icons.attach_file_rounded,size: 24,color: Color.fromRGBO(87, 99, 108, 1),),
                                                      SizedBox(width: 10,),
                                                      Text(teachass.assign[index].pwname,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),

                                                    ],
                                                  )
                                                  ),
                                                  IconButton(onPressed: (){}, icon: Icon(Icons.close_rounded,size: 16,color: Color.fromRGBO(87, 99, 108,1),))
                                                ],

                                              ),

                                              ),

                                            ),
                                            SizedBox(height: 16,),
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(224, 227, 231,1),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(8),
                                                    borderSide: BorderSide(
                                                      color: Color.fromRGBO(224, 227, 231,1),
                                                    ),

                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(8),
                                                    borderSide: BorderSide(
                                                      color: Color.fromRGBO(224, 227, 231,1),
                                                    ),

                                                  ),
                                                labelText: 'Assignment Title',
                                                labelStyle: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14
                                                )
                                                ),
                                                controller: teachass.t1,

                                              ),
                                            ),
                                            SizedBox(height: 16,),
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(224, 227, 231,1),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(8),
                                                      borderSide: BorderSide(
                                                        color: Color.fromRGBO(224, 227, 231,1),
                                                      ),

                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(8),
                                                      borderSide: BorderSide(
                                                        color: Color.fromRGBO(224, 227, 231,1),
                                                      ),

                                                    ),
                                                    labelText: 'Objectives',
                                                    labelStyle: TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14
                                                    )
                                                ),
                                               controller: teachass.t2,
                                              ),
                                            ),
                                            SizedBox(height: 16,),
                                            Container(
                                              constraints: BoxConstraints(
                                                maxHeight: 100
                                              ),
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(224, 227, 231,1),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: TextField(

                                                decoration: InputDecoration(
                                                    enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(8),
                                                      borderSide: BorderSide(
                                                        color: Color.fromRGBO(224, 227, 231,1),
                                                      ),

                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(8),
                                                      borderSide: BorderSide(
                                                        color: Color.fromRGBO(224, 227, 231,1),
                                                      ),

                                                    ),
                                                    labelText: 'Steps',
                                                    labelStyle: TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14
                                                    ),

                                                ),
                                                maxLines: null,
                                                controller: teachass.t3,

                                              ),
                                            ),
                                            SizedBox(height: 16,),
                                            Container(
                                              height: 48,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),

                                              ),
                                              child: ElevatedButton(onPressed: (){
                                                teachass.changes(teachass.assign[index].pwid, index);
                                                Navigator.of(context).pop();
                                              }, child:Text("Save Changes",style:
                                                TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white),)
                                              ,style: ElevatedButton.styleFrom(
                                                backgroundColor: Color.fromRGBO(75, 57, 239,1),
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                                                ),),

                                            )
                                          ],
                                        ) ,
                                      );
                                    });

                                  },style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromRGBO(75,57 , 239, 1),
                                    fixedSize: Size(40, 40),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),

                                    ),
                                    padding: EdgeInsets.zero
                                  ) ,child:Icon(Icons.edit_sharp,size: 24,color: Colors.white,)),

                              SizedBox(width: 10,),
                              ElevatedButton(
                                onPressed: () {
                                  teachass.Removedata(teachass.assign[index].pwid, index);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromRGBO(255, 89, 99, 1),
                                  fixedSize: Size(40, 40), // Ensure the button has equal width and height for square shape
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  padding: EdgeInsets.zero, // Remove extra padding that could misalign the icon
                                ),
                                child: Icon(
                                  Icons.delete,
                                  size: 24,
                                  color: Colors.white,
                                ),
                              )
                              ]
                              ),
                            ],
                          ),
                          ),
                        ),
                        SizedBox(height: 16,),
                      ],
                    );
                 }),
               );
              }
            })
          ],
        ),
        ),
      ),
    ),

    );
  }
}
