/// GST Types and Modes
enum GstType { igst, sgst, cgst, utgst }

enum GstMode {
  inclusive,

  /// Amount already includes GST
  exclusive,

  /// GST is added on top of amount
}

/// Default GST percentages for each type
const Map<GstType, double> defaultGstPercentage = {
  GstType.igst: 18,
  GstType.sgst: 9,
  GstType.cgst: 9,
  GstType.utgst: 9,
};

class GstModel {
  num amount;
  num gstAmount;
  num total;
  num gstPercentage;
  GstType gstType;
  GstMode? gstMode;

  GstModel({
    required this.amount,
    required this.gstAmount,
    required this.total,
    required this.gstPercentage,
    required this.gstType,
    this.gstMode,
  });

  factory GstModel.calculate({
    required num amount,
    required GstType gstType,
    num? gstPercentage,
    GstMode? gstMode,
  }) {
    final num percentage = (gstPercentage != null && gstPercentage > 0)
        ? defaultGstPercentage[gstType]! + gstPercentage
        : defaultGstPercentage[gstType] ?? 0;

    num gstAmount;
    num baseAmount;
    num total;

    if (gstMode == GstMode.inclusive) {
      // Inclusive → amount includes GST
      gstAmount = amount * percentage / (100 + percentage);
      baseAmount = amount - gstAmount;
      total = amount;
    } else {
      // Exclusive or null → add GST
      gstAmount = amount * percentage / 100;
      baseAmount = amount;
      total = amount + gstAmount;
    }

    return GstModel(
      amount: baseAmount,
      gstAmount: gstAmount,
      total: total,
      gstPercentage: percentage,
      gstType: gstType,
      gstMode: gstMode,
    );
  }
  Map<String, dynamic> toJson() => {
        "amount": amount,
        "gstAmount": gstAmount,
        "total": total,
        "gstPercentage": gstPercentage,
        "gstType": gstType.toString(),
      };
}
