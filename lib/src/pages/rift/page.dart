// Flutter imports:
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suiniji/src/commons/constants/strings.dart';
import 'package:suiniji/src/commons/widgets/pin_input/pin_input.dart';

class RiftPage extends StatelessWidget {
  const RiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName),
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () {
            /// 返回
            context.pop();
          },
        ),
      ),
      body: const Center(
        child: PinInput(),
      ),
    );
  }
}
