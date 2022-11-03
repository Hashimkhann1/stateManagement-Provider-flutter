

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../modal/data_modal.dart';

class UserModalProvier with ChangeNotifier{

  List<PostDataModal> allPosts = [];
  setAllApiPost(PostDataModal value){
    allPosts.add(value);
    notifyListeners();
  }

  Future getAllPosts() async{

    var responce = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var jsonData = jsonDecode(responce.body.toString());
    for(var data in jsonData){
      PostDataModal postDataModal = PostDataModal.formJSON(data);
      setAllApiPost(postDataModal);
    }

    return allPosts;
  }
}