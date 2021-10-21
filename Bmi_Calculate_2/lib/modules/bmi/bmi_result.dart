import 'package:bmi_with_cubit/shared/components/cubit/cubit.dart';
import 'package:bmi_with_cubit/shared/components/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiResult extends StatelessWidget {
  late int age;

  late int result;

  late bool gender;

  BmiResult({
    required this.age,
    required this.result,
    required this.gender,
  });

  @override
  Widget build(context) {
    return BlocProvider(
      create: (context) => BmiCubit(),
      child: BlocConsumer<BmiCubit, BmiStates>(
          listener: (context, state) {},
          builder: (context, state) {
            BmiCubit cubit = BmiCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text("BMI calculate"),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " Result  :  $result  ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Text(
                      " Age  :  $age ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Text(
                      " Gender   :  ${gender ? 'Male' : 'Female'} ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
