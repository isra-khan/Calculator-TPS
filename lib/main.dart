import 'dart:ui';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {

 // const MyApp({Key? key}) : super(key: key);


  @override
  State<MyApp> createState() => _MyAppState();
  }//MyApp

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
     //themeMode:ThemeMode.system,
      //theme: ThemeClass.lightTheme,
      //darkTheme: ThemeClass.darkTheme,


    debugShowCheckedModeBanner: false,

      home: CalculatorScreen(),
    );



  }
}//mainclass
 class CalculatorScreen extends StatefulWidget {

   const CalculatorScreen({Key? key}) : super(key: key);


   @override
   State<CalculatorScreen> createState() => _CalculatorScreenState();
 }

 class _CalculatorScreenState extends State<CalculatorScreen> {
   String expression="";
  //var firstVal;
  //var secondVal;
   var result="0";
   var colors=Colors.grey[50];
   bool isDark=false;
   Widget whiteBtn(var  btextt) {
     return GestureDetector(
       onTap: () {
         setState(() {
           result+=btextt;
         });
       },
       child: ClayContainer(
         color: Colors.black,
         height: 75,
         width: 70,
         borderRadius: 80,
         child: Center(child: Text(
           btextt, style: TextStyle(fontSize: 35, color: Colors.white,fontFamily: 'Quicksand' ),),),),
     );
   }//whiteBtn
   Widget blackBtn(var  btextt,Color bgColor,Color fontColor) {
     return GestureDetector(
       onTap: () {
         setState(() {
         if(result=="0") result="";
          result += btextt;
         if(result.substring(result.length-1)=="."&&(result.substring(result.length-1)=="."))
           result="";




         }
       );},
  child: ClayContainer(
         color: bgColor,
         height: 75,
         width: 70,
         borderRadius: 80,
         child: Center(child: Text(
           btextt, style: TextStyle(fontSize: 35, color:fontColor,fontFamily: 'Quicksand' ),),),),
     );
   }//BlackBtn

   Widget btn(var  textt,Color bgColor) {

     return GestureDetector(
       onTap: () {
         if(textt=='AC') {
           setState(() {
             result = "0";
           });
         }
         else if(textt=='+/-') {
           if (result[0] != "-") {
             setState(() {
               result = "-" + result;
             });
           }
           else {
             setState(() {
               result = result.substring(1);
             });
           }
         }//else if
         else if(textt=='%') {
           setState(() {
             result+= "%";
           });

         }//else if

       },//ontap


       child: ClayContainer(
         color: bgColor,
         height: 90,
         width: 70,
         borderRadius: 80,

         child: Center(child: Text(
           textt, style: TextStyle(fontSize: 35, color: Colors.grey,fontFamily: 'Montserrat'
         ),
         ),
         ),
       ),
     );
   }//btn widget

   Widget orangeBtn(var  textt,Color bgColor) {
     return GestureDetector(
       onTap: () {

         setState(() {
           if(result=="0") result="";
           if(textt=='x') {
             if (result.endsWith("*")) {
               result = result + "*";
             }
           }
           else if(textt=="÷") {


             result = result + "/";
           }

           else if(textt=="+"){

               result = result +  "+";


           }

           else if(textt=="-"){
           result=result+ "-";
           }



         });
       },
       child: ClayContainer(
         color: bgColor,
         height: 80,
         width: 70,
         borderRadius: 80,
         child: Center(child: Text(
           textt, style: TextStyle(fontSize: 45, color: Colors.deepOrangeAccent,fontFamily: 'Montserrat' ),),),),
     );
   }//orangebtn
   output(){

     Parser p=new Parser();
     Expression exp=p.parse(result);
     ContextModel cm=new ContextModel();
     double eval=exp.evaluate(EvaluationType.REAL, cm);

     setState(() {
       result=result.toString();
     });
   }


   @override
   Widget build(BuildContext context) {
     var brightness = MediaQuery.of(context).platformBrightness;
     bool darkModeOn = brightness == Brightness.dark;
     if (darkModeOn) {
       print("Dark Mode Check: $darkModeOn");
       isDark = true;
     }

     return SafeArea(child:Scaffold(
     backgroundColor: colors,
     body:Container(
         child:SingleChildScrollView(
         child:Column(
         children: [
         SingleChildScrollView(
         scrollDirection: Axis.horizontal,
         child:Container(
         padding: EdgeInsets.fromLTRB(20,40, 0, 0),
     child: Text(result,
     style:TextStyle(
     fontSize: 100,
     decoration: TextDecoration.none,
     fontFamily: 'IBM Plex Sans Arabic',
     ),
     ),
     ),
     ),
     Row(
     mainAxisAlignment: MainAxisAlignment.spaceAround,
     children:
     [

     btn("AC",Colors.white),
     btn("+/-",Colors.white),
     btn("%",Colors.white),
     orangeBtn("÷",Colors.white),

     ],

     ),
     SizedBox(height:20,),

     Row(
     mainAxisAlignment: MainAxisAlignment.spaceAround,
     children: [
     blackBtn("7",Colors.white,Colors.black),
     blackBtn("8",Colors.white,Colors.black),
     blackBtn("9",Colors.white,Colors.black),
     orangeBtn("x",Colors.white)

     ],
     ),
     SizedBox(height:20,),
     Row(
     mainAxisAlignment: MainAxisAlignment.spaceAround,
     children: [
     blackBtn("4",Colors.white,Colors.black),
     blackBtn("5",Colors.white,Colors.black),
     blackBtn("6",Colors.white,Colors.black),
     orangeBtn("-",Colors.white)

     ],
     ),
     SizedBox(height:20,),

     Row(
     mainAxisAlignment: MainAxisAlignment.spaceAround,
     children: [

     blackBtn("1",Colors.white,Colors.black),
     blackBtn("2",Colors.white,Colors.black),
     blackBtn("3",Colors.white,Colors.black),
     orangeBtn("+",Colors.white),



     ],
     ),

     SizedBox(height:20,),
     Row(
     mainAxisAlignment: MainAxisAlignment.spaceAround,
     children: [

     GestureDetector(
     onTap: () {
     setState(() {
       if(result.substring(0)=="0"){
         result="0";
       }
     else {
         result = result + "0";
       }
     colors=Colors.grey[50];

     });


     },
     onLongPress: (){
     setState(() {
     // colors=Colors.black;
       isDark = !isDark;
       print(isDark);
     whiteBtn("");
     });

     },


     child: ClayContainer(

     color: Colors.white,
     height: 70,
     width: 200,
     borderRadius: 80,

     child: Center(child: Text(
     "0", style: TextStyle(fontSize: 30, color: Colors.black,fontFamily: 'Quicksand' ),
     ),
     ),

     ),

     ),

     blackBtn(".",Colors.white,Colors.black),
     GestureDetector(
     onTap: () {
     output();
     },
     child: ClayContainer(
     color: Colors.white,
     height: 70,
     width: 70,
     borderRadius: 80,
     child: Center(child: Text(
     "=", style: TextStyle(fontSize: 30, color: Colors.deepOrangeAccent,fontFamily: 'Montserrat' ),
     ),
     ),
     ),
     )
     ],
     ),

     ],
     ),
     ),

     ),
     )
     );
   }
 }



