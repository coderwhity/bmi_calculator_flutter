import 'dart:async';
import 'package:flutter/material.dart';

import 'displayAnswePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI CALCULATOR',
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int age = 18;
  int weight = 45;
  double height = 150;
  Timer? timer;
  String gender = "male";
  double bmi = 0.0;

  double calculateBMI() {
    double meters = height / 100;
    bmi = (weight / (meters * meters));
    print(bmi);
    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Text(
            "BMI CALCULATOR",
            style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w900,
                fontSize: 15,
                color: const Color(0xff6200ee)),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      child: Container(
                        alignment: Alignment.center,
                        height: screenHeight * 0.25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade600,
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(screenWidth * 0.05),
                              child: Text(
                                "Age (In Years)",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              "$age",
                              style: TextStyle(
                                fontSize: screenWidth * 0.1,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTapDown: (TapDownDetails details) {
                                    timer = Timer.periodic(
                                        Duration(milliseconds: 200), (t) {
                                      setState(() {
                                        age += 1;
                                      });
                                    });
                                  },
                                  onTapUp: (TapUpDetails details) {
                                    timer?.cancel();
                                  },
                                  onTapCancel: () {
                                    timer?.cancel();
                                  },
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      minimumSize: Size(
                                        screenWidth * 0.12,
                                        screenWidth * 0.12,
                                      ),
                                      backgroundColor: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        age += 1;
                                      });
                                    },
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.07,
                                          color: const Color(0xff6200ee),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.03),
                                GestureDetector(
                                  onTapDown: (TapDownDetails details) {
                                    timer = Timer.periodic(
                                        Duration(milliseconds: 200), (t) {
                                      setState(() {
                                        age -= 1;
                                      });
                                    });
                                  },
                                  onTapUp: (TapUpDetails details) {
                                    timer?.cancel();
                                  },
                                  onTapCancel: () {
                                    timer?.cancel();
                                  },
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      minimumSize: Size(
                                        screenWidth * 0.12,
                                        screenWidth * 0.12,
                                      ),
                                      backgroundColor: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        age -= 1;
                                      });
                                    },
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.07,
                                          color: const Color(0xff6200ee),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      child: Container(
                        alignment: Alignment.center,
                        height: screenHeight * 0.25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade600,
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(screenWidth * 0.05),
                              child: Text(
                                "Weight (Kg)",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              "$weight",
                              style: TextStyle(
                                fontSize: screenWidth * 0.1,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTapDown: (TapDownDetails details) {
                                    timer = Timer.periodic(
                                        Duration(milliseconds: 200), (t) {
                                      setState(() {
                                        weight += 1;
                                      });
                                    });
                                  },
                                  onTapUp: (TapUpDetails details) {
                                    timer?.cancel();
                                  },
                                  onTapCancel: () {
                                    timer?.cancel();
                                  },
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      minimumSize: Size(
                                        screenWidth * 0.12,
                                        screenWidth * 0.12,
                                      ),
                                      backgroundColor: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        weight += 1;
                                      });
                                    },
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.07,
                                          color: const Color(0xff6200ee),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.03),
                                GestureDetector(
                                  onTapDown: (TapDownDetails details) {
                                    timer = Timer.periodic(
                                        Duration(milliseconds: 200), (t) {
                                      setState(() {
                                        weight -= 1;
                                      });
                                    });
                                  },
                                  onTapUp: (TapUpDetails details) {
                                    timer?.cancel();
                                  },
                                  onTapCancel: () {
                                    timer?.cancel();
                                  },
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      minimumSize: Size(
                                        screenWidth * 0.12,
                                        screenWidth * 0.12,
                                      ),
                                      backgroundColor: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        weight -= 1;
                                      });
                                    },
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.07,
                                          color: const Color(0xff6200ee),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                child: Container(
                  width: double.infinity,
                  height: screenHeight * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.05),
                        child: Text(
                          "Height",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Text(
                          "${height.toStringAsFixed(0)} cm",
                          style: TextStyle(
                            fontSize: screenWidth * 0.1,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Slider(
                        value: height,
                        min: 1,
                        max: 250,
                        activeColor: const Color(0xff6200ee),
                        inactiveColor: Colors.grey,
                        onChanged: (newHeight) {
                          setState(() {
                            height = newHeight;
                          });
                        },
                        divisions: 250,
                        label: height.toStringAsFixed(0),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            gender = "male";
                          });
                        },
                        child: Container(
                          height: screenHeight * 0.25,
                          decoration: BoxDecoration(
                            color: gender == "male"
                                ? const Color(0xff6200ee)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade600,
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.male,
                                color: gender == "male"
                                    ? Colors.white
                                    : const Color(0xff6200ee),
                                size: screenWidth * 0.15,
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                "Male",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.07,
                                  color: gender == "male"
                                      ? Colors.white
                                      : const Color(0xff6200ee),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            gender = "female";
                          });
                        },
                        child: Container(
                          height: screenHeight * 0.25,
                          decoration: BoxDecoration(
                            color: gender == "female"
                                ? const Color(0xff6200ee)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade600,
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.female,
                                color: gender == "female"
                                    ? Colors.white
                                    : const Color(0xff6200ee),
                                size: screenWidth * 0.15,
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                "Female",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.07,
                                  color: gender == "female"
                                      ? Colors.white
                                      : const Color(0xff6200ee),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, screenHeight * 0.07),
                    shadowColor: Colors.black,
                  ),
                  onPressed: () {
                    calculateBMI();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => answerPage(bmi.toDouble()),
                      ),
                    );
                  },
                  child: Text("Calculate"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
