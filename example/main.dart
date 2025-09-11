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
      gstType: GstType.igst, // gst type
      gstPercentage: 20, // optional additional percentage
      gstMode: GstMode.inclusive, // optional gst mode
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
              amount: 2000, // amount
              gstMode: GstMode.inclusive, // gst mode (inclusive/exclusive)
              gstType: GstType.cgst, // gst type (igst/cgst/sgst/utgst)
              gstPercentage: 20, // optional additional percentage
              showGstType: true, // show gst type
              showGstPercentage: true, // show gst percentage
              showGstMode: true, // show gst mode
              showGstAmount: true, // show gst amount
              showOnlyTotal:
                  false, // show only total amount if true to show only total
              avoidFormatting:
                  false, // avoid formatting if true to show raw text
              hideCurrencySymbol:
                  false, // hide currency symbol if true to hide symbol
              /// Callback to get calculated values
              gstValueCallBack: (gstAmount) {
                print('gstValues from widget: ${gstAmount.toJson()}');
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
