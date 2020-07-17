package cn.jjvu.xiao.utils;

import java.util.regex.Pattern;

/**
 * 字符串工具类
 * @Date 2020-07-17
 */
public class ILiveShopStringUtils {

    /**
     * 校验邮箱地址格式是否正确
     * @param email 邮箱地址
     * @return 正确结果
     */
    public static boolean isValidEmail(String email) {
        if ((email != null) && (!email.isEmpty())) {
            return Pattern.matches("^(\\w+([-.][A-Za-z0-9]+)*){3,18}@\\w+([-.][A-Za-z0-9]+)*\\.\\w+([-.][A-Za-z0-9]+)*$", email);
        }
        return false;
    }

}
