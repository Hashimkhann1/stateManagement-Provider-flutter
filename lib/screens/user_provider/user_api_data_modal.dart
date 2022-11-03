import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/provider/user_api_data_provider.dart';

import '../../modal/user_data_modal.dart';
import 'package:http/http.dart' as http;


class UserApiDataModal extends StatefulWidget {
  const UserApiDataModal({Key? key}) : super(key: key);

  @override
  State<UserApiDataModal> createState() => _UserApiDataModalState();
}

class _UserApiDataModalState extends State<UserApiDataModal> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final userProviderDataMethod = Provider.of<UserApiDataProvider>(context,listen: false);
    userProviderDataMethod.getUserData();
  }


  @override
  Widget build(BuildContext context) {
    final UserProviderData = Provider.of<UserApiDataProvider>(context);
    // getUserData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Data Modal'),
      ),
      body: ListView.builder(
          itemCount: UserProviderData.allUserApiData.length,
          itemBuilder: (context , index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Card(
                  elevation: 12,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Id : ${UserProviderData.allUserApiData[index].id}',style: TextStyle(fontSize: 17,color: Colors.grey),),
                        Text('Name : ${UserProviderData.allUserApiData[index].name}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                        Text('User Name : ${UserProviderData.allUserApiData[index].username}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                        Text('Email : ${UserProviderData.allUserApiData[index].email}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.grey),),
                        Text('Phone Number : ${UserProviderData.allUserApiData[index].phone}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.grey),),
                        Text('Website : ${UserProviderData.allUserApiData[index].website}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.grey),),
                        Text('User Address',style: TextStyle(color: Colors.black45,fontSize: 18,fontWeight: FontWeight.w600),),
                        Text('City : ${UserProviderData.allUserApiData[index].address?.city}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.grey),),
                        Text('Suite : ${UserProviderData.allUserApiData[index].address?.suite}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.grey),),
                        Text('Street : ${UserProviderData.allUserApiData[index].address?.street}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.grey),),
                        Text('Zip Code : ${UserProviderData.allUserApiData[index].address?.zipcode}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.grey),),
                        Text('User Geo Data',style: TextStyle(color: Colors.black45,fontSize: 18,fontWeight: FontWeight.w600),),
                        Text('Lat : ${UserProviderData.allUserApiData[index].address?.geo?.lat}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.grey),),
                        Text('Lng : ${UserProviderData.allUserApiData[index].address?.geo?.lng}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.grey),),
                        Text('Company',style: TextStyle(color: Colors.black45,fontSize: 18,fontWeight: FontWeight.w600),),
                        Text('Company Name : ${UserProviderData.allUserApiData[index].company?.name}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.grey),),
                        Text('CatchPhrase : ${UserProviderData.allUserApiData[index].company?.catchPhrase}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.grey),),
                        Text('Bs : ${UserProviderData.allUserApiData[index].company?.bs}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.grey),),
                      ],
                    ),
                  )
              ),
            );
          })
    );
  }
}
