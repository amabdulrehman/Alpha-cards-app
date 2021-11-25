import 'package:flutter/material.dart';

class PGFPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  String date = "";
  double minDAmount=1000;
  double maxDAmount = 5000;
  int amount = 1000;
  DateTime initialselectedDate = DateTime.now();

  DateTime finalselectedDate = DateTime.now();
  int difference=0;
  void differenceInDays(){
    setState(() {
      difference=initialselectedDate.difference(finalselectedDate).inDays;

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Datepicker"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          const SizedBox(height: 70,),

          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20),

                  child: SizedBox(
                    width: 200.0,
                    height: 80.0,

                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(color: Colors.red, width: 4)

                      ),

                      onPressed: () {
                        _selectDate(context);
                      },
                      child: const Text("Starting Date"),
                    ),
                  )
              ),
              const SizedBox(width: 50,),
              Text(
                  "${initialselectedDate.day}/${initialselectedDate.month}/${initialselectedDate.year}"),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20),

                  child: SizedBox(
                    width: 200.0,
                    height: 80.0,

                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(color: Colors.red, width: 4)

                      ),

                      onPressed: () {
                        _selectDate2(context);
                      },
                      child: const Text("Ending Date"),
                    ),
                  )
              ),

              const SizedBox(width: 50,),
              Text(
                  "${finalselectedDate.day}/${finalselectedDate.month}/${finalselectedDate.year}"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Text('Deducted Amount'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("$amount", style: null),
              ),
              Slider(
                  value: amount.toDouble(),
                  min: minDAmount,
                  max: maxDAmount,

                  activeColor: Colors.red,
                  inactiveColor: Colors.black,
                  onChanged: ( double newValue) {
                    setState(() {
                      amount = newValue.round();
                    }
                    );
                  },
                  semanticFormatterCallback: (double newValue) {
                    return '$newValue.round()';
                  }
              )
            ],
          ),
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: initialselectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != initialselectedDate) {
      setState(() {
        initialselectedDate = selected;
      });
    }
  }

  _selectDate2(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: finalselectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != finalselectedDate) {
      setState(() {
        finalselectedDate = selected;
      });
    }
  }
}