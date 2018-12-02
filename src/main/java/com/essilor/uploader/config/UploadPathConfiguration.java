package com.essilor.uploader.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.io.File;

@Configuration
public class UploadPathConfiguration {

    @Value("${upload.path}")
    public String uploadPath;

    @Bean(name = "checkAndCreateUploadDir")
    public String checkAndCreateUploadDir() {

        File f = new File(uploadPath);
        if(!f.exists()) {
            System.out.println("Upload dir not exists, so creating the folder.......");
            //create upload path directory
            new File(uploadPath).mkdirs();
        }

        return "";
    }


}
