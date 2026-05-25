import 'package:flutter/material.dart';
import 'package:newst_app/core/theme/primary_app_theme.dart';
import 'package:newst_app/features/home/presentation/views/home_view.dart';

void main() {
  runApp(const Newst());
}

class Newst extends StatelessWidget {
  const Newst({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: primaryAppTheme ,
      debugShowCheckedModeBanner: false,
      home: HomeView());
  }
}
