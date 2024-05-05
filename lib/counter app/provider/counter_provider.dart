import 'package:anonymous/counter%20app/model/counter_model.dart';
import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier{

  CounterModel counterModel = CounterModel();

  void increaseCount(){
    if(counterModel.count < 10) counterModel.count++;
    notifyListeners();
  }

  void decreaseCount(){
    if(counterModel.count >= 1) counterModel.count--;
    notifyListeners();
  }

  int getCount() => counterModel.count;

}