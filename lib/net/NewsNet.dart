import 'package:dio/dio.dart';

class BaseUrl {
  // 配置默认请求地址
  static const String url = 'http://127.0.0.1';
}

class HttpUtil {
  static void get(String url,
      {Map<String, dynamic> data,
      Map<String, dynamic> headers,
      Function success,
      Function error}) async {
    // 数据拼接
    if (data != null && data.isNotEmpty) {
      StringBuffer options = new StringBuffer('?');
      data.forEach((key, value) {
        options.write('${key}=${value}&');
      });
      String optionsStr = options.toString();
      optionsStr = optionsStr.substring(0, optionsStr.length - 1);
      url += optionsStr;
    }

    // 发送get请求
    await _sendRequest(url, 'get', success, headers: headers, error: error);
  }

  static void post(String url,
      {Map<String, dynamic> data,
      Map<String, dynamic> headers,
      Function success,
      Function error}) async {
    // 发送post请求
    _sendRequest(url, 'post', success,
        data: data, headers: headers, error: error);
  }

  // 请求处理
  static Future _sendRequest(String url, String method, Function success,
      {Map<String, dynamic> data,
      Map<String, dynamic> headers,
      Function error}) async {
    int _code;
    String _msg;
    var _backData;

    // 检测请求地址是否是完整地址
    if (!url.startsWith('http')) {
      url = BaseUrl.url + url;
    }

    try {
      Map<String, dynamic> dataMap = data == null ? new Map() : data;
      Map<String, dynamic> headersMap = headers == null ? new Map() : headers;

      // 配置dio请求信息
      Response response;
      Dio dio = new Dio();
      dio.options.connectTimeout = 10000; // 服务器链接超时，毫秒
      dio.options.receiveTimeout = 3000; // 响应流上前后两次接受到数据的间隔，毫秒
      dio.options.headers
          .addAll(headersMap); // 添加headers,如需设置统一的headers信息也可在此添加

      if (method == 'get') {
        response = await dio.get(url);
      } else {
        response = await dio.post(url, data: dataMap);
      }

      if (response.statusCode != 200) {
        _msg = '网络请求错误,状态码:' + response.statusCode.toString();
        _handError(error, _msg);
        return;
      }

      // 返回结果处理
      Map<String, dynamic> resCallbackMap = response.data;
      _code = resCallbackMap['code'];
      _msg = resCallbackMap['msg'];
      _backData = resCallbackMap['data'];

      if (success != null) {
        if (_code == 0) {
          success(_backData);
        } else {
          String errorMsg = _code.toString() + ':' + _msg;
          _handError(error, errorMsg);
        }
      }
    } catch (exception) {
      _handError(error, '数据请求错误：' + exception.toString());
    }
  }

  // 返回错误信息
  static Future _handError(Function errorCallback, String errorMsg) {
    if (errorCallback != null) {
      errorCallback(errorMsg);
    }
  }
}
