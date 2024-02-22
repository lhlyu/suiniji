// // Flutter imports:
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// // Package imports:
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// // Project imports:
// import 'package:suiniji/src/commons/utils/toast.dart';
// import 'package:suiniji/src/commons/utils/verify.dart';
// import 'package:suiniji/src/commons/widgets/picture_click_captcha/picture_click_captcha.dart';
// import 'package:suiniji/src/pages/login/login_controller.dart';
// import 'package:suiniji/src/pages/login/widgets/agreement_checkbox.dart';
// import 'package:suiniji/src/pages/login/widgets/captcha_input.dart';
// import 'package:suiniji/src/pages/login/widgets/footer.dart';
// import 'package:suiniji/src/pages/login/widgets/phone_input.dart';
// import 'package:suiniji/src/pages/login/widgets/show_agreement_dialog.dart';

// final GlobalKey<ScaffoldState> navigatorKey = GlobalKey<ScaffoldState>();

// class LoginPage extends ConsumerWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final action = ref.read(loginControllerProvider.notifier);
//     final state = ref.watch(loginControllerProvider);

//     return Scaffold(
//       key: navigatorKey,
//       backgroundColor: Theme.of(context).cardColor,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             PhoneInput(
//               onChanged: action.updateMobile,
//             ),
//             const SizedBox(height: 16),
//             CaptchaInput(
//               canSendCaptcha: state.mobile.length >= 13,
//               onChanged: (value) {
//                 action.updateCaptcha(value);
//                 if (value.length < 6 || state.mobile.isEmpty) {
//                   return;
//                 }
//                 // 校验短信验证码
//                 Toast.success('手机号: ${state.mobile}\n验证码: $value');
//               },
//               onSendCaptcha: () async {
//                 // 校验一下手机号码是否正确
//                 if (!isValidPhoneNumber(action.getRealPhone())) {
//                   Toast.error('请输入正确的手机号');
//                   return false;
//                 }

//                 if (navigatorKey.currentContext == null) {
//                   return false;
//                 }
//                 if (!state.agreement) {
//                   // 没有同意协议，需要弹出提示框
//                   final ok = await showAgreementDialog(navigatorKey.currentContext!);
//                   if (ok == null || ok == false) {
//                     return false;
//                   }
//                   action.changeAgreement(true);
//                 }

//                 // error: Don't use 'BuildContext's across async gaps.
//                 // Try rewriting the code to not reference the 'BuildContext'
//                 // Type: Future<bool?> Function(BuildContext)
//                 final ok = await commonPictureClickCaptcha(navigatorKey.currentContext!);
//                 if (ok == null || ok == false) {
//                   return false;
//                 }

//                 action.updateCaptcha("");
//                 // 发送验证码

//                 return true;
//               },
//             ),
//             const SizedBox(height: 16),
//             AgreementCheckbox(
//               agreement: state.agreement,
//               onChanged: action.changeAgreement,
//             ),
//             const SizedBox(height: 36),
//           ],
//         ),
//       ),
//       bottomSheet: const Footer(),
//     );
//   }
// }
