

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../modal/user_data_modal.dart';

class UserApiDataProvider with ChangeNotifier{

  List<UserDataModal> allUserApiData = [];
  addUserDataToList(UserDataModal value){
    allUserApiData.add(value);
    notifyListeners();
  }


  Future<List<UserDataModal>> getUserData() async{

    try{
    var responce = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users#'));
    // print(responce.body);
      if(responce.statusCode == 200){
        var userJsonData = jsonDecode(responce.body);
        for(var data in userJsonData){
          // print(data);
          UserDataModal userDataModal = UserDataModal.fromJson(data);
          addUserDataToList(userDataModal);
        }
      }
   }
    catch(error){
      print(error);
    }


    return allUserApiData;
  }
}