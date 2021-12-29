import 'dart:ui';

import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp();
  runApp(MaterialApp(
    title: "Lab Final",
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool flag = false;
  late List pwrdList = [];
  String? usrSC;
  String? securityCode;
  @override
  Widget build(BuildContext context) {
    String? desc;
    String? pwrd;

    void passwords() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Password"),
              content: Container(
                child: Column(
                  children: [
                    TextField(
                      onChanged: (val2) {
                        desc = val2;
                      },
                      decoration: const InputDecoration(
                          labelText: "Description",
                          hintText: "Enter Description"),
                    ),
                    TextField(
                      onChanged: (val3) {
                        pwrd = val3;
                      },
                      decoration: const InputDecoration(
                          labelText: "Password", hintText: "Enter Password"),
                    ),
                  ],
                ),
              ),
              contentTextStyle:
                const  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              actions: [
                TextButton(
                    onPressed: () {
                      print(desc);
                      print(pwrd);
                      pwrdList.add(pwrd);
                      print(pwrdList);
                      Navigator.pop(context);
                    },
                    child: const Text("Submit"))
              ],
            );
          });
    }

    void results() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Security Code"),
              content: TextField(
                onChanged: (val) {
                  securityCode = val;
                },
                decoration: InputDecoration(
                    labelText: "Security Code",
                    hintText: "Enter Security Code"),
              ),
              contentTextStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              actions: [
                TextButton(
                    onPressed: () {
                      print(securityCode);
                      Navigator.pop(context);
                    },
                    child: Text("Next"))
              ],
            );
          });
    }

    void displaydemand() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Security Code"),
              content: TextField(
                onChanged: (val4) {
                  usrSC = val4;
                },
                decoration: InputDecoration(
                    labelText: "Security Code",
                    hintText: "Enter your Security Code"),
              ),
              contentTextStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              actions: [
                TextButton(
                    onPressed: () {
                      if (usrSC == securityCode) {
                        setState(() {
                          flag = true;
                        });
                      } else {
                        setState(() {
                          flag = false;
                        });
                      }
                      print("This is userSc $securityCode");
                      Navigator.pop(context);
                    },
                    child: Text("Show"))
              ],
            );
          });
    }

    Widget displaycodes() {
      return ListView.builder(
        itemCount: pwrdList.length,
        itemBuilder: (context, int index) {
          return Text("${pwrdList[index]}",
          style: TextStyle(
            fontSize: 30,
            
          ),);
        },
      );
    }

    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text("Arslan Matloob",
                  style: TextStyle(
                    fontSize: 30,
                  ),),
                ),
                width:MediaQuery.of(context).size.width,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.blue
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(width:200,
              height: 30,
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    results();
                  },
                  child: Text("Add Security Code"),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width:200,
              height: 30,
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    passwords();
                  },
                  child: Text("Add Password"),
                ),
              ),
               SizedBox(
                height: 30,
              ),
              SizedBox(
                width:200,
              height: 30,
                child: RaisedButton(
                  color: Colors.blue,
                  
                  onPressed: () {
                    setState(() {
                      displaydemand();
                    });
                    print("This is flag $flag");
                  },
                  child: Text("Show List"),
                ),
              ),
               SizedBox(
                height: 30,
              ),
              SizedBox(width:200,
              height: 30,
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    passwords();
                  },
                  child: Text("Upload to firebase"),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Secure Password"),
      ),
      body: SafeArea(
          child: Container(
              color: Colors.blue,
              child: Padding(padding: EdgeInsets.only(left: 150),
              child:  (flag == true) ? displaycodes() : null)),
              ),
              
              
                 
    );
  }
}
