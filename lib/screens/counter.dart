import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/count_provider.dart'; //file


class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider',style: TextStyle(fontSize: 24),),
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context , value , child){
          return Text(value.count.toString(),style: TextStyle(fontSize: 50.0),);
        },)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          counterProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
