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

    /// Example of using GstModel.calculate method directly
    final gstValues = GstModel.calculate(
      amount: 2000, // amount
      gstType: GstType.cgst, // gst type
      gstPercentage: 20, // optional additional percentage
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
            /// Example of using GstText widget
            GstText(
              amount: 1000, // amount
              gstType: GstType.cgst, // gst type
              gstPercentage: 21, // optional additional percentage
              avoidFormatting: false, // set true to avoid formatting
              showOnlyTotal: false, // set true to show only total amount
              showGstPercentage: true, // set true to show gst percentage
              hideCurrencySymbol: false, // set true to hide currency symbol
              showGstType: true, // set true to show gst type
              /// Callback to get calculated values
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
