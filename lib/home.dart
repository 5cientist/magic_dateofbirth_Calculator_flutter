import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String calculatorText = "";
  int count = 0;
  String dob = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: size.height / 15,
                  child: Text(
                    calculatorText,
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
          ),
          Container(
            height: size.height / 1.7,
            decoration: const BoxDecoration(
              color: Color(0xff292D36),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    blocks("AC", Color(0xff24EFCB)),
                    blocks("CC", Color(0xff24EFCB)),
                    blocks("%", Color(0xff24EFCB)),
                    blocks("/", Colors.red),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    blocks("1"),
                    blocks("2"),
                    blocks("3"),
                    blocks("x", Colors.red),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    blocks("4"),
                    blocks("5"),
                    blocks("6"),
                    blocks("+", Colors.red),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    blocks("7"),
                    blocks("8"),
                    blocks("9"),
                    blocks("-", Colors.red),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    blocks(":"),
                    blocks("0"),
                    blocks("."),
                    blocks("=", count == 0 ? Colors.red : Colors.yellow),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget blocks(String calculatorKey, [Color? color]) {
    return GestureDetector(
      onTap: () {
        // print(calculatorKey);
        if (calculatorKey == "AC") {
          setState(() {
            calculatorText = "";
          });
        } else if (calculatorKey == "=") {
          if (count == 0) {
            setState(() {
              dob = calculatorText;
              count += 1;
              calculatorText = "";
            });
          } else {
            setState(() {
              calculatorText = dob;
              count -= 1;
            });
          }
        } else {
          setState(() {
            calculatorText = calculatorText + calculatorKey;
          });
        }
        // setState(() {
        //   calculatorText = calculatorText + calculatorKey;
        // });
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 14, left: 8, right: 8),
        child: Container(
          height: 70,
          width: 70,
          decoration: const BoxDecoration(
            color: Color(0xff272B33),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Center(
            child: Text(
              calculatorKey,
              style: TextStyle(
                color: color ?? Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
