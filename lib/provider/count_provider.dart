
import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier{
  int _count = 0;
  int get count => _count;

  void setCount(){
    _count++;
    notifyListeners();
  }
}



class multipleProviderMain with ChangeNotifier{
  double _value = 1.0;
  double get valueColor => _value;

  void setValue(double val){
    _value = val;
    notifyListeners();
  }
}