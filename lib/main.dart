import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delievery/colors.dart';
import 'package:food_delievery/quiz_screen.dart';
import 'package:food_delievery/text_style.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      home: MyHome(),
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
    );
  }
}

class MyHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(1),
        child: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [blue,darkblue],
                begin: Alignment.center,
                end: Alignment.center,
              ),
            ),
              
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
             
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: lightgrey, width: 2),
                  ),
                child: IconButton(
                onPressed: (){},
               icon: Icon(CupertinoIcons.xmark, color: Colors.white70,))),
               Image.asset('assets/images/balloon2.png', height: 300,width: 300,),
               SizedBox(height:20),
               Padding(
                 padding: const EdgeInsets.all(6.0),
                 child: normaltext(text: 'Welcome to The', color: Colors.white, size: 20),
               ),
               Padding(
                 padding: const EdgeInsets.all(5.0),
                 child: headingtext1(text: "Quiz App", color: Colors.white, size: 30),
               ),
               SizedBox(height: 5,),
               normaltext(text: 'Get yourself ready for the awesome quiz :)\n Wish you Best of luck', color: Colors.white, size: 18),
               SizedBox(height: 5,),
               const Spacer(),
               GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> MyQuizScreen()));
                },
                 child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  alignment: Alignment.center,
                  width: double.infinity-100,
                  decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(10),
               
                  ),
                  child: headingtext1(text: 'Continue', size: 30),
               
                 ),
               ),
             
        
              ],
            ),
          ),
        ),
      ),

    );
  }
}