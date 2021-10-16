import 'dart:math';

import 'package:bmi_with_cubit/modules/bmi/bmi_result.dart';
import 'package:bmi_with_cubit/shared/components/cubit/cubit.dart';
import 'package:bmi_with_cubit/shared/components/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCalculate extends StatelessWidget {
  const BmiCalculate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BmiCubit(),
      child: BlocConsumer<BmiCubit, BmiStates>(
          listener: (context, state) {},
          builder: (context, state) {
            BmiCubit cubit = BmiCubit.get(context);
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
                              onTap: () {
                                cubit.male();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: cubit.isMale
                                        ? Colors.blue
                                        : Colors.grey[400],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image:
                                          AssetImage("assets/images/male.png"),
                                      height: 70,
                                      width: 70,
                                    ),
                                    SizedBox(
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
                            onTap: () {
                              cubit.female();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: !cubit.isMale
                                      ? Colors.blue
                                      : Colors.grey[400],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image:
                                        AssetImage("assets/images/female.png"),
                                    height: 70,
                                    width: 70,
                                  ),
                                  SizedBox(
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
                          )),
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
                                  "${cubit.height.round()}",
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
                            Slider(
                                value: cubit.height,
                                min: 80,
                                max: 240,
                                onChanged: (value) {
                                  cubit.height = value;

                                  cubit.slider();
                                })
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
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
                                    "${cubit.age}",
                                    style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FloatingActionButton(
                                        onPressed: () {
                                          cubit.ageMinus();
                                        },
                                        child: Icon(Icons.remove),
                                        mini: true,
                                        heroTag: ' age--',
                                      ),
                                      FloatingActionButton(
                                        onPressed: () {
                                          cubit.agePlus();
                                        },
                                        child: Icon(Icons.add),
                                        mini: true,
                                        heroTag: 'age++',
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
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
                                    "${cubit.weight}",
                                    style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FloatingActionButton(
                                        onPressed: () {
                                          cubit.weightMinus();
                                        },
                                        child: Icon(Icons.remove),
                                        mini: true,
                                        heroTag: 'weight--',
                                      ),
                                      FloatingActionButton(
                                        onPressed: () {
                                          cubit.weightPlus();
                                        },
                                        child: Icon(Icons.add),
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
                        var result = cubit.weight / pow(cubit.height / 100, 2);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BmiResult(
                              age: cubit.age,
                              gender: cubit.isMale,
                              result: result.round(),
                            ),
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
          }),
    );
  }
}
