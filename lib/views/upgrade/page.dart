import 'package:flutter/material.dart';
import 'package:flutter_template/provider/app_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UpgradePage extends StatelessWidget {
  const UpgradePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('升级')),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final app = ref.watch(appProvider);

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: app
                    .map((v) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                '${v.label}:${ref.read(appProvider.notifier).state.firstWhere((v) => v.name == 'theme').enable}'),
                            Switch(
                              value: v.enable,
                              onChanged: (bool newValue) {
                                ref.read(appProvider.notifier).updateFeature(v.copyWith(enable: newValue));
                              },
                            ),
                          ],
                        ))
                    .toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
