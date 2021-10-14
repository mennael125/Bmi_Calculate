import 'dart:math';

import 'package:bmi_calculate/bmi_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  @override
  bool ismale = true;
  double height=180;
  int weight =40;
  int age=20;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI calculate"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          ismale=true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: ismale ? Colors.blue : Colors.grey[400],
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage("assets/images/male.png"),
                              height: 70,
                              width: 70,)
                            , SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Male",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          ismale=false;
                        });},
                      child: Container(
                        decoration: BoxDecoration(
                            color: !ismale?Colors.blue:Colors.grey[400],

                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage("assets/images/female.png"),height: 70,width: 70,)

                            , SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(20)),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Height",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "${height.round()}",
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.black,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Cm",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Slider(value: height ,min: 80,max:240, onChanged: (value ){
                      setState(() {
                        height=value;
                      });
                    }
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(


                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(20)),
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [ Text(
                          "Age",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "${age}",
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.black,
                                fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row( mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age--;
                                });
                              }
                                ,
                                child:
                                Icon(Icons.remove),
                                mini: true,
                                heroTag: ' age--',
                              ),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },child:
                              Icon(Icons.add),
                                mini: true,
                                heroTag:  'age++',

                              ),
                            ],
                          )


                        ],


                      ),
                    ),
                  ),
                  SizedBox(width: 20,),

                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(20)),
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [ Text(
                          "Weight",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "$weight",
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.black,
                                fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row( mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },child:
                              Icon(Icons.remove),
                                mini: true,
                                heroTag: 'weight--',
                              ),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight++;
                                });

                              },child:
                              Icon(Icons.add),
                                mini: true,
                                heroTag: 'weight++',

                              ),
                            ],
                          )


                        ],


                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(
              onPressed: () {
                var result =weight/pow(height/100, 2);
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)
                  => BmiResult( age: age,
                    gender: ismale ,
                    result: result.round(),),
                  ),

                );


              },
              height: 20,
              child: Text(
                "calculate",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
