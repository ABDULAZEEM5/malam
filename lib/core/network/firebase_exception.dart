import 'package:firebase_core/firebase_core.dart';
import 'package:malam/core/network/api_erorr.dart';

class FirebaseExceptionHandler {
  static ApiErorr handleError(FirebaseException error) {
    switch (error.code) {
      // أخطاء عامة
      case 'network-request-failed':
        return ApiErorr(message: 'لا يوجد اتصال بالإنترنت');

      case 'too-many-requests':
        return ApiErorr(message: 'تم إرسال طلبات كثيرة. حاول مرة أخرى لاحقًا');

      case 'unavailable':
        return ApiErorr(message: 'الخدمة غير متوفرة حاليًا، حاول مرة أخرى');

      // Firebase Authentication
      case 'invalid-email':
        return ApiErorr(message: 'البريد الإلكتروني غير صحيح');

      case 'user-disabled':
        return ApiErorr(message: 'تم تعطيل هذا الحساب');

      case 'user-not-found':
        return ApiErorr(message: 'لا يوجد مستخدم بهذا البريد الإلكتروني');

      case 'wrong-password':
        return ApiErorr(message: 'كلمة المرور غير صحيحة');

      case 'email-already-in-use':
        return ApiErorr(message: 'هذا البريد الإلكتروني مستخدم بالفعل');

      case 'weak-password':
        return ApiErorr(message: 'كلمة المرور ضعيفة، يجب أن تكون أقوى');

      case 'invalid-credential':
        return ApiErorr(message: 'البريد الإلكتروني أو كلمة المرور غير صحيحة');

      case 'operation-not-allowed':
        return ApiErorr(message: 'طريقة تسجيل الدخول هذه غير مفعّلة');

      case 'requires-recent-login':
        return ApiErorr(message: 'يرجى تسجيل الدخول مرة أخرى لإكمال العملية');

      // Firestore
      case 'permission-denied':
        return ApiErorr(message: 'ليس لديك صلاحية لتنفيذ هذا الإجراء');

      case 'not-found':
        return ApiErorr(message: 'لم يتم العثور على البيانات المطلوبة');

      case 'already-exists':
        return ApiErorr(message: 'البيانات موجودة مسبقًا');

      case 'resource-exhausted':
        return ApiErorr(message: 'تم تجاوز الحد المسموح للطلبات');

      case 'deadline-exceeded':
        return ApiErorr(message: 'انتهت مهلة الطلب، حاول مرة أخرى');

      case 'cancelled':
        return ApiErorr(message: 'تم إلغاء العملية');

      case 'internal':
        return ApiErorr(message: 'حدث خطأ داخلي في الخادم');

      default:
        return ApiErorr(message: error.message ?? 'حدث خطأ غير متوقع');
    }
  }
}
