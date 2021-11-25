import 'package:flutter/material.dart';
import 'pgfpage.dart';


void main() => runApp(MaterialApp(
  home: firstpage(),
  theme: ThemeData.dark(),
));

class firstpage extends StatefulWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  _firstpageState createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'PGF Calculator',
          ),
          centerTitle: true,
        ),
        //drawer:,
        body: Center(
          child: Column(
            children: [

              SizedBox(
                height: 110,
                width: 500,
                child: FlatButton(

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(color: Colors.red, width: 4)
                  ),

                  color: Colors.black,
                  child: const Text(
                    'OG Rank 1',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.red,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PGFPage()),
                    );
                  },
                ),
              ),

              const SizedBox(
                height: 40.0,
              ),

              SizedBox(

                height: 110,
                width: 500,
                child: FlatButton(

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(color: Colors.red, width: 4)
                  ),

                  color: Colors.black,
                  child: const Text(
                    'OG Rank 2',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.red,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),

              const SizedBox(
                height: 40.0,
              ),

              SizedBox(
                height: 110,
                width: 500,

                child: FlatButton(

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(color: Colors.red, width: 4)
                  ),

                  color: Colors.black,
                  child: const Text(
                    'OG Rank 3',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.red,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ));
  }
}