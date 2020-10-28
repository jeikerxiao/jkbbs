package com.jeiker.bbs.monitor;

import de.codecentric.boot.admin.server.config.EnableAdminServer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@EnableAdminServer
@SpringBootApplication
public class BbsMonitorApplication {

    public static void main(String[] args) {
        SpringApplication.run(BbsMonitorApplication.class, args);
    }

}
