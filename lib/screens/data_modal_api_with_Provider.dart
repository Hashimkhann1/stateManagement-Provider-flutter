// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/provider/user_modal_provider.dart';
import '../modal/data_modal.dart';
import 'package:http/http.dart' as http;

import '../modal/data_modal.dart';



class DataModalApiWithProvider extends StatefulWidget {
  const DataModalApiWithProvider({Key? key}) : super(key: key);

  @override
  State<DataModalApiWithProvider> createState() => _DataModalApiWithProviderState();
}

class _DataModalApiWithProviderState extends State<DataModalApiWithProvider> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final postProvider = Provider.of<UserModalProvier>(context,listen: false);
    postProvider.getAllPosts();
    print('hashim khan');
  }

  @override
  Widget build(BuildContext context) {

    final apiProvider = Provider.of<UserModalProvier>(context);

    return Scaffold(
      body: apiProvider.allPosts.isEmpty ?
      Center(
        child: CircularProgressIndicator(),
      ) : Consumer<UserModalProvier>(builder: (context , value , child){
        return ListView.builder(
            itemCount: apiProvider.allPosts.length,
            itemBuilder: (context , index){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 3.0),
                child: Card(
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(value.allPosts[index].id.toString()),
                        Text(value.allPosts[index].title.toString()),
                        Text(value.allPosts[index].body.toString()),
                        Text('hashim khan'),
                      ],
                    ),
                  ),
                ),
              );
            });
      })
    );
  }
}
