enum GstType { igst, sgst, cgst, utgst }

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

  GstModel({
    required this.amount,
    required this.gstAmount,
    required this.total,
    required this.gstPercentage,
    required this.gstType,
  });

  factory GstModel.calculate({
    required num amount,
    required GstType gstType,
    num? gstPercentage,
  }) {
    final num percentage = (gstPercentage != null && gstPercentage > 0)
        ? defaultGstPercentage[gstType]! + gstPercentage
        : defaultGstPercentage[gstType]!;

    final num gstAmount = amount * percentage / 100;
    final num total = amount + gstAmount;

    return GstModel(
      amount: amount,
      gstAmount: gstAmount,
      total: total,
      gstPercentage: percentage,
      gstType: gstType,
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
