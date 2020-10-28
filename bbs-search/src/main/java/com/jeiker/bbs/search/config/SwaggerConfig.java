package com.jeiker.bbs.search.config;

import com.jeiker.bbs.common.config.BaseSwaggerConfig;
import com.jeiker.bbs.common.domain.SwaggerProperties;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * Swagger API文档相关配置
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig extends BaseSwaggerConfig {

    @Override
    public SwaggerProperties swaggerProperties() {
        return SwaggerProperties.builder()
                .apiBasePackage("com.jeiker.bbs.search.controller")
                .title("bbs 搜索系统")
                .description("bbs 搜索相关接口文档")
                .contactName("jeiker")
                .version("1.0")
                .enableSecurity(false)
                .build();
    }
}
