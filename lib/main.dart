import 'package:dynamic_fair/page/fair_detail_page.dart';
import 'package:dynamic_fair/page/home_page.dart';
import 'package:fair/fair.dart';
import 'package:flutter/material.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FairApp.runApplication(

      FairApp(
        debugShowFairBanner:false,
        delegate: const {
        },
        modules: const {
        },
        child: MaterialApp(
          home: HomePage()),
      ),
  );
}