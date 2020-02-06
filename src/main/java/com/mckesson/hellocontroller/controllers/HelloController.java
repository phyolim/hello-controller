package com.galvanize.hellocontroller.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @GetMapping("/hello")

    public String hello(@RequestParam(required=false, defaultValue="World") String name) {
        return String.format("Hello %s from my first Spring Boot Application!", name);
    }
}
