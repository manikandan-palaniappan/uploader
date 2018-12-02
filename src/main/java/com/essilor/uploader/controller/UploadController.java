package com.essilor.uploader.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.ArrayList;
import java.util.Optional;

import java.io.File;
import java.io.IOException;

@Controller
public class UploadController {
    // public static final String uploadingdir = System.getProperty("user.dir") + "/uploadingdir/";

    @Value("${upload.path}")
    public String uploadPath;

    @RequestMapping("/upload")
    public String uploadPage() {
        return "upload-page";
    }

    @RequestMapping("/list")
    public String listFilesInDir(Model model) {
        File file = new File(uploadPath);
        model.addAttribute("files", file.listFiles());
        return "list-page";
    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String uploadingPost(@RequestParam("uploadingFiles") MultipartFile[] uploadingFiles,
                                @RequestParam Optional<String> error, Model model) throws IOException {

        List<String> filesUploaded = new ArrayList<String>();

        for(MultipartFile uploadedFile : uploadingFiles) {
            System.out.println("IsEmpty Files : "+ uploadedFile.isEmpty());

            if(uploadedFile.isEmpty()) {

              System.out.println("Please provide one file to be upload to server");
              error = Optional.of("Please provide one file to be upload to server.");
              model.addAttribute("error", error);

            } else {

              File file = new File(uploadPath + uploadedFile.getOriginalFilename());
              uploadedFile.transferTo(file);
              File doneFile = new File(uploadPath + uploadedFile.getOriginalFilename() + ".done");
              doneFile.createNewFile();
              filesUploaded.add(uploadedFile.getOriginalFilename());
              model.addAttribute("error", error);

            }
        }
        model.addAttribute("filesUploaded", filesUploaded);

        return "result-page";
    }
}
