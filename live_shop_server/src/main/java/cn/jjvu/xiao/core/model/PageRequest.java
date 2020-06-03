package cn.jjvu.xiao.core.model;

import lombok.Data;

import java.util.HashMap;
import java.util.Map;
@Data
public class PageRequest {

    // 当前页码
    private int pageNum = 1;

    // 每页数量
    private int pageSize = 10;

    // 查询参数
    private Map<String, Object> params = new HashMap<>();

}
