import 'package:flutter/material.dart';

class OrderStatusText {
  static const pending = "قيدالانتظار";
  static const completed = "مكتمل";
  static const cancelled = "ملغي";
}
Color getStatusColor(String status) {
    switch (status) {
      case "قيدالانتظار":
        return Colors.orange;

      case "مكتمل":
        return Colors.green;

      case "رفض":
        return Colors.red;

      default:
        return Colors.grey;
    }
  }
IconData getStatusIcon(String status) {
  switch (status) {
    case "قيدالانتظار":
      return Icons.schedule;

    case "مكتمل":
      return Icons.check_circle;

    case "رفض":
      return Icons.cancel;

    default:
      return Icons.info;
  }
}
