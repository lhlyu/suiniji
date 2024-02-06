# 主题


## ThemeData属性

```dart
ThemeData ThemeData({
  bool? applyElevationOverlayColor, // 是否在深色模式下应用高度叠加色
  NoDefaultCupertinoThemeData? cupertinoOverrideTheme, // 用于覆盖Cupertino组件主题的设置
  Iterable<ThemeExtension<dynamic>>? extensions, // 允许自定义的额外主题扩展
  InputDecorationTheme? inputDecorationTheme, // 定义输入框装饰的默认值
  MaterialTapTargetSize? materialTapTargetSize, // 调整Material组件的点击目标大小
  PageTransitionsTheme? pageTransitionsTheme, // 页面切换动画的主题
  TargetPlatform? platform, // 设定应用的目标平台风格
  ScrollbarThemeData? scrollbarTheme, // 滚动条的主题数据
  InteractiveInkFeatureFactory? splashFactory, // 自定义水波纹效果
  bool? useMaterial3, // 是否使用Material Design 3
  VisualDensity? visualDensity, // 控制组件的紧凑程度
  Brightness? brightness, // 应用整体明暗模式
  Color? canvasColor, // 画布颜色，如Scaffold的背景色
  Color? cardColor, // 卡片颜色
  ColorScheme? colorScheme, // 定义主题的颜色方案
  Color? colorSchemeSeed, // 用于生成ColorScheme的种子颜色
  Color? dialogBackgroundColor, // 对话框背景色
  Color? disabledColor, // 禁用状态下的颜色
  Color? dividerColor, // 分割线颜色
  Color? focusColor, // 焦点组件的颜色
  Color? highlightColor, // 长按高亮颜色
  Color? hintColor, // 提示文字颜色
  Color? hoverColor, // 鼠标悬停颜色
  Color? indicatorColor, // 选项卡栏指示器颜色
  Color? primaryColor, // 主色，导航栏背景等
  Color? primaryColorDark, // 主色的暗色版本
  Color? primaryColorLight, // 主色的亮色版本
  MaterialColor? primarySwatch, // 主题颜色样本，包含多种深浅不同的颜色
  Color? scaffoldBackgroundColor, // Scaffold背景色
  Color? secondaryHeaderColor, // 次级头部颜色
  Color? shadowColor, // 阴影颜色
  Color? splashColor, // 点击时水波纹颜色
  Color? unselectedWidgetColor, // 未选中控件的颜色
  String? fontFamily, // 全局字体家族
  List<String>? fontFamilyFallback, // 字体家族回退列表
  String? package, // 指定字体或主题资源所在的包
  IconThemeData? iconTheme, // 图标主题
  IconThemeData? primaryIconTheme, // 主要图标主题
  TextTheme? primaryTextTheme, // 主要文本主题
  TextTheme? textTheme, // 文本主题
  Typography? typography, // 排版风格
  ActionIconThemeData? actionIconTheme, // 动作图标主题数据
  AppBarTheme? appBarTheme, // 应用栏主题
  BadgeThemeData? badgeTheme, // 徽章主题数据
  MaterialBannerThemeData? bannerTheme, // Material横幅主题数据
  BottomAppBarTheme? bottomAppBarTheme, // 底部应用栏主题
  BottomNavigationBarThemeData? bottomNavigationBarTheme, // 底部导航栏主题数据
  BottomSheetThemeData? bottomSheetTheme, // 底部表单主题数据
  ButtonBarThemeData? buttonBarTheme, // 按钮栏主题数据
  ButtonThemeData? buttonTheme, // 旧版按钮主题数据
  CardTheme? cardTheme, // 卡片主题
  CheckboxThemeData? checkboxTheme, // 复选框主题数据
  ChipThemeData? chipTheme, // 芯片主题数据
  DataTableThemeData? dataTableTheme, // 数据表主题数据
  DatePickerThemeData? datePickerTheme, // 日期选择器主题数据
  DialogTheme? dialogTheme, // 对话框主题
  DividerThemeData? dividerTheme, // 分割线主题数据
  DrawerThemeData? drawerTheme, // 抽屉主题数据
  DropdownMenuThemeData? dropdownMenuTheme, // 下拉菜单主题数据
  ElevatedButtonThemeData? elevatedButtonTheme, // 凸起按钮主题数据
  ExpansionTileThemeData? expansionTileTheme, // 可展开列表项主题数据
  FilledButtonThemeData? filledButtonTheme, // 填充按钮主题数据
  FloatingActionButtonThemeData? floatingActionButtonTheme, // 浮动动作按钮主题数据
  IconButtonThemeData? iconButtonTheme, // 图标按钮主题数据
  ListTileThemeData? listTileTheme, // 列表项主题数据
  MenuBarThemeData? menuBarTheme, // 菜单栏主题数据
  MenuButtonThemeData? menuButtonTheme, // 菜单按钮主题数据
  MenuThemeData? menuTheme, // 菜单主题数据
  NavigationBarThemeData? navigationBarTheme, // 导航栏主题数据
  NavigationDrawerThemeData? navigationDrawerTheme, // 导航抽屉主题数据
  NavigationRailThemeData? navigationRailTheme, // 导航轨道主题数据
  OutlinedButtonThemeData? outlinedButtonTheme, // 轮廓按钮主题数据
  PopupMenuThemeData? popupMenuTheme, // 弹出菜单主题数据
  ProgressIndicatorThemeData? progressIndicatorTheme, // 进度指示器主题数据
  RadioThemeData? radioTheme, // 单选按钮主题数据
  SearchBarThemeData? searchBarTheme, // 搜索栏主题数据
  SearchViewThemeData? searchViewTheme, // 搜索视图主题数据
  SegmentedButtonThemeData? segmentedButtonTheme, // 分段按钮主题数据
  SliderThemeData? sliderTheme, // 滑块主题数据
  SnackBarThemeData? snackBarTheme, // Snackbar主题数据
  SwitchThemeData? switchTheme, // 开关按钮主题数据
  TabBarTheme? tabBarTheme, // 标签栏主题
  TextButtonThemeData? textButtonTheme, // 文本按钮主题数据
  TextSelectionThemeData? textSelectionTheme, // 文本选择主题数据
  TimePickerThemeData? timePickerTheme, // 时间选择器主题数据
  ToggleButtonsThemeData? toggleButtonsTheme, // 切换按钮主题数据
  TooltipThemeData? tooltipTheme, // 工具提示主题数据
  Color? toggleableActiveColor, // 可切换组件的激活颜色
  Color? selectedRowColor, // 选中行的颜色
  Color? errorColor, // 错误颜色
  Color? backgroundColor, // 背景色
  Color? bottomAppBarColor, // 底部应用栏颜色
})
```