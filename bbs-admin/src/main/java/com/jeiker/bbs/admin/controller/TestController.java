package com.jeiker.bbs.admin.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;
import java.util.Map;

/**
 * Description: jkbbs
 * User: jeikerxiao
 * Date: 2020/10/27 3:39 下午
 */
@RestController
@Slf4j
public class TestController {

    @Value("${spring.application.name}")
    private String applicationName;

    @GetMapping("/")
    public String index() {
        return applicationName + " up";
    }

    @GetMapping("/test")
    public Map<String, String> test() {
        return Collections.singletonMap("message", applicationName + " test successful");
    }
}


