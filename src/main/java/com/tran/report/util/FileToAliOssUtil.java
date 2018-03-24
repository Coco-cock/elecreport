package com.tran.report.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.web.multipart.MultipartFile;

import com.aliyun.oss.ClientException;
import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.OSSException;
import com.aliyun.oss.model.PutObjectResult;

/**
 * @version 1.0
 * @author TianMengJun
 * @since JDK 1.8.0_20 Create at: 2018年2月26日 下午2:50:29 Description:
 *
 * @param
 */

public class FileToAliOssUtil {
	private static final Logger logger = Logger.getLogger(FileToAliOssUtil.class);
	/**
	 * 上传单个文件到阿里云OSS 返回访问地址
	 * @param multipartFile
	 * @return
	 */
	public static String fileToAliOSS(MultipartFile multipartFile) {
		Properties props = new Properties();
		try {
			props = PropertiesLoaderUtils.loadAllProperties("aliyunoss.properties");
		} catch (IOException e1) {
			logger.error("FileToAliOssUtil-->fileToAliOSS加载配置失败"+e1);
		}
		String ENDPOINT = props.getProperty("ENDPOINT");
		String KEY_ID = props.getProperty("KEY_ID");
		String KEY_SECRET = props.getProperty("KEY_SECRET");
		String BACKET_NAME = props.getProperty("BACKET_NAME");
		String FOLDER = props.getProperty("FOLDER");
		String imgUrl =null;

		if (!multipartFile.isEmpty()) {
			OSS ossClient = new OSSClient(ENDPOINT, KEY_ID, KEY_SECRET);

			String fileName = multipartFile.getOriginalFilename()
					.substring(multipartFile.getOriginalFilename().lastIndexOf("."));// getRealName(part);// 获取文件名
			try (InputStream inputStream = multipartFile.getInputStream();) {
				// 获取图片的UUID文件名
				fileName = UUID.randomUUID().toString() + ".jpg";
				// 文件put到阿里云OSS
				PutObjectResult putObjectResult = ossClient.putObject(BACKET_NAME, FOLDER +"/"+ fileName, inputStream);

				if (putObjectResult != null) {
				
					//例：http://elecreport.oss-cn-beijing.aliyuncs.com/userImg/5ff9ba12-6c35-418f-9631-0758903730c7.jpg
					imgUrl="http://"+BACKET_NAME+"."+ENDPOINT.substring(6)+"/"+FOLDER +"/"+ fileName;
				}
			} catch (OSSException | ClientException | IOException e) {
				logger.error("上传图片到阿里云OSS出现异常"+e);
			}
			ossClient.shutdown();
		}

		logger.info("上传图片完成!");
		return imgUrl;

	}

}
