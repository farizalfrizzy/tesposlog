import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController brtbarangcontroller = TextEditingController();
  TextEditingController pjgbarangcontroller = TextEditingController();
  TextEditingController lbrbarangcontroller = TextEditingController();
  TextEditingController tinggibarangcontroller = TextEditingController();
  String hasilbanding = '';
  double volum = 0;

  void hitungan() {
    var hitung = double.parse(pjgbarangcontroller.text) *
        double.parse(lbrbarangcontroller.text) *
        double.parse(tinggibarangcontroller.text);
    var jumlahbrt = hitung / 4000;

    setState(() {
      volum = jumlahbrt;
      print(volum);
    });
  }

  void perbandingan() {
    var volumbrg = volum;
    var brtbrg = double.parse(brtbarangcontroller.text);
    setState(() {
      if (brtbrg > volumbrg) {
        hasilbanding = brtbrg.toString();
      } else if (brtbrg < volumbrg) {
        hasilbanding = volumbrg.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  controller: brtbarangcontroller,
                  maxLength: 20,
                  decoration: const InputDecoration(
                    labelText: 'Berat Barang / Kg',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    value = brtbarangcontroller.text;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  controller: pjgbarangcontroller,
                  maxLength: 20,
                  decoration: const InputDecoration(
                    labelText: 'Panjang Barang / Cm',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    value = pjgbarangcontroller.text;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  controller: lbrbarangcontroller,
                  maxLength: 20,
                  decoration: const InputDecoration(
                    labelText: 'Lebar Barang / Cm',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    value = lbrbarangcontroller.text;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  controller: tinggibarangcontroller,
                  maxLength: 20,
                  decoration: const InputDecoration(
                    labelText: 'Tinggi Barang / Cm',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    value = tinggibarangcontroller.text;
                  },
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () async {
                  hitungan();
                  perbandingan();
                  print(volum);
                  print(hasilbanding);
                  await showDialog<void>(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Info'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text("perbandingan dari $volum : " +
                                  brtbarangcontroller.text +
                                  " adalah"),
                              Text('hasil Banding = $hasilbanding kg'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Ok"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text("hitung"),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Center(
                    //   child: Text(volum.toString()),
                    // ),
                    Center(
                      child:
                          Text('hasil perbandingan berat = $hasilbanding Kg'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables
