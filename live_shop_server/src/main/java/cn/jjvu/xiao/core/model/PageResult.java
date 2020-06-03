package cn.jjvu.xiao.core.model;

import lombok.Data;

import java.util.List;

/**
 * 分页返回结果
 * @author xiaohongbing
 * @date 2020-06-03
 */
@Data
public class PageResult {
    // 当前页码
    private int pageNum;
    // 每页数量
    private int pageSize;
    // 记录总数
    private long totalSize;
    // 页码总数
    private int totalPages;
    // 分页数据
    private List<?> content;
}
