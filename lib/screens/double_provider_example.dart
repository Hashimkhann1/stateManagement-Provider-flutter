import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/provider/count_provider.dart';


class DoubeProviderExample extends StatefulWidget {
  const DoubeProviderExample({Key? key}) : super(key: key);

  @override
  State<DoubeProviderExample> createState() => _DoubeProviderExampleState();
}

class _DoubeProviderExampleState extends State<DoubeProviderExample> {
  @override
  Widget build(BuildContext context) {
    print('build');
    // final multileProvider = Provider.of<multipleProviderMain>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<multipleProviderMain>(builder: (context,value,child){
              return Slider (
                  min: 0,
                  max: 1,
                  value: value.valueColor,
                  onChanged: (val){
                    value.setValue(val);
                  });
            }),
            Consumer<multipleProviderMain>(builder: (context,value,child){
              return  Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.green.withOpacity(value.valueColor),
                      child: Center(child: Text('column 1')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.blueAccent.withOpacity(value.valueColor),
                      child: Center(child: Text('column 2')),
                    ),
                  ),
                ],
              );
            }),

          ],
        ),
      ),
    );
  }
}
