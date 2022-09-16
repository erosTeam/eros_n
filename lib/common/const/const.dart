class NHConst {
  static const String userAgent =
      'Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 ErosN/1.0.0';

  static const String accept =
      'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9';

  static const String acceptLanguage =
      'zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6';

  static const String baseUrl = 'https://nhentai.net/';
  static const String baseHost = 'nhentai.net';

  // 瀑布流视图参数
  // static const double waterfallFlowCrossAxisSpacing = 4.0;
  // static const double waterfallFlowMainAxisSpacing = 4.0;
  // static const double waterfallFlowMaxCrossAxisExtent = 150.0;
  // static const double waterfallFlowMaxCrossAxisExtentTablet = 220.0;

  // 瀑布流视图参数 large
  static const double waterfallFlowLargeCrossAxisSpacing = 10.0;
  static const double waterfallFlowLargeMainAxisSpacing = 10.0;
  static const double waterfallFlowLargeMaxCrossAxisExtent = 220.0;

  // Grid视图参数
  static const double gridCrossAxisSpacing = 6.0;
  static const double gridMainAxisSpacing = 6.0;
  static const double gridMaxCrossAxisExtent = 150.0;
  static const double gridChildAspectRatio = 1 / 1.8;
}
