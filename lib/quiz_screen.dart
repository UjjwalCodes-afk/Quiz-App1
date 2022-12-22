import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delievery/colors.dart';
import 'package:food_delievery/main.dart';
import 'package:food_delievery/services.dart';
import 'package:food_delievery/text_style.dart';
class MyQuizScreen extends StatefulWidget {
  const MyQuizScreen({ Key? key }) : super(key: key);

  @override
  State<MyQuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<MyQuizScreen> {
  int seconds = 60;
  Timer? timer;
  var currentquestionindex = 0;
  late Future quiz;
  var isloaded = false;
  var optionlist = [];

  var optionscolor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  
  ];

  starttimer(){
    timer = Timer.periodic(Duration(seconds: 1), (timer){
      setState(() {
        if(seconds>0){
          seconds--;
        }else{
          timer.cancel();
        }
        
      });
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quiz = getquiz();
    starttimer();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    timer!.cancel();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [blue,darkblue],
              begin: Alignment.center,
              end: Alignment.center,
            )
          ),
          child: FutureBuilder(
            future: quiz,
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.hasData){
                var data = snapshot.data["results"];

                if(isloaded==false){
                  optionlist = data[currentquestionindex]["incorrect_answers"];
                  optionlist.add(data[currentquestionindex]["correct_answer"]); 
                  optionlist.shuffle();
                  isloaded = true;
                }




                return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: lightgrey,
                        
                      ),
                      child: IconButton(
                      
                        onPressed: (){
                          Navigator.pop(context);
          
                        },
                      icon: Icon(CupertinoIcons.xmark),),
                    ),
                    SizedBox(width: 10,),
                
                    Stack(
                      alignment: Alignment.center,
                  
                      children: [
                        normaltext(color: Colors.white, size: 30, text: '$seconds'),
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: CircularProgressIndicator(
                            value: seconds/60,
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                        )
                      ],
                    ),
                    Container(
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: lightgrey, width: 2),
                      ),
                      child: TextButton.icon(onPressed: null, icon: Icon(CupertinoIcons.heart_fill, color: Colors.white,), label: normaltext(color: Colors.white, text: 'Like', size: 20),
                    ),),
          
                  ],
                ),
                SizedBox(height: 10,),
                Image.asset('assets/images/ideas.png', height: 200, width: 200,),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.topLeft,
                child: normaltext(text: 'Question ${currentquestionindex+1} of ${data.length}', color: Colors.white, size: 20)),
                normaltext(text: data[currentquestionindex]["question"], color: Colors.white, size: 20),
                SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: optionlist.length,
                  itemBuilder: (BuildContext context,int index){
                    var answer = data[currentquestionindex]["correct_answer"];
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          if(answer.toString()==optionlist[index].toString()){
                            print('Correct');
                            optionscolor[index] = Colors.green;
                            
                          }else{
                            optionscolor[index] = Colors.red;
                          }
                          if(currentquestionindex< data.length){
                            Future.delayed(Duration(seconds: 1), (){
                              print("incorrect");
                            currentquestionindex++;
                            

                          }
                        );

                          }
                          
                      });
                      },
                    
                      child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      alignment: Alignment.center,
                      width: double.infinity-100,
                      decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(10),
                                     
                      ),
                      child: headingtext1(text: optionlist[index].toString(), size: 30),
                                     
                                       ),
                    ) ;
                  },
                ),
              ],
            ),
          );
              }
              else{
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),

                );

              }

            

            },
          ),  
        ),
      ),
    );
  }
}