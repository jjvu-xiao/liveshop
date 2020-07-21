
import {baseUrl} from '@/utils/global'

export default {
    method: 'get',
    // URL的前缀 IP地址或者域名
    baseUrl: baseUrl,
    // 设置请求头的数据类型为json
    headers: {
        'Content-Type': 'application/json;charset=UTF-8'
    },
    // 请求参数
    data: {},
    // 超时时间为10秒
    timeout: 10000,
    // 携带凭证
    withCredentials: true,
    // 服务器响应数据类型
    responseType: 'json'
}