import 'package:bmi_with_cubit/shared/components/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCubit extends Cubit<BmiStates> {
  BmiCubit() : super(IntialState());
  bool isMale = true;
  int age = 20;

  int weight = 60;
  double height = 180;

  static BmiCubit get(context) => BlocProvider.of(context);

  void male() {
    isMale = true;
    emit(MaleState());
  }

  void female() {
    isMale = false;
    emit(FemaleState());
  }

  void slider() {
    emit(SliderState());
  }

  void agePlus() {
    age++;
    emit(AgePlusState());
  }

  void ageMinus() {
    age--;
    emit(AgeMinusState());
  }

  void weightPlus() {
    weight++;
    emit(WeightPlusState());
  }

  void weightMinus() {
    weight--;
    emit(WeightMinusState());
  }
}
