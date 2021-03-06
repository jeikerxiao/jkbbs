package com.jeiker.bbs.auth.service;

import com.jeiker.bbs.common.domain.UserDto;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Description: 后台管理 用户
 * User: jeikerxiao
 * Date: 2020/10/26 7:20 下午
 */
@FeignClient("bbs-admin")
public interface UmsAdminService {

    @GetMapping("/admin/loadByUsername")
    UserDto loadUserByUsername(@RequestParam String username);
}
