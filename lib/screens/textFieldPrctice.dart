import 'package:flutter/material.dart';


class TextFieldPrctice extends StatelessWidget {
  TextFieldPrctice({Key? key}) : super(key: key);

  ValueNotifier<bool> _toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ValueListenableBuilder(
          valueListenable: _toggle,
          builder: (context , value , child){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: TextField(
            obscureText: _toggle.value,
            decoration: InputDecoration(
                suffix: InkWell(
                    onTap: () {
                      _toggle.value = !_toggle.value;
                      print('hashim khans');
                    },
                    child: Icon(_toggle.value ? Icons.visibility_off_outlined : Icons.visibility)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                ),enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent , width: 3.0)
            ),
                focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black,width: 3.0),
            )
            ),
          ),
        );
      })
    ));
  }
}
