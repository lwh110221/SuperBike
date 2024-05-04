package com.lwhao.util;

import org.apache.commons.beanutils.BeanUtils;

import java.util.Map;

/**
 * @author : Luowenhao221
 * @date : 2024/4/22 20:02
 * @Project : SuperBike
 */
public class WebUtils {
    /**
     * 快速注入
     * @param value
     * @param bean
     * @return
     */
    public static Object copyParamToBean(Map value, Object bean) {
        try {
            BeanUtils.populate(bean,value);
        } catch (Exception e) {
            e.printStackTrace();
}
        return bean;
    }
    /**
     * 将字符串转换成整数
     * @param strInt
     * @param defaultValue
     * @return
     */

    public static int parseInt(String strInt,int defaultValue) {
        int n = 0;
        try {
            n = Integer.parseInt(strInt);
        } catch (Exception e) {
            return defaultValue;
        }
        return n;
    }
}
