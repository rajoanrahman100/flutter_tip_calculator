import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  var titleStyle=TextStyle(
      color: Color(0xFF5B777B),fontSize: 24.0,fontWeight: FontWeight.bold
  );


  ///Its time to implement the logic and make this thing functional

  ///prepare the variables
  double bill=0;
  double tip=0;
  int person=1;

  ///prepare the result
  double tipPerPerson=0;
  double totalPerPerson=0;

  var billController=TextEditingController();
  var tipController=TextEditingController();
  var personController=TextEditingController();

  ///Calculation
  void calculateTheTip(){
    tipPerPerson=(bill*tip)/person;
    totalPerPerson=(bill*(1+tip))/person;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC5E4E7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
            ),

            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 35.0 ),
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
                  Text("Bills",style: titleStyle,),
                  SizedBox(height: 25.0,),
                  TextField(
                    controller: billController,
                    onEditingComplete: (){
                      setState(() {
                        if(billController.text.isNotEmpty){
                          bill=double.parse(billController.text);
                        }else{
                          bill=0;
                        }
                        FocusScope.of(context).unfocus();
                        calculateTheTip();
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF3F8FB),
                      border: InputBorder.none,
                      hintText: "eg. 100",
                      prefixIcon: Icon(Icons.attach_money_rounded)
                    ),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00474B)
                    ),
                  ),
                  SizedBox(height: 35.0,),
                  Text("Select Tip %",style: titleStyle,),
                  SizedBox(height: 15.0,),
                  ///Lets create the button grid
                  Row(
                    children: [
                      Expanded(child: FlatButton(
                        onPressed: (){
                          setState(() {
                            tip=0.05;
                            calculateTheTip();
                          });
                        },
                        height: 50.0,
                        color: Color(0xFF00474B),
                        child:Text("5%",style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold
                        ),),
                      )),
                      SizedBox(width: 20.0,),
                      Expanded(child: FlatButton(
                        onPressed: (){
                          setState(() {
                            tip=0.1;
                            calculateTheTip();
                          });
                        },
                        height: 50.0,
                        color: Color(0xFF00474B),
                        child:Text("10%",style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold
                        ),),
                      ))
                    ],
                  ),
                  SizedBox(height: 15.0,),
                  Row(
                    children: [
                      Expanded(child: FlatButton(
                        onPressed: (){
                          setState(() {
                            tip=.15;
                            calculateTheTip();
                          });
                        },
                        height: 50.0,
                        color: Color(0xFF00474B),
                        child:Text("15%",style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold
                        ),),
                      )),
                      SizedBox(width: 20.0,),
                      Expanded(child: FlatButton(
                        onPressed: (){
                          setState(() {
                            tip=0.25;
                            calculateTheTip();
                          });
                        },
                        height: 50.0,
                        color: Color(0xFF00474B),
                        child:Text("25%",style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold
                        ),),
                      ))
                    ],
                  ),
                  SizedBox(height: 15.0,),
                  Row(
                    children: [
                      Expanded(child: FlatButton(
                        onPressed: (){
                          setState(() {
                            tip=0.5;
                            calculateTheTip();
                          });
                        },
                        height: 50.0,
                        color: Color(0xFF00474B),
                        child:Text("50%",style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold
                        ),),
                      )),
                      SizedBox(width: 20.0,),
                      Expanded(child: TextField(
                        controller: tipController,
                        onEditingComplete: (){
                          setState(() {
                            if(tipController.text.isNotEmpty){
                              tip=double.parse(tipController.text)/100;
                            }else{
                              tip=0;
                            }
                            FocusScope.of(context).unfocus();
                            calculateTheTip();
                          });
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFF3F8FB),
                            border: InputBorder.none,
                            hintText: "Custom",
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF00474B)
                        ),
                      ),)
                    ],
                  ),
                  SizedBox(height: 15.0,),
                  Text("Number of people",style: titleStyle,),
                  SizedBox(height: 20.0,),
                  TextField(
                    controller: personController,
                    onEditingComplete: (){
                      setState(() {
                        if(personController.text.isNotEmpty){
                          person=int.parse(personController.text);
                        }else{
                          person=1;
                        }
                        FocusScope.of(context).unfocus();
                        calculateTheTip();
                      });
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF3F8FB),
                        border: InputBorder.none,
                        hintText: "eg. 5",
                        prefixIcon: Icon(Icons.person)
                    ),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00474B)
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Container(
                    height: 300,
                    width: double.infinity,
                    padding: EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                        color: Color(0xFF00474B),
                      borderRadius: BorderRadius.circular(18.0)
                    ),
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
                                Text("Tip Amount",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w500
                                ),),
                                SizedBox(height: 5.0,),
                                Text("/ person",style: TextStyle(
                                  color: Color(0xFF598689),fontSize: 20.0
                                ),)
                              ],
                            ),
                            Text("\$$tipPerPerson",style: TextStyle(
                                color: Color(0xFF29C0AD),fontSize: 34.0,fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                        SizedBox(height: 20.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Total",style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w500
                                ),),
                                SizedBox(height: 5.0,),
                                Text("/ person",style: TextStyle(
                                    color: Color(0xFF598689),fontSize: 20.0
                                ),)
                              ],
                            ),
                            Text("\$${totalPerPerson.toStringAsFixed(2)}",style: TextStyle(
                                color: Color(0xFF29C0AD),fontSize: 34.0,fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                        SizedBox(height: 20.0,),
                        Container(
                          width: double.infinity,
                          child: FlatButton(color:Color(0xFF29C0AD),onPressed:(){
                            tip=0;
                            person=1;
                            bill=0;
                            calculateTheTip();
                            tipController.clear();
                            billController.clear();
                            personController.clear();
                          },height: 50.0,child:Text("Reset",style: TextStyle(
                            fontSize: 24.0,fontWeight:FontWeight.bold
                          ),)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
