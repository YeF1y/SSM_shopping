package com.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;
import java.util.Random;

import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;


public class UploadUtil {
	

	public static String fileUpload(MultipartFile file) throws Exception{
		if (Objects.isNull(file) || file.isEmpty() || Objects.isNull(file.getOriginalFilename())) {
			return null;
		}
		String savePath = "picture";
		String fileName = file.getOriginalFilename();
		String path = ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath("/")+savePath;
		String type = fileName.substring(fileName.lastIndexOf(".")+1, fileName.length());
		String newFileName = new SimpleDateFormat("yyMMddssSSS").format(new Date()) + new Random().nextInt(899)+100 + "." + type;
		File savefile = new File(path,newFileName);
		if(!savefile.getParentFile().exists()){
			savefile.getParentFile().mkdirs();
		}
		System.out.println("上传文件绝对路径: "+savefile.getPath());
		file.transferTo(savefile);
		return savePath+"/"+newFileName;
	}

}
