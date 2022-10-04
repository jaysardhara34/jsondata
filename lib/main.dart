import 'package:flutter/material.dart';
import 'package:jsondata/bjojson/provider/bjoProvider.dart';
import 'package:jsondata/bjojson/view/bjiScreen.dart';
import 'package:jsondata/userScreen/provider/homeProvider.dart';
import 'package:jsondata/userScreen/view/homeScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BjoProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'bju',
        routes: {
          '/': (context) => HomeScreen(),
          'bju':(context) => BjiScreen(),
        },
      ),
    ),
  );
}
