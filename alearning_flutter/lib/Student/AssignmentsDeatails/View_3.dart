import 'package:a_learning/Student/AssignmentsDeatails/Viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Assignmentsfiles extends StatelessWidget {
  const Assignmentsfiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Details>(builder:(BuildContext context,detail,child){
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromRGBO(241, 244,248,1),
        ),
        child: Padding(padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(left: 12,
                right: 12,
              ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Assignment: '+detail.assign.pwname,style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,

                        ),),
                        detail.assigndeadline(detail.assign.submissiondeadline),

                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16,),
              Container(
                constraints: BoxConstraints(maxHeight: 100),
                child: ListView.builder(
                  itemCount:detail.assign.pw?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Padding(padding: EdgeInsets.all(12),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromRGBO(224,227,231,1),

                            ),
                            child: Padding(padding: EdgeInsets.all(12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                    detail.determinIcon(detail.assign.pw?[index].url),
                                  SizedBox(width: 12,),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                      Text(detail.assign.pw![index].name,style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,

                                      ),)
                                       ],
                                    ),

                                  ),
                                  SizedBox(height: 12,),
                                  ElevatedButton(onPressed: (){
                                    detail.launchurl(detail.assign.pw![index].url);
                                  },
                                   style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromRGBO(75, 57,239,1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)
                                    )
                                   )
                                  ,child:Text('View',style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color.fromRGBO(255,255,255,1)
                                  ),)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16,)
                      ],
                    );
                  },

                ),
              ),
              SizedBox(height: 16,),
              Padding(padding: EdgeInsets.only(left: 12,right: 12),
              child: Text('Helpful Resources:',style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),),
              ),
              SizedBox(height: 16,),
              Container(
                constraints: BoxConstraints(
                  maxHeight: 100
                ),
                child: ListView.builder(
                  itemCount:detail.assign.file?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Padding(padding: EdgeInsets.all(12),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromRGBO(224,227,231,1),

                            ),
                            child: Padding(padding: EdgeInsets.all(12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  detail.determinIcon(detail.assign.file![index].url),
                                  SizedBox(width: 12,),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(detail.assign.file![index].name,style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,

                                        ),)
                                      ],
                                    ),

                                  ),
                                  SizedBox(height: 12,),
                                  detail.assign.file![index].url.contains('youtube')?
                                      IconButton(onPressed: (){
                                        detail.launchurl(detail.assign.file![index].url);
                                      }, icon:Icon(Icons.open_in_new,size: 24,color: Color.fromRGBO(75, 57,239,1),))
                                      :IconButton(onPressed: (){
                                    detail.launchurl(detail.assign.file![index].url);
                                  }, icon:Icon(Icons.chevron_right,size: 24,color: Color.fromRGBO(75, 57,239,1),))

                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16,)
                      ],
                    );
                  },

                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
