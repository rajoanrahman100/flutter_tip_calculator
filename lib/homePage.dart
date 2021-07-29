import 'package:flutter/material.dart';
import 'package:fluttertipcalculator/controller.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var titleStyle = TextStyle(color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold);

  var tipC = Get.put(TipController());

  ///Its time to implement the logic and make this thing functional

  ///prepare the variables
  double bill = 0;
  double tip = 0;
  int person = 1;

  ///prepare the result
  double tipPerPerson = 0;
  double totalPerPerson = 0;

  var billController = TextEditingController();
  var tipController = TextEditingController();
  var personController = TextEditingController();

  ///Calculation
  void calculateTheTip() {
    tipPerPerson = (bill * tip) / person;
    totalPerPerson = (bill * (1 + tip)) / person;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFFC5E4E7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /*Container(
              width: double.infinity,
              height: 200,
            ),*/

            SizedBox(height: 20.0),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 35.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bills",
                    style: titleStyle,
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  TextField(
                    controller: billController,
                    onEditingComplete: () {
                      if (billController.text.isNotEmpty) {
                        tipC.bill.value = double.parse(billController.text);
                      } else {
                        tipC.bill.value = 0;
                      }
                      FocusScope.of(context).unfocus();
                      tipC.calculateTheTip();
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.2),
                        border: InputBorder.none,
                        hintText: "eg. 100",
                        hintStyle: TextStyle(
                            //fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.withOpacity(0.7)),
                        prefixIcon: Icon(Icons.attach_money_rounded)),
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Color(0xFF00474B)),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Text(
                    "Select Tip %",
                    style: titleStyle,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),

                  ///Lets create the button grid
                  Row(
                    children: [
                      Expanded(
                          child: FlatButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        onPressed: () {
                          tipC.tip.value = 0.05;
                          tipC.calculateTheTip();
                        },
                        height: 50.0,
                        color: Colors.indigo[400],
                        child: Text(
                          "5%",
                          style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
                        ),
                      )),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                          child: FlatButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        onPressed: () {
                          tipC.tip.value = 0.1;
                          tipC.calculateTheTip();
                        },
                        height: 50.0,
                        color: Colors.indigo[400],
                        child: Text(
                          "10%",
                          style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: FlatButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        onPressed: () {
                          tipC.tip.value = .15;
                          tipC.calculateTheTip();
                        },
                        height: 50.0,
                        color: Colors.indigo[400],
                        child: Text(
                          "15%",
                          style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
                        ),
                      )),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                          child: FlatButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        onPressed: () {
                          tipC.tip.value = 0.25;
                          tipC.calculateTheTip();
                        },
                        height: 50.0,
                        color: Colors.indigo[400],
                        child: Text(
                          "25%",
                          style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: FlatButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        onPressed: () {
                          tipC.tip.value = 0.5;
                          tipC.calculateTheTip();
                        },
                        height: 50.0,
                        color: Colors.indigo[400],
                        child: Text(
                          "50%",
                          style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
                        ),
                      )),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextField(
                          controller: tipController,
                          onEditingComplete: () {
                            if (tipController.text.isNotEmpty) {
                              tipC.tip.value = double.parse(tipController.text) / 100;
                            } else {
                              tipC.tip.value = 0;
                            }
                            FocusScope.of(context).unfocus();
                            tipC.calculateTheTip();
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.3),
                            border: InputBorder.none,
                            hintText: "Custom",
                            hintStyle: TextStyle(
                                //fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.withOpacity(0.7)),
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Color(0xFF00474B)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Number of people",
                    style: titleStyle,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: personController,
                    onEditingComplete: () {
                      if (personController.text.isNotEmpty) {
                        tipC.person.value = int.parse(personController.text);
                      } else {
                        tipC.person.value = 1;
                      }
                      FocusScope.of(context).unfocus();
                      tipC.calculateTheTip();
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.2),
                        border: InputBorder.none,
                        hintText: "eg. 5",
                        hintStyle: TextStyle(
                            //fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.withOpacity(0.7)),
                        prefixIcon: Icon(Icons.person)),
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Color(0xFF00474B)),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Obx(() => Container(
                        height: 300,
                        width: double.infinity,
                        padding: EdgeInsets.all(30.0),
                        decoration: BoxDecoration(color: Colors.indigo[400], borderRadius: BorderRadius.circular(18.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tip Amount",
                                      style:
                                          TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "/ person",
                                      style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 20.0),
                                    )
                                  ],
                                ),
                                Text(
                                  "\$${tipC.tipPerPerson}",
                                  style:
                                      TextStyle(color: Colors.white, fontSize: 34.0, fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Total",
                                      style:
                                          TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "/ person",
                                      style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 20.0),
                                    )
                                  ],
                                ),
                                Text(
                                  "\$${tipC.totalPerPerson.toStringAsFixed(2)}",
                                  style:
                                      TextStyle(color: Colors.white, fontSize: 34.0, fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Container(
                              width: double.infinity,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                  color: Colors.indigo,
                                  onPressed: () {
                                    tip = 0;
                                    person = 1;
                                    bill = 0;
                                    calculateTheTip();
                                    tipController.clear();
                                    billController.clear();
                                    personController.clear();
                                  },
                                  height: 50.0,
                                  child: Text(
                                    "Reset",
                                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500,color: Colors.white),
                                  )),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
