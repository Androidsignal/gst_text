import 'package:flutter/material.dart';
import 'package:gst_text/gst_model.dart';
import 'package:intl/intl.dart';

class GstText extends StatelessWidget {
  final num amount;
  final GstType gstType;
  final GstMode gstMode;

  /// Optional overrides
  final num? gstPercentage;

  /// Skip formatting and show raw text
  final bool avoidFormatting;

  /// UI customization
  final String currencySymbol;
  final bool showOnlyTotal;
  final bool hideCurrencySymbol;

  /// Individual GST display flags (default false → hidden)
  final bool showGstAmount;
  final bool showGstType;
  final bool showGstPercentage;
  final bool showGstMode;

  /// Callback for returning calculated values
  final void Function(GstModel)? gstValueCallBack;

  const GstText({
    super.key,
    required this.amount,
    required this.gstType,
    required this.gstMode,
    this.gstPercentage,
    this.showOnlyTotal = false,
    this.currencySymbol = "₹",
    this.avoidFormatting = false,
    this.hideCurrencySymbol = false,
    this.showGstAmount = false,
    this.showGstType = false,
    this.showGstPercentage = false,
    this.showGstMode = false,
    this.gstValueCallBack,
  });

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
    final GstModel gstValues = GstModel.calculate(
      amount: amount,
      gstType: gstType,
      gstPercentage: gstPercentage,
      gstMode: gstMode,
    );

    gstValueCallBack?.call(gstValues);

    final amountWidget = Text(
      formatAmount(gstValues.amount),
      style: const TextStyle(fontSize: 18, color: Colors.black),
    );

    // Build GST line only if any part is enabled
    Widget? gstWidget;
    if (showGstAmount || showGstType || showGstPercentage || showGstMode) {
      String gstLabel = "";

      // Mode (Inclusive/Exclusive/GST)
      if (showGstMode) {
        if (gstMode == GstMode.inclusive) {
          gstLabel += "Inclusive GST";
        } else if (gstMode == GstMode.exclusive) {
          gstLabel += "Exclusive GST";
        } else {
          gstLabel += "GST";
        }
      }

      /// gst Type (CGST/SGST etc.)
      if (showGstType) {
        if (gstLabel.isNotEmpty) gstLabel += " ";
        gstLabel +=
            "[${gstValues.gstType.toString().split('.').last.toUpperCase()}]";
      }

      /// gst Percentage (9%)
      if (showGstPercentage) {
        gstLabel += " (${gstValues.gstPercentage.toStringAsFixed(0)}%)";
      }

      /// gst  Amount
      if (showGstAmount) {
        if (gstLabel.isNotEmpty) gstLabel += " ";
        gstLabel += formatAmount(gstValues.gstAmount);
      }

      gstWidget = Text(
        gstLabel,
        style: const TextStyle(fontSize: 16, color: Colors.grey),
      );
    }

    final totalWidget = Text(
      formatAmount(gstValues.total),
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
