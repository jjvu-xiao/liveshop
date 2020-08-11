import 'dart:convert';
/// 字符串工具
class LiveShopStringUtil {
  /// 格式化城市信息
  static String formatCity(String cityJson) {
    var data = jsonDecode(cityJson);
    var provinceName = data['provinceName'];
    var cityName = data['cityName'];
    var areaName = data['areaName'];
    return '$provinceName-$cityName-$areaName';
  }
}