import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils/style.dart';

class PrimeNumberScreen extends StatefulWidget {
  const PrimeNumberScreen({Key? key}) : super(key: key);

  @override
  _PrimeNumberScreenState createState() => _PrimeNumberScreenState();
}

class _PrimeNumberScreenState extends State<PrimeNumberScreen> {

  final _formKey = GlobalKey<FormState>();

  late TextEditingController searchTxtCtrl = TextEditingController();

  late List<int> primeList = [];

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
          child: Text('PRIME NUMBER'),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text("Please enter limit of prime number", style: kTextStyleSubHeader),
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

                          generatePrimeNumber();
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
              itemCount: primeList.length,
              itemBuilder: (context, int index) {
                return ListTile(
                  title: Text('${primeList[index]}'),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void generatePrimeNumber() {
    primeList = [];

    int num = int.parse(searchTxtCtrl.text);

    if (num != 1 && num != 0) {
      for (int i = 1; i <= num; i++) {
        int counter = 0;

        for(int j = i; j >= 1; j--) {
          if(i % j == 0) {
            counter++;
          }
        }

        // Can divide by 1 and themself
        if (counter == 2){
          primeList.add(i);
        }
      }
    }

    setState(() {});
  }
}