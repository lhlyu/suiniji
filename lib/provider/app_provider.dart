import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_provider.g.dart';

class Feature {
  String name;
  String label;
  bool enable;

  Feature({required this.name, required this.label, this.enable = false});

  Feature copyWith({String? name, String? label, bool? enable}) {
    return Feature(
      name: name ?? this.name,
      label: label ?? this.label,
      enable: enable ?? this.enable,
    );
  }
}

@riverpod
class App extends _$App {
  @override
  List<Feature> build() => [
        Feature(name: 'theme', label: '主题'),
      ];

  void updateFeature(Feature updatedFeature) {
    final features = List<Feature>.from(state);
    final index = features.indexWhere((v) => v.name == updatedFeature.name);
    features[index] = updatedFeature;
    state = features;
  }
}
