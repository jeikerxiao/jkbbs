
-- 敏感词表
CREATE TABLE `bbs_sensitive_word` (
  `word_id` bigint(20) NOT NULL COMMENT '敏感词id',
  `word` varchar(255) NOT NULL COMMENT '敏感词',
  `create_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改人id',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`word_id`),
  KEY `idx_word` (`word`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='敏感词表';


-- 用户表
CREATE TABLE `bbs_user` (
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `realname` varchar(255) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `nickname` varchar(255) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `avatar` varchar(1000) DEFAULT NULL COMMENT '头像地址',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(16) DEFAULT NULL COMMENT '手机号',
  `website` varchar(255) DEFAULT NULL COMMENT '个人主页',
  `bio` varchar(1000) DEFAULT NULL COMMENT '个人简介',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `token` varchar(255) NOT NULL DEFAULT '' COMMENT 'token',
  `email_notification` tinyint(4) NOT NULL DEFAULT '0' COMMENT '邮件通知',
  `is_activated` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否激活(0:未激活,1:已激活)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uk_username` (`username`),
  UNIQUE KEY `uk_token` (`token`),
  KEY `idx_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 信息通知表
CREATE TABLE `bbs_notify` (
  `notify_id` bigint(20) NOT NULL,
  `topic_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `target_user_id` bigint(20) NOT NULL,
  `action` varchar(255) NOT NULL DEFAULT '',
  `content` longtext,
  `is_read` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否已读(0:未读,1:已读)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`notify_id`),
  KEY `idx_topic_id` (`topic_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_target_user_id` (`target_user_id`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='信息通知表';

-- 用户收藏话题表
CREATE TABLE `bbs_collect` (
  `collect_id` bigint(20) NOT NULL COMMENT '收藏id',
  `topic_id` bigint(20) NOT NULL COMMENT '话题id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`collect_id`),
  KEY `idx_topic_id` (`topic_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户收藏话题表';

-- 话题表
CREATE TABLE `bbs_topic` (
  `topic_id` bigint(20) NOT NULL COMMENT '话题id',
  `user_id` bigint(20) NOT NULL COMMENT '创建人id',
  `topic_title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `topic_content` longtext COMMENT '内容',
  `comment_count` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `collect_count` int(11) NOT NULL DEFAULT '0' COMMENT '收藏数',
  `like_count` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `view_count` int(11) NOT NULL DEFAULT '0' COMMENT '访问数',
  `ranking` int(11) NOT NULL DEFAULT '0' COMMENT '排名',
  `like_ids` text COMMENT '点赞人id,逗号分隔',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`topic_id`),
  UNIQUE KEY `uk_topic_title` (`topic_title`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='话题表';

-- 话题标签表
CREATE TABLE `bbs_topic_tag` (
  `id` bigint(20) NOT NULL COMMENT '话题标签id',
  `tag_id` bigint(20) NOT NULL COMMENT '标签id',
  `topic_id` bigint(20) NOT NULL COMMENT '话题id',
  PRIMARY KEY (`id`),
  KEY `idx_tag_id` (`tag_id`),
  KEY `idx_topic_id` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='话题标签表';

-- 标签表
CREATE TABLE `bbs_tag` (
  `tag_id` bigint(20) NOT NULL  COMMENT '标签id',
  `tag_name` varchar(255) NOT NULL DEFAULT '' COMMENT '标签名',
  `tag_desc` varchar(1000) DEFAULT '' COMMENT '标签描述',
  `icon_url` varchar(255) NOT NULL DEFAULT '' COMMENT '标签图标',
  `topic_count` int(11) NOT NULL DEFAULT '0' COMMENT '主题数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `uk_name` (`tag_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='标签表';

-- 评论表
CREATE TABLE `bbs_comment` (
  `comment_id` bigint(20) NOT NULL  COMMENT '评论id',
  `comment_pid` bigint(20) DEFAULT NULL COMMENT '评论_id',
  `topic_id` bigint(20) NOT NULL COMMENT '主题id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `content` longtext NOT NULL COMMENT '评论内容',
  `like_ids` text COMMENT '点赞人id,逗号分隔',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`comment_id`),
  KEY `idx_comment_pid` (`comment_pid`),
  KEY `idx_topic_id` (`topic_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='评论表';
