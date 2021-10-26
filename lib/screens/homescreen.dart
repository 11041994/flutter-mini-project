

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/constants/app-constant.dart';
import 'package:flutter_app1/widgets/leftbar.dart';
import 'package:flutter_app1/widgets/rightbar.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();

  }

}

class _HomeScreenState  extends State<HomeScreen>{
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiresult = 0;
  String _textresult = "";

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("BMI Calculator",
       style: TextStyle(color: accentHexColor , fontWeight: FontWeight.w300),
       ),
       backgroundColor: Colors.transparent,
       elevation: 0,
       centerTitle: true,
     ),
     backgroundColor: mainHexColor,
     body: SingleChildScrollView(
       child: Column(
         children: [
           SizedBox(height: 20,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Container(

                 width: 130,
                 child: TextField(
                   controller: _heightController,
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     fontSize: 42,
                     fontWeight: FontWeight.w300,
                     color: Colors.yellow,
                   ),
                   keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                     border: InputBorder.none,
                     hintText: "Height",
                     hintStyle: TextStyle(
                       fontSize: 42,
                       fontWeight: FontWeight.w300,
                       color: Colors.yellow,
                     )
                   ),
                 ),
               ),
               Container(
                 width: 130,
                 child: TextField(
                   controller: _weightController,
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     fontSize: 42,
                     fontWeight: FontWeight.w300,
                     color: Colors.yellow,
                   ),
                   keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                       border: InputBorder.none,
                       hintText: "Weight",
                       hintStyle: TextStyle(
                         fontSize: 42,
                         fontWeight: FontWeight.w300,
                         color: Colors.yellow,
                       )
                   ),
                 ),
               )
             ],
           ),
           SizedBox(height: 30,),
           GestureDetector(
             onTap: (){
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiresult = _w / (_h * _h);
                  if(_bmiresult > 25){
                    _textresult = "You\ 're over weight";
                  } else if(_bmiresult>18.5 && _bmiresult<=25){
                    _textresult = "You\ 're normal weight";
                  } else{
                    _textresult = "You\ 're under weight";
                  }
                });
             },
             child: Container(
               child: Text("calculate",style : TextStyle(fontSize: 42,fontWeight: FontWeight.bold,color: Colors.yellow),),
             ),
           ),
           SizedBox(height: 30,),
           Container(
             child: Text(_bmiresult.toStringAsFixed(2),style: TextStyle(fontSize: 50,fontWeight: FontWeight.w300,color: Colors.yellow),),
           ),
           SizedBox(height: 30,),
           Visibility(
             visible: _textresult.isNotEmpty,
             child: Container(
               child: Text(_textresult,style : TextStyle(fontSize: 32,fontWeight: FontWeight.w400,color: Colors.yellow),),
             ),
           ),
           SizedBox(height: 10,),
           LeftBar(barWidth: 40,),
           SizedBox(height: 20,),
           LeftBar(barWidth: 70,),
           SizedBox(height: 20,),
           LeftBar(barWidth: 40,),
           SizedBox(height: 20,),
           RightBar(barWidth: 70,),
           SizedBox(height: 50,),
           RightBar(barWidth: 70,),
         ],
       ),
     ),

   );
  }

}