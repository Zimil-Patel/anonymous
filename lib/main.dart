import 'package:anonymous/counter%20app/provider/counter_provider.dart';
import 'package:anonymous/counter%20app/view/counter_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider(),),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: false).copyWith(
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
        ),
        themeMode: ThemeMode.light,
        home: const CounterApp(),
      ),
    ),
  );
}
