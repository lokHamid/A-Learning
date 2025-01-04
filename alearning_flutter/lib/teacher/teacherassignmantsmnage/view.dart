

import 'package:a_learning/teacher/teacherassignmantsmnage/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../teachersassignments/viewmodel.dart';
import 'model.dart';
class Teacheraddassignment extends StatelessWidget {
 final String coursename;
  const Teacheraddassignment({super.key, required this.coursename});
  @override
  Widget build(BuildContext context) {
    final viewmodel=Provider.of<teacherassignmanag>(context);
    DateTime? picked;
    return ChangeNotifierProvider(
      create:(_)=>Teacherassignments(),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("Add Practical Work",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
                    Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(75, 57, 230,1),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: IconButton(onPressed: () async {
                          picked=await showDatePicker(context: context,initialDate: DateTime.now(), firstDate:DateTime.now(), lastDate:DateTime(2100),
                            builder: (BuildContext context, Widget? child) {
                              return Theme(
                                data: ThemeData.light().copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary: Color.fromRGBO(75, 57, 239, 1), // Header background color
                                   onPrimary: Colors.white, // Header text and icon color
                                    onSurface: Colors.black,

                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Color.fromRGBO(75, 57, 239, 1), // Button text color
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                          viewmodel.s1?.submissiondeadline=picked;


                        },color: Color.fromRGBO(75, 57, 239,1), icon:Icon(Icons.edit_calendar_rounded,color: Colors.white,size: 24,),)),

                  ],
                ),
                SizedBox(height: 16,),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(240, 240, 240, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: viewmodel.t1,
      onChanged: (value) {
      if (value.endsWith('\n')) {
      viewmodel.addBulletPoint(viewmodel.t1);
      }},
                      decoration: InputDecoration(
                        labelText: 'PW Title',
                        labelStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(224, 224, 224,1),

                          ),

                        ),

                          fillColor:  Color.fromRGBO(240, 240, 240,1),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(224, 224, 224,1),
                          ),
                          borderRadius: BorderRadius.circular(8)
                        )
                      ),
                  ),
                ),
                SizedBox(height: 16,),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(240, 240, 240, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  constraints: BoxConstraints(
                    maxHeight: 100,
                  ),
                  child: TextField(
                    controller: viewmodel.t2,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    onChanged: (value) {
                      if (value.endsWith('\n')) {
                        viewmodel.addBulletPoint(viewmodel.t2);
                      }},
                    decoration: InputDecoration(
                        labelText: 'Objectives',
                        labelStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(224, 224, 224,1),

                          ),

                        ),
                        fillColor:  Color.fromRGBO(224, 224, 224,1),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(224, 224, 224,1),
                            ),
                            borderRadius: BorderRadius.circular(8)
                        )
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(240, 240, 240, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  constraints: BoxConstraints(
                    maxHeight: 100,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    controller: viewmodel.t3,
                    maxLines: null,
      onChanged: (value) {
        if (value.endsWith('\n')) {
          viewmodel.addBulletPoint(viewmodel.t3);
        }
      },
                    decoration: InputDecoration(
                        labelText: 'Steps',
                        labelStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(224, 224, 224,1),

                          ),

                        ),
                        fillColor:  Color.fromRGBO(224, 224, 224,1),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(224, 224, 224,1),
                            ),
                            borderRadius: BorderRadius.circular(8)
                        )
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(240, 240, 240, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  constraints: BoxConstraints(
                    maxHeight: 100,
                  ),
                  child: TextField(
                    controller: viewmodel.t4,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    onChanged: (value) {
                      if (value.endsWith('\n')) {
                        viewmodel.addBulletPoint(viewmodel.t2);
                      }},
                    decoration: InputDecoration(
                        labelText: 'Materials',
                        labelStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(224, 224, 224,1),

                          ),

                        ),
                        fillColor:  Color.fromRGBO(224, 224, 224,1),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(224, 224, 224,1),
                            ),
                            borderRadius: BorderRadius.circular(8)
                        )
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(onPressed: () async {viewmodel.pickedFiles= await viewmodel.pickfile();},style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(240, 240, 240,1),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),child:Text("Attach Files",
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color.fromRGBO(75, 57, 239, 1)),
                      ),),

                    ),
                    SizedBox(width: 24,),
                    SizedBox(
                      height: 40,
                      width: 120,

                      child: Consumer<Teacherassignments>(
                        builder: (BuildContext context, techass, Widget? child) {
                          return ElevatedButton(onPressed: () async {

                            if (viewmodel.s1?.file != null) {
                              if (viewmodel.s1?.file?.isEmpty ?? true) {
                                print("No files to upload.");
                              } else {
                                if (viewmodel.pickedFiles != null && viewmodel.pickedFiles!.isNotEmpty) {
                                  for (int i = 0; i < viewmodel.pickedFiles!.length; i++) {
                                    String s = await viewmodel.uploadFileToBackendWeb(viewmodel.pickedFiles![i]);
                                    if (s.isEmpty) {
                                      print("File upload failed for file ${viewmodel.pickedFiles![i]}");
                                    } else {
                                      viewmodel.s1!.file?[i].url=s;
                                    }
                                  }
                                } else {
                                  print("No files selected for upload.");
                                }
                              }
                            } else {
                              print("No file found in s1.");
                            }
                             viewmodel.s1?.pwname=viewmodel.t1.text;
                            viewmodel.s1?.materials=viewmodel.t4.text;
                            viewmodel.s1?.objectives=viewmodel.t3.text;
                            viewmodel.s1?.steps=viewmodel.t2.text;
                            viewmodel.s1?.coursename=coursename;
                            viewmodel.s1?.pwid=4;
                            viewmodel.sendAssignment(viewmodel.s1);

                          }, child:Text("Publish",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Colors.white),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(75, 57, 239, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),

                              ),

                            ),
                          );
                        },

                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
