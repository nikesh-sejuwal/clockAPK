import 'package:clock_task/Provider/clockProvider.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({
    super.key,
  });

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  void initState() {
    Provider.of<Clockprovider>(context, listen: false).updateTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var myStyle = TextStyle(
        fontSize: 80, fontWeight: FontWeight.bold, color: Colors.blue);
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Time',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade100))),
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<Clockprovider>(context, listen: false).getTime();
              },
              icon: Icon(Icons.replay))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Consumer<Clockprovider>(builder: (context, cProv, child) {
            int hrs = cProv.myTime.hour;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                      color: Color(0xff212333),
                      border: Border.all(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(1, 1),
                          blurRadius: 7,
                          spreadRadius: 3,
                          color: Colors.black,
                        )
                      ]),
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(cProv.myTime.hour.toString(), style: myStyle),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 15, left: 5, right: 5),
                              child: Text(
                                ":",
                                style: myStyle,
                              ),
                            ),
                            Text(cProv.myTime.minute.toString(),
                                style: myStyle),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    hrs > 12 ? 'PM' : "AM",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.yellow),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    cProv.myTime.second.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        // Text( "HELLo"
                        Text(
                          DateFormat(DateFormat.MONTH_WEEKDAY_DAY)
                              .format(cProv.myTime),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffB455C4)),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text('Made By: '),
                    Text("Nikesh Sejuwal"),
                    Text("nikesh@gmail.com")
                  ],
                )
              ],
            );
          }),
        ),
      ),
    );
  }

  void myFun() async {
    await Future.delayed(Duration(seconds: 1));
  }
}
