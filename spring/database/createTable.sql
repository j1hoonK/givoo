CREATE TABLE `users`
(
 `user_id`      int NOT NULL AUTO_INCREMENT COMMENT '사용자 번호' ,
 `user_name`    varchar(45) NOT NULL COMMENT '사용자 이름' ,
 `user_email`   varchar(45) NOT NULL COMMENT '사용자 email' ,
 `user_tell`    bigint NOT NULL COMMENT '사용자 연락처' ,
 `user_address` varchar(45) NOT NULL COMMENT '사용자 주소' ,
 `user_nname`   varchar(45) NULL COMMENT '사용자 닉네임' ,

PRIMARY KEY (`user_id`)
);

CREATE TABLE `organization`
(
 `org_id`        int NOT NULL AUTO_INCREMENT COMMENT '기관번호' ,
 `org_number`    varchar(45) NOT NULL ,
 `org_name`      varchar(45) NOT NULL COMMENT '기관명' ,
 `org_adress`    varchar(45) NOT NULL COMMENT '기관 주소' ,
 `location_lat`  double NOT NULL COMMENT '기관위치_위도' ,
 `location_long` double NOT NULL COMMENT '기관위치_경도' ,
 `org_tell`      bigint NOT NULL COMMENT '기관 연락처' ,
 `org_type`      varchar(45) NOT NULL COMMENT '기관 분류' ,
 `org_info`      varchar(450) NOT NULL COMMENT '기관정보(소개)' ,
 `org_owner`     varchar(45) NOT NULL COMMENT '대표자' ,
 `started_up`    date NOT NULL COMMENT '설립일' ,

PRIMARY KEY (`org_id`)
);

CREATE TABLE `oraganization_notice`
(
 `notice_id`   int NOT NULL ,
 `subject`     varchar(100) NOT NULL ,
 `org_id`      int NOT NULL COMMENT '기관번호' ,
 `contents`    varchar(450) NOT NULL ,
 `notice_date` timestamp NOT NULL ,

PRIMARY KEY (`notice_id`),
KEY `FK_1` (`org_id`),
CONSTRAINT `FK_11` FOREIGN KEY `FK_1` (`org_id`) REFERENCES `organization` (`org_id`)
);

CREATE TABLE `fundraising`
(
 `fndr_id`       int NOT NULL AUTO_INCREMENT COMMENT '모금번호' ,
 `fndr_info`     varchar(450) NOT NULL COMMENT '모금정보' ,
 `goal`          int NOT NULL COMMENT '모금 목표액' ,
 `current`       int NOT NULL DEFAULT 0 COMMENT '현재 모금액' ,
 `fndr_deadline` date NOT NULL COMMENT '모금 기한' ,
 `org_id`        int NOT NULL ,

PRIMARY KEY (`fndr_id`),
KEY `FK_1` (`org_id`),
CONSTRAINT `FK_5` FOREIGN KEY `FK_1` (`org_id`) REFERENCES `organization` (`org_id`)
);

CREATE TABLE `fundraising_join_list`
(
 `fndr_join_id` int NOT NULL AUTO_INCREMENT ,
 `fndr_id`      int NOT NULL COMMENT '모금번호' ,
 `user_id`      int NOT NULL COMMENT '사용자 번호' ,

PRIMARY KEY (`fndr_join_id`),
KEY `FK_1` (`fndr_id`),
CONSTRAINT `FK_8` FOREIGN KEY `FK_1` (`fndr_id`) REFERENCES `fundraising` (`fndr_id`),
KEY `FK_2` (`user_id`),
CONSTRAINT `FK_9` FOREIGN KEY `FK_2` (`user_id`) REFERENCES `users` (`user_id`)
);

CREATE TABLE `fundraising_interest`
(
 `fndr_intr_id` int NOT NULL AUTO_INCREMENT ,
 `fndr_id`      int NOT NULL COMMENT '모금번호' ,
 `user_id`      int NOT NULL COMMENT '사용자 번호' ,

PRIMARY KEY (`fndr_intr_id`),
KEY `FK_1` (`fndr_id`),
CONSTRAINT `FK_8_1` FOREIGN KEY `FK_1` (`fndr_id`) REFERENCES `fundraising` (`fndr_id`),
KEY `FK_2` (`user_id`),
CONSTRAINT `FK_9_1` FOREIGN KEY `FK_2` (`user_id`) REFERENCES `users` (`user_id`)
);

CREATE TABLE `favorites`
(
 `fav_id`  int NOT NULL AUTO_INCREMENT COMMENT '즐겨찾기 번호' ,
 `org_id`  int NOT NULL ,
 `user_id` int NOT NULL ,

PRIMARY KEY (`fav_id`),
KEY `FK_1` (`user_id`),
CONSTRAINT `FK_1` FOREIGN KEY `FK_1` (`user_id`) REFERENCES `users` (`user_id`),
KEY `FK_2` (`org_id`),
CONSTRAINT `FK_2` FOREIGN KEY `FK_2` (`org_id`) REFERENCES `organization` (`org_id`)
);

CREATE TABLE `donation_regular`
(
 `dnt_regular_id`     int NOT NULL ,
 `user_id`            int NOT NULL COMMENT '사용자 번호' ,
 `org_id`             int NOT NULL COMMENT '기관번호' ,
 `isusenow`           varchar(45) NOT NULL COMMENT '이용중 여부(Y or N)' ,
 `started`            date NOT NULL COMMENT '이용 시작일' ,
 `payment_date`       int NOT NULL COMMENT '정기결제일' ,
 `amount_dnt_regular` int NULL COMMENT '금액' ,

PRIMARY KEY (`dnt_regular_id`),
KEY `FK_1` (`user_id`),
CONSTRAINT `FK_12` FOREIGN KEY `FK_1` (`user_id`) REFERENCES `users` (`user_id`),
KEY `FK_2` (`org_id`),
CONSTRAINT `FK_12_1` FOREIGN KEY `FK_2` (`org_id`) REFERENCES `organization` (`org_id`)
);

CREATE TABLE `donation`
(
 `dnt_id`                 int NOT NULL AUTO_INCREMENT COMMENT '기부 번호' ,
 `amount_dnt`             int NOT NULL COMMENT '기부액' ,
 `dnt_date`               timestamp NOT NULL COMMENT '기부일' ,
 `dnt_type`               varchar(45) NOT NULL COMMENT '기부종류' ,
 `receipt_result`         varchar(45) NOT NULL COMMENT '기부금영수증 발급결과' ,
 `org_id`                 int NOT NULL ,
 `user_id`                int NOT NULL ,
 `payment_type`           varchar(45) NOT NULL COMMENT '지불수단' ,
 `comment_dnt`            varchar(100) NULL COMMENT '기부 메세지' ,
 `is_regulation`          varchar(45) NOT NULL DEFAULT False COMMENT '정기결제 여부' ,
 `comment_dnt_regulation` varchar(100) NULL ,

PRIMARY KEY (`dnt_id`),
KEY `FK_1` (`user_id`),
CONSTRAINT `FK_3` FOREIGN KEY `FK_1` (`user_id`) REFERENCES `users` (`user_id`),
KEY `FK_2` (`org_id`),
CONSTRAINT `FK_4` FOREIGN KEY `FK_2` (`org_id`) REFERENCES `organization` (`org_id`)
);