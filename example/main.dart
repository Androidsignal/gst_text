import 'package:flutter/material.dart';
import 'package:gst_text/gst_model.dart';
import 'package:gst_text/gst_text.dart';

void main() {
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
      ),
      home: ExampleScreen(),
    );
  }
}


class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {

  @override
  void initState() {
    super.initState();
    final gstValues = GstModel.calculate(
      amount: 2000,
      gstType: GstType.cgst,
      gstPercentage: 20,
    );
    print('gstValues from method: ${gstValues.toJson()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// with method using static method
            GstText(
              amount: 1000,
              gstType: GstType.cgst,
              gstPercentage: 21,
              avoidFormatting: false,
              showOnlyTotal: false,
              showGstPercentage: true,
              hideCurrencySymbol: true,
              showGstType: true,
              gstValueCallBack: (gstAmount) {
                print('GST Calculation: ${gstAmount.toJson()}');
                print('Amount: ${gstAmount.amount}');
                print('GST Amount: ${gstAmount.gstAmount}');
                print('Total: ${gstAmount.total}');
                print('Percentage: ${gstAmount.gstPercentage}');
                print('GST Type: ${gstAmount.gstType}');
              },
           ),
          ],
        ),
      ),
    );
  }
}