import 'package:clock_task/Provider/clockProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Pages/Home_Page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Clockprovider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home_Page(),
    ),
  ));
}
