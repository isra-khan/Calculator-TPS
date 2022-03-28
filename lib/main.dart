import 'dart:ui';


import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
  }//MyApp

class _MyAppState extends State<MyApp> {
  var result="";
  var colors=Colors.grey[50];

  Widget whiteBtn(var  btextt) {
    return GestureDetector(
      onTap: () {
        setState(() {
          result+=btextt;
        });
      },
      child: ClayContainer(
        color: Colors.black,
        height: 70,
        width: 70,
        borderRadius: 80,
        child: Center(child: Text(
          btextt, style: TextStyle(fontSize: 35, color: Colors.white,fontFamily: 'Quicksand' ),),),),
    );
  }//BlackBtn
  Widget blackBtn(var  btextt) {
    return GestureDetector(
      onTap: () {
        setState(() {
          result+=btextt;
        });
      },
      child: ClayContainer(
        color: Colors.white,
        height: 70,
        width: 70,
        borderRadius: 80,
        child: Center(child: Text(
          btextt, style: TextStyle(fontSize: 35, color: Colors.black,fontFamily: 'Quicksand' ),),),),
         );
         }//BlackBtn

  Widget btn(var  textt) {

    return GestureDetector(
      onTap: () {
        if(textt=='AC') {
           setState(() {
            result = "";
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
        color: Colors.white,
        height: 70,
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

  Widget orangeBtn(var  textt) {
    return GestureDetector(
      onTap: () {
        setState(() {
            if(textt=='x')
               result=result+"*";
           else if(textt=="÷")
              result=result+"/";
         else result=result+textt;
        });
      },
      child: ClayContainer(
        color: Colors.white,
        height: 70,
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
        result=eval.toString();
      });
      }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData.light(),
      darkTheme: ThemeData.dark(),

      debugShowCheckedModeBanner: false,
      home:SafeArea(child:Scaffold(

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

                  btn("AC"),
                  btn("+/-"),
                  btn("%"),
                  orangeBtn("÷"),

                ],

              ),
              SizedBox(height:20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  blackBtn("7"),
                  blackBtn("8"),
                  blackBtn("9"),
                  orangeBtn("x")

                ],
              ),
              SizedBox(height:20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  blackBtn("4"),
                  blackBtn("5"),
                  blackBtn("6"),
                  orangeBtn("-")

                ],
              ),
              SizedBox(height:20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  blackBtn("1"),
                  blackBtn("2"),
                  blackBtn("3"),
                  orangeBtn("+"),



                ],
              ),

              SizedBox(height:20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  GestureDetector(
                    onTap: () {
                    setState(() {
                      result=result+"0";
                      colors=Colors.grey[50];

                    });


                    },
                    onLongPress: (){
                      setState(() {
                        colors=Colors.black;
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

                  blackBtn("."),
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
      ),
      ),
    );


  }
}//mainclass



