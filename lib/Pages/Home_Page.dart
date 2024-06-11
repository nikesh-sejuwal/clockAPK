import 'package:clock_task/Pages/Weather_method.dart';
import 'package:clock_task/Provider/myProvider.dart';
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

var cityController = TextEditingController();

class _Home_PageState extends State<Home_Page> {
  @override
  void initState() {
    cityController.text =
        Provider.of<Clockprovider>(context, listen: false).city;
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
        backgroundColor: Color.fromARGB(255, 28, 154, 180),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<Clockprovider>(context, listen: false)
                    .functioncall();
              },
              icon: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Icon(
                  Icons.replay,
                  color: Colors.white,
                  size: 30,
                ),
              ))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(255, 20, 122, 143),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Consumer<Clockprovider>(builder: (context, cProv, child) {
            int hrs = cProv.myTime.hour;
            String my12hrs = DateFormat('hh').format(cProv.myTime);
            String mymins = DateFormat('mm').format(cProv.myTime);
            String mysecs = DateFormat('ss').format(cProv.myTime);
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 10),
                  Center(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: TextField(
                          controller: cityController,
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xff212333),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              hintText: 'City name',
                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.5)),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    Provider.of<Clockprovider>(context,
                                            listen: false)
                                        .changeCity(cityController.text);
                                  },
                                  icon: Icon(Icons.search,
                                      color: Colors.white, size: 30)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        )),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 190,
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
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(my12hrs, style: myStyle),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 15, left: 5, right: 5),
                                child: Text(
                                  ":",
                                  style: myStyle,
                                ),
                              ),
                              Text(
                                mymins,
                                style: TextStyle(
                                    fontSize: 80,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      mysecs,
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
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffB455C4)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  WeatherMethod(),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Text(
                        'Made By: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Nikesh Sejuwal",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "nirajan132n@gmail.com",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
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
