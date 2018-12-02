package com.essilor.uploader.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/")
  	public String frontPage() {
      return "redirect:/home";
  	}

    @RequestMapping("/home")
  	public String welcome() {
      return "welcome-page";
  	}

}
