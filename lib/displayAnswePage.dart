import 'dart:async';
import 'package:bmi_calculator/main.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class answerPage extends StatelessWidget {
  double bmi_val;
  late String Category;
  late Color textColor;
  late String desc;
  
  Color? calcData() {
    if (bmi_val < 16.0) {
      Category = "Underweight";
      textColor = Color.fromARGB(255, 229, 219, 129);
      desc =
          "You have a very lower weight than normal body weight. You should eat too much!";
    } else if (bmi_val >= 16.0 && bmi_val < 18.4) {
      Category = "Underweight";
      desc =
          "You have a lower weight than normal body weight. You should eat more!";
      textColor = Color.fromARGB(255, 255, 230, 0);
    } else if (bmi_val > 18.4 && bmi_val < 25) {
      Category = "Normal";
      textColor = Colors.green;
      desc = "You have a normal body weight. Good Job!";
    } else if (bmi_val >= 25.0 && bmi_val < 40) {
      Category = "Overweight";
      textColor = Colors.orange;
      desc =
          "Your Weight is high, It's cautious to be overweight. Your health may be at risk if you don't loose your weight. You should talk to your doctor.";
    } else {
      Category = "Obese";
      textColor = Colors.red;
      desc =
          "Your Weight is So high, It's cautious to be overweight. This may turn into a critical health issue.You should loose your weight and talk to your doctor.";
    }
  }

  answerPage(this.bmi_val) {
    calcData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top:18.0),
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
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 20.0, bottom: 20.0, right: 15),
            child: Container(
              alignment: Alignment.center,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 1,
                      color: Colors.grey,
                      offset: Offset(2, 0),
                    )
                  ]),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          "${bmi_val.toString().split('.')[0]}",
                          style: TextStyle(
                              fontSize: 80, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: Text(
                          ".${((((bmi_val / 10) * 10).toString().split(".")[1])+"00").substring(0,2)}",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Your BMI Index",
                  style:
                      TextStyle(color: Colors.grey, fontWeight: FontWeight.w800),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Text(
                    "$Category",
                    style: TextStyle(
                        color: textColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 85.0, left: 15, right: 15),
                  child: Text(
                    "$desc",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () {
                      Navigator.pop(context,
                          MaterialPageRoute(builder: (context) => MyHomePage()));
                    },
                    child: Text("Re-Calculate"),
                  ),
                )
              ]),
            ),
          ),
        ));
  }
}
