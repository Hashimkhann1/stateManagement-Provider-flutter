



import 'package:flutter/cupertino.dart';

class FavouriteItemProvider with ChangeNotifier{
  List<int> _selectedItem = [];
  List<int> get selectedItem => _selectedItem;

  void addItems(int value) {
    _selectedItem.add(value);
    notifyListeners();
  }

  void removeItem(int value){
    _selectedItem.remove(value);
    notifyListeners();
  }
}