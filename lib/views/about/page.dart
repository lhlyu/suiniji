import 'package:flutter/material.dart';
import 'package:flutter_template/provider/app_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AboutPage extends ConsumerStatefulWidget {
  const AboutPage({super.key});

  @override
  ConsumerState createState() => _AboutPageState();
}

class _AboutPageState extends ConsumerState<AboutPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('关于')),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final app = ref.watch(appProvider);

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: app
                  .map((v) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(v.label),
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
          }),
        ),
      ),
    );
  }
}
