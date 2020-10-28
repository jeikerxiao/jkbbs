package com.jeiker.bbs.auth.config;

import com.jeiker.bbs.common.config.BaseSwaggerConfig;
import com.jeiker.bbs.common.domain.SwaggerProperties;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * Description: 接口文档配置
 * User: jeikerxiao
 * Date: 2020/10/26 7:20 下午
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig extends BaseSwaggerConfig {

    @Override
    public SwaggerProperties swaggerProperties() {
        return SwaggerProperties.builder()
                .apiBasePackage("com.jeiker.bbs.auth.controller")
                .title("bbs 认证中心")
                .description("bbs 认证中心相关接口文档")
                .contactName("jeiker")
                .version("1.0")
                .enableSecurity(true)
                .build();
    }
}
