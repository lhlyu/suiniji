// Dart imports:
import 'dart:io';

// Package imports:
import 'package:args/args.dart';

void main(List<String> arguments) {
  try {
    final parser = ArgParser()..addOption('feature', abbr: 'f', help: '输入需要生成的feature名字');

    final results = parser.parse(arguments);

    if (results['feature'] == null) {
      // ignore: avoid_print
      print('请提供生成feature的名字，使用命令 -f 或者 --feature');
      exit(1);
    }

    final featureName = results['feature'];
    createCleanArchitectureStructureInLib(featureName);

    // ignore: avoid_print
    print('成功生成新的feature $featureName!');
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
}

/// doc: https://blog.codemagic.io/clean-architecture-explored/
/// repo: https://github.com/JasperEssien2/ricky_and_morty
void createCleanArchitectureStructureInLib(String featureName) {
  final basePath = 'lib/src/features/$featureName';

  final directories = [
    /// 基础设施
    /// 该层负责与不同数据源的通信。它可以是本地服务，也可以是远程服务。
    /// 它包含存储库、数据传输对象和数据提供程序。
    '$basePath/infrastructure/datasources/local',
    '$basePath/infrastructure/datasources/remote',
    '$basePath/infrastructure/models',
    '$basePath/infrastructure/repositories',

    /// 域
    /// 它保留了主要的业务逻辑。它包含抽象、验证器和实体。
    /// repository.dart 是抽象类
    /// usecases 定义了该应用程序的所有用例，单个用例类每个类只能执行一个操作
    /// export.dart 导出所有的usecases
    '$basePath/domain/entities',
    '$basePath/domain/usecases',
    '$basePath/domain/repository.dart',
    '$basePath/domain/export.dart',

    /// 应用
    /// 此层处理来自表示层的事件并公开状态。
    /// 此外，功能使用它来相互通信。
    '$basePath/application/controller.dart',

    /// 页面
    /// 它包含页面、小部件和它们之间的通信。
    '$basePath/presentation/providers',
    '$basePath/presentation/page.dart',
    '$basePath/presentation/widgets',
  ];

  for (final directory in directories) {
    if (directory.endsWith('.dart')) {
      File(directory).createSync(recursive: true);
      continue;
    }
    Directory(directory).createSync(recursive: true);
  }
}
