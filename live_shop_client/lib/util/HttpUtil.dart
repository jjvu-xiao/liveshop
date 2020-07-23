import 'package:dio/dio.dart';
import 'package:liveshop/common/AppConstants.dart';
import 'package:liveshop/util/LogUtil.dart';

/// 网络请求工具类
/// Date: 2020-07-16
/// Author: Xiao
class HttpUtil {

  Dio _dio;

  // 初始化DIO实例，并且设置连接超时时间
  void init() {
      _dio = Dio();
      _dio.options.baseUrl = AppConstants.BASE_URL;
      _dio.options.connectTimeout = 5000;
      _dio.options.receiveTimeout = 8000;
      _dio.interceptors.add(LogsInterceptors());
      _dio.interceptors.add(ResponseInterceptors());
  }

  
  /// 通用的GET请求，数据类型默认为URL参数
  get(url, params) async {
     Response response = await _dio.get(url, queryParameters: params);
     return response.data;
   }

  /// 通用的POST请求，数据类型默认为JSON格式
  post(url, params) async {
    LogUtil.v(params.runtimeType.toString());
    Response response = await _dio.post(url, data: params);
    return response.data;
  }

}

/// 网络请求的日志拦截器
class LogsInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async{
    print("请求baseUrl：${options.baseUrl}");
    print("请求url：${options.path}");
    print('请求头: ' + options.headers.toString());
    if (options.data != null) {
      print('请求参数: ' + options.data.toString());
    }
    return options;
  }

  @override
  onResponse(Response response)async {
    return response.toString();
  }

  @override
  onError(DioError err) async{
    print('请求异常: ' + err.toString());
    print('请求异常信息: ' + err.response?.toString() ?? "");
    return err;
  }
}

/// 响应拦截器
class ResponseInterceptors extends InterceptorsWrapper {
  @override
  onResponse(Response response) async {
    print(response.request);
  }
}