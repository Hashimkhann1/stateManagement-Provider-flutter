
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../modal/data_modal.dart';


class DataModalApi extends StatefulWidget {
  const DataModalApi({Key? key}) : super(key: key);

  @override
  State<DataModalApi> createState() => _DataModalApiState();
}

class _DataModalApiState extends State<DataModalApi> {
  Future<List<PostDataModal>> getApiData() async {
    List<PostDataModal> apiData = [];
    var responce = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
   if(responce.statusCode == 200){
     var jsonParse = jsonDecode(responce.body.toString());

     for(var data in jsonParse){
       PostDataModal postDataModal = PostDataModal.formJSON(data);
       apiData.add(postDataModal);
     }
   }
   return apiData;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    getApiData();
    return Scaffold(
      appBar: AppBar(title: Text('Data Modal'),backgroundColor: Colors.blueGrey,),
      body: FutureBuilder(
        future: getApiData(),
          builder: (context , snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data?.length,
                  itemBuilder: (context , index){
                  return Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(snapshot.data![index].title.toString(),style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                          Text(snapshot.data![index].body.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.grey),),
                        ],
                      ),
                    ),
                  );
              });
            }
        return Text('return');
      }),
    );
  }
}
