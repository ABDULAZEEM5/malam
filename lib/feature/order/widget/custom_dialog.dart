import 'package:flutter/material.dart';
import 'package:malam/sheard/custom_text.dart';

Future<void> showDeleteDialog({
  required BuildContext context,
  required VoidCallback onDelete,
  required Widget child
}) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Center(
          child: const CustomText(
            text: "حذف الطلب",
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const CustomText(
          text:
              "هل أنت متأكد من حذف هذا الطلب؟ لا يمكن التراجع عن هذه العملية.",
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            child: const CustomText(
              text: "إلغاء",
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context); // إغلاق الحوار
              onDelete(); // تنفيذ الحذف
            },
            child:child
          ),
        ],
      );
    },
  );
}
