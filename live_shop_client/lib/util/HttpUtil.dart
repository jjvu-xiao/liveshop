import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:liveshop/common/AppConstants.dart';
import 'package:liveshop/util/LogUtil.dart';

/// 网络请求工具类
/// Date: 2020-07-16
/// Author: Xiao
class HttpUtil {

  static Dio _dio;

  /// 最大连接超时时间
  static int maxConnectTimeout = 5000;
  /// 最大响应时间
  static int maxReceiveTimeout = 8000;

  /// 初始化DIO实例，并且设置连接超时时间
  static void init() {
      _dio = Dio();
      _dio.options.baseUrl = AppConstants.BASE_URL;
      _dio.options.connectTimeout = maxConnectTimeout;
      _dio.options.receiveTimeout = maxReceiveTimeout;
      _dio.interceptors.add(LogsInterceptors());
      _dio.interceptors.add(ResponseInterceptors());
  }

  
  /// 通用的GET请求，数据类型默认为URL参数
  static get({url, params, options}) async {
     Response response = await _dio.get(url, queryParameters: params, options: options);
     return response.data;
  }

  /// 通用的POST请求，数据类型默认为JSON格式
  static post({url, params, data}) async {
    Response response = await _dio.post(url, queryParameters: params, data: data);
    return response.data;
  }

}

/// 网络请求的日志拦截器
/// 在每次发送请求之前打印请求日志
class LogsInterceptors extends InterceptorsWrapper {
  /// 在发送请求之前，打印请求头，url，请求参数
  @override
  onRequest(RequestOptions options) async{
    EasyLoading.show(status: "加载中");
    LogUtil.v("请求baseUrl：${options.baseUrl}");
    LogUtil.v("请求url：${options.path}");
    LogUtil.v('请求头: ' + options.headers.toString());
    if (options.data != null) {
      LogUtil.v('请求参数: ' + options.data.toString());
    }
    return options;
  }

  /// 收到响应数据后，打印响应数据
  @override
  onResponse(Response response)async {
    EasyLoading.dismiss();
    return response.toString();
  }

  /// 当请求失败时，打印异常信息
  @override
  onError(DioError err) async{
    EasyLoading.dismiss();
    LogUtil.v('请求异常: ' + err.toString());
    LogUtil.v('请求异常信息: ' + err.response?.toString() ?? "");
    return err;
  }
}

/// 响应拦截器
class ResponseInterceptors extends InterceptorsWrapper {

  /// 打印响应数据
  @override
  onResponse(Response response) async {
    EasyLoading.dismiss();
    LogUtil.v(response.request);
  }
}