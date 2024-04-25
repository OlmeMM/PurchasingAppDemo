package dev.purchasing_group.purchasing_app.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

    //requires login info to the user in the home page
    @GetMapping("/secured")
    public String secured() {
        return "Hello, secured";

    }

}
