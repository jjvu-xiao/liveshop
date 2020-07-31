package cn.jjvu.xiao.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import cn.jjvu.xiao.config.FastDFSClient;

/**
 * 文件处理
 * 
 * @author Xiao
 * @date 2020-07-31
 * @version V1.0.0
 */
@RestController
@RequestMapping("/fdfs")
public class FileController {

	@Autowired
	private FastDFSClient fdfsClient;

	/**
	 * 文件上传
	 * 
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/upload")
	public Map<String, Object> upload(@RequestParam("avator") MultipartFile file) throws Exception {

		String url = fdfsClient.uploadFile(file.getBytes());

		Map<String, Object> result = new HashMap<>();
		result.put("code", 200);
		result.put("msg", "上传成功");
		result.put("url", url);

		return result;
	}

	/**
	 * 文件下载
	 * 
	 * @param fileUrl
	 *            url 开头从组名开始
	 * @param response
	 * @throws Exception
	 */
//	@RequestMapping("/download")
//	public void download(String fileUrl, HttpServletResponse response) throws Exception {
//
//		byte[] data = fdfsClient.download(fileUrl);
//
//		response.setCharacterEncoding("UTF-8");
//		response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode("test.jpg", "UTF-8"));
//
//		// 写出
//		ServletOutputStream outputStream = response.getOutputStream();
//		IOUtils.write(data, outputStream);
//	}
}
