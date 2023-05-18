import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils/style.dart';

class FibonacciScreen extends StatefulWidget {
  const FibonacciScreen({Key? key}) : super(key: key);

  @override
  _FibonacciScreenState createState() => _FibonacciScreenState();
}

class _FibonacciScreenState extends State<FibonacciScreen> {

  final _formKey = GlobalKey<FormState>();

  late TextEditingController searchTxtCtrl = TextEditingController();

  late List<int> fibonacciList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text('FIBONACCI'),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text("Please enter limit of fibonacci", style: kTextStyleSubHeader),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: Form(
                key: _formKey,
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child:TextFormField(
                        controller: searchTxtCtrl,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please input value";
                          }

                          return null;
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }

                          generateFibonacci();
                        },
                        icon: const Icon(
                          Icons.search,
                          size: 24.0,
                        ),
                        label: const Text(''),
                        style: ElevatedButton.styleFrom(
                          primary: kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
          Expanded(
            child: ListView.builder(
              itemCount: fibonacciList.length,
              itemBuilder: (context, int index) {
                return ListTile(
                  title: Text('${fibonacciList[index]}'),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void generateFibonacci() {
    fibonacciList = [];

    int num = int.parse(searchTxtCtrl.text);

    for (int i = 1; i <= num; i++) {
      if (i == 1 || i == 2) {
        fibonacciList.add(1);
      } else {
        // Index start at 0
        int firstDigit = fibonacciList[i - 3];
        int secondDigit = fibonacciList[i - 2];

        fibonacciList.add(firstDigit + secondDigit);
      }
    }

    setState(() {});
  }
}