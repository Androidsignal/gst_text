import 'package:flutter/material.dart';
import 'package:gst_text/gst_model.dart';
import 'package:intl/intl.dart';

class GstText extends StatelessWidget {
  final num amount;
  final GstType gstType;

  /// Optional overrides
  final num? gstPercentage;

  /// Skip formatting and show raw text
  final bool avoidFormatting;

  /// UI customization
  final String currencySymbol;
  final bool showOnlyTotal;
  final bool showGstType;
  final bool showGstPercentage;
  final bool hideCurrencySymbol;

  ///  Callback for returning calculated values
  final void Function(GstModel)? gstValueCallBack;

  const GstText({
    super.key,
    required this.amount,
    required this.gstType,
    this.gstPercentage,
    this.showOnlyTotal = false,
    this.showGstType = false,
    this.currencySymbol = "₹",
    this.showGstPercentage = false,
    this.avoidFormatting = false,
    this.hideCurrencySymbol = false,
    this.gstValueCallBack,
  });

  /// Format amount using intl or raw
  String formatAmount(num value) {
    if (avoidFormatting) {
      return "${hideCurrencySymbol ? "" : currencySymbol}${value.toStringAsFixed(2)}";
    }
    final formatter =
        NumberFormat.currency(symbol: hideCurrencySymbol ? "" : currencySymbol);
    return formatter.format(value);
  }

  @override
  Widget build(BuildContext context) {
    final GstModel gstTextCalculate = GstModel.calculate(
      amount: amount,
      gstType: gstType,
      gstPercentage: gstPercentage,
    );

    ///  Trigger callback if provided
    if (gstValueCallBack != null) {
      gstValueCallBack!(gstTextCalculate);
    }

    final amountWidget = Text(
      formatAmount(gstTextCalculate.amount),
      style: const TextStyle(fontSize: 18, color: Colors.black),
    );

    Widget? gstWidget;
    if (showGstType || showGstPercentage) {
      String gstLabel = "GST";

      if (showGstType) {
        final typeLabel =
            gstTextCalculate.gstType.toString().split('.').last.toUpperCase();
        if (showGstPercentage) {
          gstLabel +=
              " [$typeLabel (${gstTextCalculate.gstPercentage.toStringAsFixed(0)}%)]";
        } else {
          gstLabel += " [$typeLabel]";
        }
      } else if (showGstPercentage) {
        gstLabel += " (${gstTextCalculate.gstPercentage.toStringAsFixed(0)}%)";
      }

      gstLabel += ": ${formatAmount(gstTextCalculate.gstAmount)}";

      gstWidget = Text(
        gstLabel,
        style: const TextStyle(fontSize: 16, color: Colors.grey),
      );
    }

    final totalWidget = Text(
      formatAmount(gstTextCalculate.total),
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );

    if (showOnlyTotal) return totalWidget;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        amountWidget,
        if (gstWidget != null) gstWidget,
        totalWidget,
      ],
    );
  }
}
