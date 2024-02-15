import 'dart:ffi';

import 'package:flutter/material.dart';

import 'home_page.dart';

typedef SumNative = Int32 Function(Int32 a, Int32 b);
typedef Sum = int Function(int a, int b);

void main() {
  final dylib = DynamicLibrary.open('libnative_add.so');
  final sumPointer = dylib.lookup<NativeFunction<SumNative>>('sum');
  final sum = sumPointer.asFunction<Sum>();
  print('3+5= ${sum(3, 5)}');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
