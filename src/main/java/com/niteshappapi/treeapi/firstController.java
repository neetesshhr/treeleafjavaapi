package com.niteshappapi.treeapi;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class firstController {
    @GetMapping("/")
    public String first_api(){
       return "<h1> Hello world Welocome to spring boot</h1>";
    }
    
}
