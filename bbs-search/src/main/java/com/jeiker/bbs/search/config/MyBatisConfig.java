package com.jeiker.bbs.search.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

/**
 * MyBatis相关配置
 */
@Configuration
@MapperScan({"com.jeiker.bbs.mapper", "com.jeiker.bbs.search.dao"})
public class MyBatisConfig {

}
