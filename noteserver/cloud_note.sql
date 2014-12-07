/*
Navicat MySQL Data Transfer

Source Server         : 52
Source Server Version : 50158
Source Host           : 192.168.0.52:3306
Source Database       : cloud_note

Target Server Type    : MYSQL
Target Server Version : 50158
File Encoding         : 65001

Date: 2014-09-02 16:52:07
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `cn_activity`
-- ----------------------------
DROP TABLE IF EXISTS `cn_activity`;
CREATE TABLE `cn_activity` (
  `cn_activity_id` varchar(100) NOT NULL COMMENT '活动ID',
  `cn_activity_title` varchar(500) DEFAULT NULL COMMENT '活动标题',
  `cn_activity_body` text COMMENT '活动介绍(html片段)',
  `cn_activity_end_time` bigint(20) DEFAULT NULL COMMENT '活动结束时间',
  PRIMARY KEY (`cn_activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cn_activity
-- ----------------------------
INSERT INTO `cn_activity` VALUES ('1', '大数据技术大数据技术大数据技术大数据技术大数据技术大数据技术大数据技术大数据技术', 'rrrrrr', null);
INSERT INTO `cn_activity` VALUES ('2', 'java技术征文', 'java技术征文', '123213123123');
INSERT INTO `cn_activity` VALUES ('3', 'C#技术征文', 'C#啊C#，征文啊征文C#啊C#，征文啊征文C#啊C#，征文啊征文C#啊C#，征文啊征文C#啊C#，征文啊征文C#啊C#，征文啊征文', '12312312313123');
INSERT INTO `cn_activity` VALUES ('4', 'C++技术征文', 'C++', '1231231231321');
INSERT INTO `cn_activity` VALUES ('5', 'javascript', '前端技术', '123123123123');
INSERT INTO `cn_activity` VALUES ('6', 'dqwedqwdqwdqwedqw', 'qwdqwdeqqqqqqqqqqqqqqqq', null);
INSERT INTO `cn_activity` VALUES ('7', 'qweqew', 'qwe', null);
INSERT INTO `cn_activity` VALUES ('8', 'eeeeeeeee', 'eeeeeeeeeeeeeeeeeeeee', null);
INSERT INTO `cn_activity` VALUES ('9', 'wwwwwwwwwwww', 'wwwwwwwwwwwwwww', null);

-- ----------------------------
-- Table structure for `cn_activity_status`
-- ----------------------------
DROP TABLE IF EXISTS `cn_activity_status`;
CREATE TABLE `cn_activity_status` (
  `cn_activity_status_id` varchar(100) NOT NULL COMMENT '活动状态ID',
  `cn_activity_id` varchar(100) DEFAULT NULL COMMENT '活动ID',
  `cn_activity_status_code` varchar(500) DEFAULT NULL COMMENT '活动状态Code',
  `cn_activity_status_name` varchar(500) DEFAULT NULL COMMENT '活动状态名称',
  PRIMARY KEY (`cn_activity_status_id`),
  KEY `FK_Reference_9` (`cn_activity_id`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`cn_activity_id`) REFERENCES `cn_activity` (`cn_activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cn_activity_status
-- ----------------------------
INSERT INTO `cn_activity_status` VALUES ('1', '1', 'normal', 'normal');

-- ----------------------------
-- Table structure for `cn_note`
-- ----------------------------
DROP TABLE IF EXISTS `cn_note`;
CREATE TABLE `cn_note` (
  `cn_note_id` varchar(100) NOT NULL COMMENT '笔记ID',
  `cn_notebook_id` varchar(100) DEFAULT NULL COMMENT '笔记本ID',
  `cn_user_id` varchar(100) DEFAULT NULL COMMENT '用户ID',
  `cn_note_status_id` varchar(100) DEFAULT NULL COMMENT '笔记状态ID:备用',
  `cn_note_type_id` varchar(100) DEFAULT NULL COMMENT '笔记本类型ID：备用',
  `cn_note_title` varchar(500) DEFAULT NULL COMMENT '笔记标题',
  `cn_note_body` text COMMENT '笔记内容',
  `cn_note_create_time` bigint(20) DEFAULT NULL COMMENT '笔记创建时间',
  `cn_note_last_modify_time` bigint(20) DEFAULT NULL COMMENT '笔记最近修改时间',
  PRIMARY KEY (`cn_note_id`),
  KEY `FK_Reference_2` (`cn_notebook_id`),
  KEY `FK_Reference_3` (`cn_user_id`),
  KEY `FK_Reference_7` (`cn_note_status_id`),
  KEY `FK_Reference_8` (`cn_note_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cn_note
-- ----------------------------
INSERT INTO `cn_note` VALUES ('003ec2a1-f975-4322-8e4d-dfd206d6ac0c', '516f6f4f-eaa3-4c76-84ff-530b92c7f64d', null, null, null, 'title1...', '笔记笔记。。。', '1403252773281', '1403252773281');
INSERT INTO `cn_note` VALUES ('019cd9e1-b629-4d8d-afd7-2aa9e2d6afe0', '4b86d1f9-6345-4532-bc50-ee86442f004b', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '默认1', '', '1402538216250', '1402538216250');
INSERT INTO `cn_note` VALUES ('01da5d69-89d5-4140-9585-b559a97f9cb0', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '大方地爱上撒旦发斯蒂芬', '', '1402562696503', '1402562696503');
INSERT INTO `cn_note` VALUES ('046b0110-67f9-48c3-bef3-b0b23bda9d4e', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '啊啊啊啊', '<p>灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌</p><p>灌灌灌灌灌灌灌过嘎嘎嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎嘎嘎嘎嘎个灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌</p><p>阿萨德飞洒地方撒的发生大撒地方盛大撒旦阿斯蒂芬撒的发生大阿斯蒂芬阿萨德阿斯蒂芬阿萨德阿斯蒂芬阿斯蒂芬撒地方阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬<br/></p>', '1402649092885', '1402649092885');
INSERT INTO `cn_note` VALUES ('051538a6-0f8e-472c-8765-251a795bc88f', '0037215c-09fe-4eaa-aeb5-25a340c6b39b', '52f9b276-38ee-447f-a3aa-0d54e7a736e4', null, null, 'wsf1', '<p>wsf<br/></p>', '0', '1403071652506');
INSERT INTO `cn_note` VALUES ('054449b4-93d4-4f97-91cb-e0043fc4497f', '20b4cbec-bd55-4c21-9c41-3a11ada2b803', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '笔记1——132', '<p>阿斯顿辅导费的阿萨德东方</p><p>爱的色放飞速达阿萨德</p><p>阿萨德撒地方 撒旦法撒旦按时发达发放倒萨士大夫</p><p>阿萨德法撒旦阿斯蒂芬123123<br/></p>', '1402969784628', '1402969784628');
INSERT INTO `cn_note` VALUES ('066af16d-183b-41ff-8a7c-8a8bd6bfccb4', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '19', '', '1402919272546', '1402919272546');
INSERT INTO `cn_note` VALUES ('07305c91-d9fa-420d-af09-c3ff209608ff', 'd92e6b86-e48a-485d-8f11-04a93818bb42', '48595f52-b22c-4485-9244-f4004255b972', null, null, '1——4', '<p>测试</p><p>1——4</p><p>1——4</p><p>1——4</p><p>1——4</p><p>1——4</p><p>1——4<br/></p>', '0', '1402899128531');
INSERT INTO `cn_note` VALUES ('09f60aeb-a573-4fcf-b39f-903e1536e762', '20b4cbec-bd55-4c21-9c41-3a11ada2b803', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '安装笔记', '<p>首先配置环境~<br/></p>', '1403071043166', '1403071043166');
INSERT INTO `cn_note` VALUES ('0a233251-8991-493c-87c8-d36e9433eae3', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '19', '', '1402637116884', '1402637116884');
INSERT INTO `cn_note` VALUES ('0a652205-c8af-41e0-986a-80d0cdecc996', '64639e62-9241-4efb-874b-01e97257cb6e', '333c6d0b-e4a2-4596-9902-a5d98c2f665a', null, null, 'tttt1_11', '', '1402883300967', '1402883300967');
INSERT INTO `cn_note` VALUES ('0c8b7f7e-0336-4220-9774-fd97d2cd0c40', 'd0b0727f-a233-4a1f-8600-f49fc1f25bc9', '48595f52-b22c-4485-9244-f4004255b972', null, null, '1——5', '<p>1——5</p><p>1——5</p><p>1——5</p><p>1——5</p><p>1——5</p><p>1——5</p><p><br/></p>', '1402968794996', '1402968794996');
INSERT INTO `cn_note` VALUES ('0ed5aed5-baf0-4f00-9dbf-8da105b16bb2', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '1——4', '<p>测试</p><p>1——4</p><p>1——4</p><p>1——4</p><p>1——4</p><p>1——4</p><p>1——4<br/></p>', '1402919263680', '1402919263680');
INSERT INTO `cn_note` VALUES ('1153295f-d1a5-4a39-b794-980633bdc3d8', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '25', '', '1402637132393', '1402637132393');
INSERT INTO `cn_note` VALUES ('11a06d13-3285-46a9-bbd5-44cf932fee28', '1d46f5db-f569-4c05-bdba-75106108fcba', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '13', '', '1402916621416', '1402916621416');
INSERT INTO `cn_note` VALUES ('13e57ce4-f302-498d-a0b2-df9697dc6941', 'd0b0727f-a233-4a1f-8600-f49fc1f25bc9', '48595f52-b22c-4485-9244-f4004255b972', null, null, '1——5', '<p>1——5</p><p>1——5</p><p>1——5</p><p>1——5</p><p>1——5</p><p>1——5</p><p><br/></p>', '1402968940222', '1402968940222');
INSERT INTO `cn_note` VALUES ('148800c2-885d-41be-bd9a-581763138074', '1db556b9-d1dc-4ed9-8274-45cf0afbe859', '48595f52-b22c-4485-9244-f4004255b972', null, null, '测试参加活动——乱七八糟', '', '1402998302623', '1402998302623');
INSERT INTO `cn_note` VALUES ('163e1c76-0461-4122-930f-47f36fdf0ebe', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, 'Demo2', '', '1404865129059', '1404865129059');
INSERT INTO `cn_note` VALUES ('16742fb6-d579-4d85-94db-176abab634a3', '1d46f5db-f569-4c05-bdba-75106108fcba', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '13', '', '1402918283097', '1402918283097');
INSERT INTO `cn_note` VALUES ('16edebdb-861b-47e2-a34a-657fe3bcab62', 'd0b0727f-a233-4a1f-8600-f49fc1f25bc9', '48595f52-b22c-4485-9244-f4004255b972', null, null, '测试收藏活动笔记——1', '<p>测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1</p>', '1402999371188', '1402999371188');
INSERT INTO `cn_note` VALUES ('17f280ec-6843-45e6-9d72-db5ae207cc4b', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '5', '', '1402919759537', '1402919759537');
INSERT INTO `cn_note` VALUES ('183ddc33-f00c-4275-bc8b-c35bd6a65369', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '1——4', '<p>测试</p><p>1——4</p><p>1——4</p><p>1——4</p><p>1——4</p><p>1——4</p><p>1——4<br/></p>', '1402919277712', '1402919277712');
INSERT INTO `cn_note` VALUES ('19fbb55b-0541-433b-a7cd-dba52220a447', '- è¯·éæ© -', '48595f52-b22c-4485-9244-f4004255b972', null, null, '1——3', '<p>1——3</p><p>1——3</p><p>1——3</p><p>1——3</p><p>1——3</p><p>1——3</p><p>1——3</p><p>1——3</p><p>1——3</p><p>1——3</p><p>1——3</p><p>1——3</p><p><br/></p>', '0', '1402899871755');
INSERT INTO `cn_note` VALUES ('1c138a71-bdee-4371-b082-f16a04e67c85', '1d46f5db-f569-4c05-bdba-75106108fcba', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '13', '', '1402918325867', '1402918325867');
INSERT INTO `cn_note` VALUES ('1db4a1d8-76cc-46bb-9e30-9e67f0932530', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '32', '', '1402637151788', '1402637151788');
INSERT INTO `cn_note` VALUES ('1e4d404d-4724-4092-a194-465a5ef71b27', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '1——4', '<p>测试</p><p>1——4</p><p>1——4</p><p>1——4</p><p>1——4</p><p>1——4</p><p>1——4<br/></p>', '1402919272470', '1402919272470');
INSERT INTO `cn_note` VALUES ('1ec185d6-554a-481b-b322-b562485bb8e8', 'e46239d6-4f54-426c-a448-f7a0d45f9425', 'ea09d9b1-ede7-4bd8-b43d-a546680df00b', null, null, '笔记1——1', '', '1402539212256', '1402539212256');
INSERT INTO `cn_note` VALUES ('2013b419-4439-4109-b4db-c2cc1b58a1b9', '516f6f4f-eaa3-4c76-84ff-530b92c7f64d', null, null, null, 'title1...', '笔记笔记。。。', '1403252700835', '1403252700835');
INSERT INTO `cn_note` VALUES ('20d13284-37f6-41d3-a3ce-005cbf36b5fd', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '1——1', '<p>1——11——11——11——11——11——11——11——11——11——11——11——11——1</p>', '1402914461289', '1402914461289');
INSERT INTO `cn_note` VALUES ('22222222222222222222222222222222222', '8888888888888888888888888888888888', '524f7440-7283-4b2d-8af5-4a67570e892e', null, null, '收藏测试一', '呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜', null, null);
INSERT INTO `cn_note` VALUES ('2228527e-1cad-4318-94ee-3749a4dc25ce', '0cd94778-4d52-486d-a35d-263b3cfe6de9', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, 'ssss', '<p>asdfasdfasdf<br/></p>', '0', '1402914260159');
INSERT INTO `cn_note` VALUES ('23b5d235-efc0-493e-9b34-e791adeeadb4', 'd0b0727f-a233-4a1f-8600-f49fc1f25bc9', '48595f52-b22c-4485-9244-f4004255b972', null, null, '22', '', '1402888790355', '1402888790355');
INSERT INTO `cn_note` VALUES ('24097647-fdb5-4617-ba74-2e1d567fa938', 'd0b0727f-a233-4a1f-8600-f49fc1f25bc9', '48595f52-b22c-4485-9244-f4004255b972', null, null, '我勒个去', '我勒个去~~~~~', '1402999239423', '1402999239423');
INSERT INTO `cn_note` VALUES ('2578720c-4132-45a7-8c2e-07ba6803caeb', '1db556b9-d1dc-4ed9-8274-45cf0afbe859', '48595f52-b22c-4485-9244-f4004255b972', null, null, '测试参加活动——乱七八糟', '', '1402997732177', '1402997732177');
INSERT INTO `cn_note` VALUES ('2799f531-8daa-480b-b2b8-52f21e711304', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, 'New笔记', '', '1412414453656', '1412414453656');
INSERT INTO `cn_note` VALUES ('2b0aa581-13fb-4e2c-afd7-d5fc476320f4', 'd0b0727f-a233-4a1f-8600-f49fc1f25bc9', '48595f52-b22c-4485-9244-f4004255b972', null, null, '笔记2——1', '<p>笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1</p><p>笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1</p>', '1402914977272', '1402914977272');
INSERT INTO `cn_note` VALUES ('2bb18224-34b1-4b3e-9cfa-c72dbfd55e26', 'd0b0727f-a233-4a1f-8600-f49fc1f25bc9', '48595f52-b22c-4485-9244-f4004255b972', null, null, '1——1', '<p>1——11——11——11——11——11——11——11——11——11——11——11——11——1</p>', '1402914980384', '1402914980384');
INSERT INTO `cn_note` VALUES ('2bf546b5-b2b7-474a-9dfd-6996d3091914', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '16', '', '1402919277912', '1402919277912');
INSERT INTO `cn_note` VALUES ('2d7db056-52a9-44b3-8ffa-575625a00a6a', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '25', '', '1402919607427', '1402919607427');
INSERT INTO `cn_note` VALUES ('2deb2a36-5c39-44e0-9b94-03d869910c87', '1d46f5db-f569-4c05-bdba-75106108fcba', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '13', '', '1402917137032', '1402917137032');
INSERT INTO `cn_note` VALUES ('2f85e280-60c6-41a8-a1c3-e27df98dc7fd', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '阿萨德', '<p>切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切去切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切去切切切切切切切切切切去去去去去去起起切切切切切切切切切切切切切切切切切切切切切起起切切切切切切切切切切切切切切切切切切切切切切切切切切切切切去前切切切切切切切切切切切切切切切切切切切切切切切切切去起起切切切切切切切切切切切切切切切切切切切切切去去&nbsp;&nbsp;&nbsp;&nbsp; 切切切切切切切切切切切切切切切切切切切哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇<br/></p>', '0', '1402562171722');
INSERT INTO `cn_note` VALUES ('3139eeac-1498-42b0-8f57-c7c48a6e3cce', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '19', '', '1402919606934', '1402919606934');
INSERT INTO `cn_note` VALUES ('3238f91d-3be7-41d6-acd3-62d0b905203f', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '9', '', '1402637089651', '1402637089651');
INSERT INTO `cn_note` VALUES ('326f17e8-ff04-4a79-b33b-ae4bb3bb5f1b', '59b354f8-47ae-437d-a432-7d28736bd894', '48595f52-b22c-4485-9244-f4004255b972', null, null, '测试收藏活动笔记——1', '<p>测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1</p>', '0', '1403232246545');
INSERT INTO `cn_note` VALUES ('334d6521-bebf-4f1a-8239-2128a4e828cc', '8be77c36-3cd5-4727-a8a9-071316a2eb11', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '撒地方', '', '1402650671487', '1402650671487');
INSERT INTO `cn_note` VALUES ('344bcbb8-f768-4696-9de3-e1a96f7e8f94', '2a4ca5bb-3073-4194-9d4e-5db0ec5c0998', '48595f52-b22c-4485-9244-f4004255b972', null, null, '1——2', '<p>1——21——21——21——21——21——21——21——21——21——21——21——2</p>', '0', '1402888303297');
INSERT INTO `cn_note` VALUES ('34c8d6db-ecca-4922-9b61-929128fbc4bf', 'd0b0727f-a233-4a1f-8600-f49fc1f25bc9', '48595f52-b22c-4485-9244-f4004255b972', null, null, '测试参加活动——11111111111', '', '1402968946017', '1402968946017');
INSERT INTO `cn_note` VALUES ('3621cb2a-a40d-496f-8505-48725462f68d', '516f6f4f-eaa3-4c76-84ff-530b92c7f64d', null, null, null, 'title1...', '笔记笔记。。。', '1403253179476', '1403253179476');
INSERT INTO `cn_note` VALUES ('3651f802-aac2-4337-b700-68857c2cb04c', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '21', '', '1402637122195', '1402637122195');
INSERT INTO `cn_note` VALUES ('3ac187a9-6499-4ce9-b104-4448f64667c8', 'd0b0727f-a233-4a1f-8600-f49fc1f25bc9', '48595f52-b22c-4485-9244-f4004255b972', null, null, '16', '', '1402968801261', '1402968801261');
INSERT INTO `cn_note` VALUES ('3c6f1cd5-8799-4533-bbdf-bbf48771e95e', '4b86d1f9-6345-4532-bc50-ee86442f004b', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '笔记4', '', '1402538197794', '1402538197794');
INSERT INTO `cn_note` VALUES ('3dd942ec-9fff-4f64-b25b-b4c93125248d', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '13', '', '1402918891706', '1402918891706');
INSERT INTO `cn_note` VALUES ('3f50370a-8cc1-4acb-80e8-6e52c8d1061b', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '13', '', '1402918834283', '1402918834283');
INSERT INTO `cn_note` VALUES ('3f61785d-c808-4cf9-9009-d2f88e5bbe2f', '2a4ca5bb-3073-4194-9d4e-5db0ec5c0998', '48595f52-b22c-4485-9244-f4004255b972', null, null, '1——1', '<p>1——11——11——11——11——11——11——11——11——11——11——11——11——1</p>', '1402890985221', '1402890985221');
INSERT INTO `cn_note` VALUES ('3febebb3-a1b7-45ac-83ba-50cdb41e5fc1', 'fa8d3d9d-2de5-4cfe-845f-951041bcc461', '524f7440-7283-4b2d-8af5-4a67570e892e', null, null, '我了个草~', '<p>我了个草~我了个草~我了个草~我了个草~我了个草~我了个草~我了个草~我了个草~我了个草~我了个草~我了个草~我了个草~我了个草~我了个草~</p>', '0', '1402649660490');
INSERT INTO `cn_note` VALUES ('41712949-4a1a-4e24-944a-9b8ed1001238', '- é»è®¤ç¬è®°æ¬ -', '524f7440-7283-4b2d-8af5-4a67570e892e', null, null, '323333', '', '1402654640182', '1402654640182');
INSERT INTO `cn_note` VALUES ('42a84ff7-198e-4c73-abdc-95f0fdc718f8', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '1', '<p>11111<br/></p>', '0', '1402637069017');
INSERT INTO `cn_note` VALUES ('43da4a7b-0f3f-4f3b-97c4-cc522b585375', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '26', '', '1402637134622', '1402637134622');
INSERT INTO `cn_note` VALUES ('446fb256-611e-4c1e-884a-32f62896139a', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '13111', '<p>aaaa<br/></p>', '0', '1402648172055');
INSERT INTO `cn_note` VALUES ('44a2478d-41c4-4fd8-a5f5-711e712a7b45', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '测试参加活动——11111111111', '', '1402919214128', '1402919214128');
INSERT INTO `cn_note` VALUES ('48338ef9-eaef-4103-abc6-cf6fc2eb4f69', '20b4cbec-bd55-4c21-9c41-3a11ada2b803', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '测试参加活动——11111111111', '', '1402998283023', '1402998283023');
INSERT INTO `cn_note` VALUES ('4949cfde-1766-4d9b-a933-4f1c8365b75b', '8be77c36-3cd5-4727-a8a9-071316a2eb11', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '对对对对对对对11', '', '1402913141589', '1402913141589');
INSERT INTO `cn_note` VALUES ('4a5d4712-7294-4767-b193-1ebc1025a613', '1d46f5db-f569-4c05-bdba-75106108fcba', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '1——1', '<p>1——11——11——11——11——11——11——11——11——11——11——11——11——1</p>', '1402914487711', '1402914487711');
INSERT INTO `cn_note` VALUES ('4b120bb5-2828-436c-b116-317c466d92a7', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '5', '', '1402919718835', '1402919718835');
INSERT INTO `cn_note` VALUES ('4e26ba27-7d01-4dd0-8ca5-cd679beaffb5', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '5', '', '1402637080618', '1402637080618');
INSERT INTO `cn_note` VALUES ('52f05a14-b88d-4a70-8166-991d9b663854', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '20', '', '1402637119802', '1402637119802');
INSERT INTO `cn_note` VALUES ('53d1b3ed-59a1-4715-a7b2-9027b0d551e0', '0cd94778-4d52-486d-a35d-263b3cfe6de9', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '周佳note', '<p>阿斯顿撒旦法撒旦撒旦撒地方</p><p>阿斯蒂芬阿斯蒂芬as阿斯蒂芬</p><p>sadf爱上</p><p>士大夫</p><p>sadf asd飞as的fsd飞as东方</p><p>阿斯蒂芬</p><p>阿斯蒂芬<br/></p>', '0', '1402902425283');
INSERT INTO `cn_note` VALUES ('5526071b-8e3d-4dbf-ad43-b70e23fedafb', 'd0b0727f-a233-4a1f-8600-f49fc1f25bc9', '48595f52-b22c-4485-9244-f4004255b972', null, null, '笔记2——1', '<p>笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1</p><p>笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1</p>', '1402968789899', '1402968789899');
INSERT INTO `cn_note` VALUES ('5565bda4-ddee-4f87-844e-2ba83aa4925f', 'd92e6b86-e48a-485d-8f11-04a93818bb42', '48595f52-b22c-4485-9244-f4004255b972', null, null, '1——5', '<p>1——5</p><p>1——5</p><p>1——5</p><p>1——5</p><p>1——5</p><p>1——5</p><p><br/></p>', '0', '1402888400626');
INSERT INTO `cn_note` VALUES ('5627a403-7ae8-4863-8c9e-66618e9489a0', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '13', '', '1402917084511', '1402917084511');
INSERT INTO `cn_note` VALUES ('578f3584-92e6-4632-97e4-ad95426e6902', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '士大夫撒', '<p>阿斯顿发送到<br/></p>', '0', '1402650660588');
INSERT INTO `cn_note` VALUES ('579b3691-5dbe-4f00-ac14-211dff88edfc', '20b4cbec-bd55-4c21-9c41-3a11ada2b803', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '测试参加活动——乱七八糟', '', '1402998352993', '1402998352993');
INSERT INTO `cn_note` VALUES ('584043b2-5156-44b0-bf7c-5943abd83f5d', '009380f9-f663-4cdf-817e-5ef0257dc220', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '笔记1_1111', '<p>asdfasdfasdf<br/></p>', '0', '1402538676138');
INSERT INTO `cn_note` VALUES ('595ea429-9487-4601-9ce2-e0c0383773ed', 'd0b0727f-a233-4a1f-8600-f49fc1f25bc9', '48595f52-b22c-4485-9244-f4004255b972', null, null, '13', '', '1402890408368', '1402890408368');
INSERT INTO `cn_note` VALUES ('5a20819a-6b55-4479-81e7-f3913c26671a', 'c8d81ee5-f8cd-49e8-b2e6-ab174a926d95', '48595f52-b22c-4485-9244-f4004255b972', null, null, '2222222222222222', '', '1403486900967', '1403486900967');
INSERT INTO `cn_note` VALUES ('5c59bc2d-6e7d-4ad9-b0e1-1a871ee8694d', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '31', '', '1402637149407', '1402637149407');
INSERT INTO `cn_note` VALUES ('5d1a0678-57f7-4bbd-ac4a-323505da94b2', 'af8be968-66bb-4b75-ac5d-d7deb772640f', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, 'abc', '', '1403079755071', '1403079755071');
INSERT INTO `cn_note` VALUES ('5d9587d3-b15a-486a-970d-9964c5b2410e', '0b11444a-a6d6-45ff-8d46-282afaa6a655', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, 'aaaa', '<p>个梵蒂冈凤飞飞大方地<br/></p>', '0', '1402904597637');
INSERT INTO `cn_note` VALUES ('5efc0d6a-1fe3-45d5-863f-618d403a6d7f', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '7', '', '1402637084679', '1402637084679');
INSERT INTO `cn_note` VALUES ('60480071-f989-4945-9b1c-0d2aba07ae96', '- é»è®¤ç¬è®°æ¬ -', '524f7440-7283-4b2d-8af5-4a67570e892e', null, null, '测试参加活动——乱七八糟', '<p>测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试</p>', '0', '1402886904219');
INSERT INTO `cn_note` VALUES ('61c6755f-a078-4329-a2b4-5a97eeefd96b', 'd0b0727f-a233-4a1f-8600-f49fc1f25bc9', '48595f52-b22c-4485-9244-f4004255b972', null, null, '19', '', '1402968942982', '1402968942982');
INSERT INTO `cn_note` VALUES ('65731b69-409c-47b9-866b-b283840b2723', '8be77c36-3cd5-4727-a8a9-071316a2eb11', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '阿迪发生的', '', '1402650114086', '1402650114086');
INSERT INTO `cn_note` VALUES ('668354a9-c7b4-46a0-9a6d-b138cdefc941', '0cd94778-4d52-486d-a35d-263b3cfe6de9', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, 'aaaa', '<p>啊啊啊啊啊啊啊啊啊啊啊啊</p><p>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p><p><br/></p><p><br/></p><p>啊&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p><p>啊&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p><p>啊&nbsp; 啊啊安装啊擦杀手锏几十封水电费哈数据库电话费阿迪少喝咖啡哈苏丹红将SD卡后方可发生东方航空阿飞啊剑神发哈卡斯加和东方加水电费哈斯卡东方红卡萨京东方看见司法局分开奖号覅王全覆盖撒地方将和的发射到发神经货到付款级啊双飞刀暗红色的罚款京哈卡加少废话卡加水电费卡拉斯电话费卡加水电费就啊哈撒地方库哈斯电话费卡萨丁后发生剪短发了卡萨京东方缴费【if圣诞节罚款加阿斯顿发货阿斯顿减肥撒旦了咖啡机收到啊剑神咖啡哈桑就款到发货爱上积分卡水井坊路口减肥拉斯克奖分拉斯克奖法拉克水煎服啊拉斯克奖地方阿拉山口缴费乐俊凯减肥拉斯克奖发了卡萨京东方看京东方<br/></p>', '0', '1402652119099');
INSERT INTO `cn_note` VALUES ('66e0670f-41d2-4ad4-a5b7-f6da247627df', '1d46f5db-f569-4c05-bdba-75106108fcba', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '5', '', '1402921262893', '1402921262893');
INSERT INTO `cn_note` VALUES ('687e77a3-64e3-44ad-875b-83517a158196', 'd0e7ce0d-4893-4705-a51a-9a73d259bc70', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '撒地方', '<p>撒旦法撒旦<br/></p>', '0', '1402650636320');
INSERT INTO `cn_note` VALUES ('6925aa4d-c9a8-4cbc-ae53-cb44067ae901', '20b4cbec-bd55-4c21-9c41-3a11ada2b803', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, 'aaaa', '<p>啊啊啊啊啊啊啊啊啊啊啊啊</p><p>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p><p><br/></p><p><br/></p><p>啊&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p><p>啊&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p><p>啊&nbsp; 啊啊安装啊擦杀手锏几十封水电费哈数据库电话费阿迪少喝咖啡哈苏丹红将SD卡后方可发生东方航空阿飞啊剑神发哈卡斯加和东方加水电费哈斯卡东方红卡萨京东方看见司法局分开奖号覅王全覆盖撒地方将和的发射到发神经货到付款级啊双飞刀暗红色的罚款京哈卡加少废话卡加水电费卡拉斯电话费卡加水电费就啊哈撒地方库哈斯电话费卡萨丁后发生剪短发了卡萨京东方缴费【if圣诞节罚款加阿斯顿发货阿斯顿减肥撒旦了咖啡机收到啊剑神咖啡哈桑就款到发货爱上积分卡水井坊路口减肥拉斯克奖分拉斯克奖法拉克水煎服啊拉斯克奖地方阿拉山口缴费乐俊凯减肥拉斯克奖发了卡萨京东方看京东方<br/></p>', '1402652149678', '1402652149678');
INSERT INTO `cn_note` VALUES ('69ccf926-2b95-487c-8aa4-9c65bd094a75', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '18', '', '1402637113712', '1402637113712');
INSERT INTO `cn_note` VALUES ('6c83119d-96c6-4d81-9e6d-75419eb9e923', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '5', '', '1402919759191', '1402919759191');
INSERT INTO `cn_note` VALUES ('6cba1d11-6690-429d-8afa-9f6e8ab522c4', '1d46f5db-f569-4c05-bdba-75106108fcba', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '我勒个去', '我勒个去~~~~~', '1403080052790', '1403080052790');
INSERT INTO `cn_note` VALUES ('6cc250ae-f167-4a6d-92a7-c00d7d1e96f8', '1db556b9-d1dc-4ed9-8274-45cf0afbe859', '48595f52-b22c-4485-9244-f4004255b972', null, null, '2——1', '', '1402916075113', '1402916075113');
INSERT INTO `cn_note` VALUES ('6d6f5a2a-a09c-4410-be41-10906c5a59e6', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '4', '', '1402637078701', '1402637078701');
INSERT INTO `cn_note` VALUES ('701afa31-2d93-4c41-ba12-2751b8002e2a', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '13', '', '1402917574576', '1402917574576');
INSERT INTO `cn_note` VALUES ('710024f3-f056-445b-81d3-3404bab0b2bf', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '周佳1111', '', '1403079932559', '1403079932559');
INSERT INTO `cn_note` VALUES ('71543875-249a-48a3-8e85-e23f543fcf60', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '28', '', '1402637139582', '1402637139582');
INSERT INTO `cn_note` VALUES ('737a9a27-b02f-4cc2-b447-eba0f047cd0d', '0b11444a-a6d6-45ff-8d46-282afaa6a655', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, 'aaaa', '<p>顶顶顶顶顶顶顶顶顶顶顶顶顶顶<br/></p>', '0', '1402904603602');
INSERT INTO `cn_note` VALUES ('73c8d32e-0ed4-424a-af46-22f00dbf707f', '1db556b9-d1dc-4ed9-8274-45cf0afbe859', '48595f52-b22c-4485-9244-f4004255b972', null, null, '测试收藏活动笔记——1', '<p>测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1</p>', '1403768791522', '1403768791522');
INSERT INTO `cn_note` VALUES ('754f9d52-3c25-40e1-ae5a-6110d799e608', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, 'note2', '<p>阿斯顿发送到撒旦法撒旦法斯蒂芬</p><p>阿萨德fas东方as东方</p><p>asdf s撒地方as东方</p><p>asdfas的</p><p>asdf asdf asd飞</p><p>撒地方sad飞as东方asdf撒旦</p><p>sa东方</p><p>阿斯蒂芬asd飞洒地方<br/></p>', '0', '1402902449594');
INSERT INTO `cn_note` VALUES ('77f61ff8-e7a1-43ac-9740-5d60b8b15b76', 'd0e7ce0d-4893-4705-a51a-9a73d259bc70', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '新建笔记', '', '1402903957110', '1402903957110');
INSERT INTO `cn_note` VALUES ('7851d547-d8a3-40cc-9948-c701cd905d41', '20b4cbec-bd55-4c21-9c41-3a11ada2b803', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, 'note2', '<p>阿斯顿发送到撒旦法撒旦法斯蒂芬</p><p>阿萨德fas东方as东方</p><p>asdf s撒地方as东方</p><p>asdfas的</p><p>asdf asdf asd飞</p><p>撒地方sad飞as东方asdf撒旦</p><p>sa东方</p><p>阿斯蒂芬asd飞洒地方<br/></p>', '1402902467362', '1402902467362');
INSERT INTO `cn_note` VALUES ('7af221ba-0d62-4c62-b063-9c2ba5e4f300', 'd0b0727f-a233-4a1f-8600-f49fc1f25bc9', '48595f52-b22c-4485-9244-f4004255b972', null, null, '22', '', '1402888599823', '1402888599823');
INSERT INTO `cn_note` VALUES ('7b04aebd-15d2-41b3-948c-a28a4a041bec', '20b4cbec-bd55-4c21-9c41-3a11ada2b803', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '测试收藏活动笔记——1', '<p>测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1</p>', '1402998175621', '1402998175621');
INSERT INTO `cn_note` VALUES ('7c44e29b-0622-43dd-9f50-7103b1461bfe', '- è¯·éæ© -', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '周佳22222', '', '1402910570395', '1402910570395');
INSERT INTO `cn_note` VALUES ('7c547246-4fdb-4d29-93b6-8507ce04c81b', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '30', '', '1402637147126', '1402637147126');
INSERT INTO `cn_note` VALUES ('7cc685b4-1b0b-4900-8511-f948aa2c2e28', 'c7f7fcdb-37c0-4d04-8dea-99123c672d4a', '524f7440-7283-4b2d-8af5-4a67570e892e', null, null, '测试参加活动——11111111111', '', '1402644594446', '1402644594446');
INSERT INTO `cn_note` VALUES ('7d4c538f-e4b5-4ac0-8a38-b1aa21c40cda', 'd0b0727f-a233-4a1f-8600-f49fc1f25bc9', '48595f52-b22c-4485-9244-f4004255b972', null, null, '笔记2——1', '<p>笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1</p><p>笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1</p>', '1402914980377', '1402914980377');
INSERT INTO `cn_note` VALUES ('7e4affa2-8cd5-4ba0-abda-751605999507', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '17', '', '1402637110977', '1402637110977');
INSERT INTO `cn_note` VALUES ('7e87de1e-0963-4fe0-b996-d0b13481786e', '20b4cbec-bd55-4c21-9c41-3a11ada2b803', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '周佳1111', '<p>啊水井坊绿卡圣诞节法拉盛简单了咖啡机卡拉斯的了发生发了束带结发阿斯蒂芬</p><p>SD卡反击asflsakd拉斯加发斯蒂芬</p><p>asfsda飞阿斯蒂芬</p><p>阿斯蒂芬</p><p>阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬as的阿斯蒂芬<br/></p>', '1412414792562', '1412414792562');
INSERT INTO `cn_note` VALUES ('7f437cec-c0e6-4799-b6d9-eb70c2e3e75d', '20b4cbec-bd55-4c21-9c41-3a11ada2b803', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '测试参加活动——乱七八糟', '', '1402998762179', '1402998762179');
INSERT INTO `cn_note` VALUES ('7f46f26d-c999-487f-ba57-09300ea9c961', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '14', '<p>的发送到发送到阿萨德阿斯蒂芬啊飒飒的发阿萨德阿萨德阿斯顿发送到发斯蒂芬撒地方阿斯顿发斯蒂芬萨芬撒旦阿斯蒂芬阿萨德阿斯蒂芬阿斯顿发斯蒂芬阿斯蒂芬阿萨德阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬按时打算大发送到撒地方</p><p>阿斯蒂芬爱上阿凡达是法萨芬的爱上法定打发斯蒂芬阿斯顿发生打撒地方艾丝凡爱上法定爱上法定</p><p>阿斯蒂芬爱上发生大发是</p><p>阿斯蒂芬撒飞洒地方额问题千万燃气费而非为废弃物服务费达芬奇无法东方违法我擦</p><p>清楚胃肠道为才<br/></p>', '0', '1402914371716');
INSERT INTO `cn_note` VALUES ('8065bef2-da23-4b06-8f8a-620f97b3f3b1', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '1——4', '<p>测试</p><p>1——4</p><p>1——4</p><p>1——4</p><p>1——4</p><p>1——4</p><p>1——4<br/></p>', '1402919340583', '1402919340583');
INSERT INTO `cn_note` VALUES ('80931c9a-6e5c-43f5-ac0b-a14fe41c665b', '20b4cbec-bd55-4c21-9c41-3a11ada2b803', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, 'aaaa', '<p>顶顶顶顶顶顶顶顶顶顶顶顶顶顶<br/></p>', '1402969758850', '1402969758850');
INSERT INTO `cn_note` VALUES ('80e0f021-c826-4529-b2f2-a550f6d56ed7', 'cce17f11-6b90-4a17-87a2-74df0f5d4991', 'ea09d9b1-ede7-4bd8-b43d-a546680df00b', null, null, '笔记2——1', '<p>笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1</p><p>笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1</p>', '0', '1402539244971');
INSERT INTO `cn_note` VALUES ('84b2d98b-af39-4655-8aa8-d8869d043cca', 'd0e7ce0d-4893-4705-a51a-9a73d259bc70', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '阿斯顿发生大幅', '<p>阿斯蒂芬收到<br/></p>', '0', '1402650617919');
INSERT INTO `cn_note` VALUES ('8530622b-f739-4048-a23f-d226228756b3', '- è¯·éæ© -', '48595f52-b22c-4485-9244-f4004255b972', null, null, '2——1', '', '1402888412155', '1402888412155');
INSERT INTO `cn_note` VALUES ('864fe9cb-7d46-4481-a8a0-93e6ec5a0ca7', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '34', '', '1402637156168', '1402637156168');
INSERT INTO `cn_note` VALUES ('880a2e55-e641-4987-bb8f-2a060aaa882f', '009380f9-f663-4cdf-817e-5ef0257dc220', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '笔记2', '', '1402538152753', '1402538152753');
INSERT INTO `cn_note` VALUES ('88523a80-caba-4e7a-bc50-3f25c08e2f63', '- è¯·éæ© -', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '周佳33333', '', '1402910938108', '1402910938108');
INSERT INTO `cn_note` VALUES ('89732d3a-a85a-4a9c-8618-2b3a9b3c2d65', '1db556b9-d1dc-4ed9-8274-45cf0afbe859', '48595f52-b22c-4485-9244-f4004255b972', null, null, '测试笔记——1', '', '1402997678862', '1402997678862');
INSERT INTO `cn_note` VALUES ('8a46784c-4b82-4e69-aa30-716603971851', '009380f9-f663-4cdf-817e-5ef0257dc220', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '笔记_1_1', '', '1402538620072', '1402538620072');
INSERT INTO `cn_note` VALUES ('8b9b0b03-af5f-407a-b075-a9e433f0c892', '1db556b9-d1dc-4ed9-8274-45cf0afbe859', '48595f52-b22c-4485-9244-f4004255b972', null, null, '测试收藏活动笔记——1', '<p>测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1</p>', '1402997858937', '1402997858937');
INSERT INTO `cn_note` VALUES ('8bcc054f-2d4f-42a5-9729-dd481a42cd15', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '测试111', '', '1402557880818', '1402557880818');
INSERT INTO `cn_note` VALUES ('8d18aaf6-9238-46dc-9c03-988d733790cf', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '22', '', '1402637124473', '1402637124473');
INSERT INTO `cn_note` VALUES ('8d3763b2-8e01-48d4-a338-730b02ded9c9', null, '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, 'junit11111', '12313123123123', '0', '1403682636301');
INSERT INTO `cn_note` VALUES ('8dc47fac-c119-4b8d-9982-575232029a2c', '1d46f5db-f569-4c05-bdba-75106108fcba', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '笔记2——1', '<p>笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1</p><p>笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1</p>', '1412414657203', '1412414657203');
INSERT INTO `cn_note` VALUES ('8e188d43-a7eb-4b85-b46f-dd0917f4a1e1', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '撒打发斯蒂芬', '<p>哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈<br/></p>', '0', '1402562186785');
INSERT INTO `cn_note` VALUES ('9187ffd3-4c1e-4768-9f2f-c600e835b823', 'fa8d3d9d-2de5-4cfe-845f-951041bcc461', '524f7440-7283-4b2d-8af5-4a67570e892e', null, null, '测试笔记——2', '', '1402623081964', '1402623081964');
INSERT INTO `cn_note` VALUES ('91b6444c-2942-4e1b-9ae7-d74f3df0fc9d', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '16', '', '1402919607307', '1402919607307');
INSERT INTO `cn_note` VALUES ('91b7542e-3b63-4c9b-b212-70664e4a59bc', '0037215c-09fe-4eaa-aeb5-25a340c6b39b', '52f9b276-38ee-447f-a3aa-0d54e7a736e4', null, null, 'wsf2', '<p>wsf2<br/></p>', '0', '1403071682162');
INSERT INTO `cn_note` VALUES ('91d43e56-c619-45fc-ad36-4d621c75f001', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '15', '', '1402922280625', '1402922280625');
INSERT INTO `cn_note` VALUES ('92ae3432-b93e-4909-bd83-5a7b8322e47d', '20b4cbec-bd55-4c21-9c41-3a11ada2b803', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, 'dddd', '', '1402650894503', '1402650894503');
INSERT INTO `cn_note` VALUES ('9598cb72-4215-4b58-b7c6-b51ed0b7b3b4', '1db556b9-d1dc-4ed9-8274-45cf0afbe859', '48595f52-b22c-4485-9244-f4004255b972', null, null, '测试收藏活动笔记——1', '<p>测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1</p>', '1402998120232', '1402998120232');
INSERT INTO `cn_note` VALUES ('9860f9f4-3922-47db-a350-f8948fb852e8', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '15', '', '1402637105242', '1402637105242');
INSERT INTO `cn_note` VALUES ('9864d2e5-b76a-47d2-95fd-a6d0964d4f1c', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '13', '', '1402915671255', '1402915671255');
INSERT INTO `cn_note` VALUES ('9c612c62-7743-426d-850e-23a5eaa3454f', '1db556b9-d1dc-4ed9-8274-45cf0afbe859', '48595f52-b22c-4485-9244-f4004255b972', null, null, '1——1', '<p>1——11——11——11——11——11——11——11——11——11——11——11——11——1</p>', '1402890428065', '1402890428065');
INSERT INTO `cn_note` VALUES ('9ccb694d-3237-4d4f-afb1-b84f630f182c', '20b4cbec-bd55-4c21-9c41-3a11ada2b803', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, 'dddd', '', '1402653406248', '1402653406248');
INSERT INTO `cn_note` VALUES ('9dd2e1c8-f118-4c9b-abd4-365e1d55cef8', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '13', '', '1402916639721', '1402916639721');
INSERT INTO `cn_note` VALUES ('9ddf48af-a764-4d49-b9b3-f676651f15e1', '8be77c36-3cd5-4727-a8a9-071316a2eb11', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, 'sdfasdfsd', '', '1402650030117', '1402650030117');
INSERT INTO `cn_note` VALUES ('9e8d711a-6dcf-4507-95ed-e70783ae3838', 'd0b0727f-a233-4a1f-8600-f49fc1f25bc9', '48595f52-b22c-4485-9244-f4004255b972', null, null, '13', '', '1402890405653', '1402890405653');
INSERT INTO `cn_note` VALUES ('a090cf57-c0bf-4eaa-b568-0ac45a94b4e6', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '1——4', '<p>测试</p><p>1——4</p><p>1——4</p><p>1——4</p><p>1——4</p><p>1——4</p><p>1——4<br/></p>', '1402919606768', '1402919606768');
INSERT INTO `cn_note` VALUES ('a0eda0b9-7cab-4fd3-b707-33faf074001f', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '16', '', '1402637108428', '1402637108428');
INSERT INTO `cn_note` VALUES ('a1211435-9bdc-41a1-89a8-d69e5e60873d', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '8', '', '1402637087339', '1402637087339');
INSERT INTO `cn_note` VALUES ('a200ec50-4111-4785-97b3-539115b61ed5', null, '52f9b276-38ee-447f-a3aa-0d54e7a736e4', null, null, 'aaa', '', '1403071618587', '1403071618587');
INSERT INTO `cn_note` VALUES ('a554f158-ac7a-44cc-8b9a-6de8dddd8fa3', 'c8d81ee5-f8cd-49e8-b2e6-ab174a926d95', '48595f52-b22c-4485-9244-f4004255b972', null, null, '测试————22222222', '<p>eeeeeeeeeeeeeeeeeeeeeeeeeee<br/></p>', '0', '1403228140492');
INSERT INTO `cn_note` VALUES ('a78eff65-3550-4a6c-ad88-d10037be2c85', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '13', '', '1402918512292', '1402918512292');
INSERT INTO `cn_note` VALUES ('a84a221b-280e-471b-bbfb-baaa69e1ed06', '8844559e-9d93-459b-a9db-2afcb8a592c8', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, 'lpsd', '', '1405676380515', '1405676380515');
INSERT INTO `cn_note` VALUES ('a8796896-7b1d-484f-9c3a-2b2616c4dfc3', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '12', '', '1402637097784', '1402637097784');
INSERT INTO `cn_note` VALUES ('a87a961a-e38b-4ef1-a23f-c8ca77115326', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '13', '', '1402916230054', '1402916230054');
INSERT INTO `cn_note` VALUES ('a9c3f332-9e0b-44f2-9390-e4897806be04', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '29', '', '1402637142258', '1402637142258');
INSERT INTO `cn_note` VALUES ('ad6b681e-78ce-4a98-8024-9bf651fac900', '4b86d1f9-6345-4532-bc50-ee86442f004b', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '默认2', '', '1402538588389', '1402538588389');
INSERT INTO `cn_note` VALUES ('ae254666-ae5e-4508-9ae0-d54c0e840c6b', '009380f9-f663-4cdf-817e-5ef0257dc220', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '默认5', '', '1402538643778', '1402538643778');
INSERT INTO `cn_note` VALUES ('b0915c66-c879-40a3-8bc0-6265c77777ed', '516f6f4f-eaa3-4c76-84ff-530b92c7f64d', null, null, null, 'title1...', '???????', '1403257746156', '1403257746156');
INSERT INTO `cn_note` VALUES ('b10ae74b-9a5b-4238-bf5f-85df81846e0b', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '1——1', '<p>1——11——11——11——11——11——11——11——11——11——11——11——11——1</p>', '1402914481089', '1402914481089');
INSERT INTO `cn_note` VALUES ('b11608c5-1f77-4e10-a557-c08fd4becbc5', '1db556b9-d1dc-4ed9-8274-45cf0afbe859', '48595f52-b22c-4485-9244-f4004255b972', null, null, '1——5', '<p>1——5</p><p>1——5</p><p>1——5</p><p>1——5</p><p>1——5</p><p>1——5</p><p><br/></p>', '1402916095219', '1402916095219');
INSERT INTO `cn_note` VALUES ('b160185b-84d3-4406-8692-df1b36310633', '516f6f4f-eaa3-4c76-84ff-530b92c7f64d', null, null, null, 'title1...', '笔记笔记。。。', '1403253376516', '1403253376516');
INSERT INTO `cn_note` VALUES ('b1d80e39-2d05-4fb2-a30b-45e483d1f82d', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '13', '', '1402918070759', '1402918070759');
INSERT INTO `cn_note` VALUES ('b4f82f9f-bc0f-480a-b8f2-335164d69945', '0cd94778-4d52-486d-a35d-263b3cfe6de9', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, 'dddd', '<p>阿斯顿发送到阿斯顿发撒旦法撒地方撒地方撒旦发斯蒂芬阿斯顿发撒旦法阿斯蒂芬飞东方撒地方撒地方阿斯顿发撒旦法撒地方阿斯顿发送到</p><p>sadfsadfasdfasd</p><p>的发生撒旦sa东方as东方as东方</p><p>撒地方</p><p>s撒地方</p><p>士大夫</p><p>阿斯蒂芬asd飞asdf</p><p>撒旦f爱上d撒</p><p>撒地方</p><p>撒地方</p><p>阿斯蒂芬</p><p>阿斯蒂芬</p><p>撒地方</p><p>爱上d撒地方</p><p>阿斯蒂芬</p><p>阿萨德f阿萨德f爱上阿斯蒂芬</p><p>撒旦</p><p>爱上</p><p>阿萨德f阿萨德</p><p>阿斯蒂芬</p><p><br/></p>', '0', '1402914312812');
INSERT INTO `cn_note` VALUES ('b5fc7da0-b5e8-4792-8f1f-9fd4b347a64f', '0b11444a-a6d6-45ff-8d46-282afaa6a655', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '笔记1——132', '<p>阿斯顿辅导费的阿萨德东方</p><p>爱的色放飞速达阿萨德</p><p>阿萨德撒地方 撒旦法撒旦按时发达发放倒萨士大夫</p><p>阿萨德法撒旦阿斯蒂芬123123<br/></p>', '0', '1402623661596');
INSERT INTO `cn_note` VALUES ('b692b907-6791-403f-97cc-748d54273960', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '13', '', '1402916811690', '1402916811690');
INSERT INTO `cn_note` VALUES ('b6f39eed-7d6f-42a5-af4f-53b3a1d12451', '516f6f4f-eaa3-4c76-84ff-530b92c7f64d', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '周佳1111', '<p>啊水井坊绿卡圣诞节法拉盛简单了咖啡机卡拉斯的了发生发了束带结发阿斯蒂芬</p><p>SD卡反击asflsakd拉斯加发斯蒂芬</p><p>asfsda飞阿斯蒂芬</p><p>阿斯蒂芬</p><p>阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬as的阿斯蒂芬<br/></p>', '0', '1402910546587');
INSERT INTO `cn_note` VALUES ('b936f721-37a6-467e-be73-e1976cfdd381', '0b11444a-a6d6-45ff-8d46-282afaa6a655', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '1——1', '<p>1——11——11——11——11——11——11——11——11——11——11——11——11——1</p>', '1402914490636', '1402914490636');
INSERT INTO `cn_note` VALUES ('ba7e3681-2a11-4f8d-ba30-6a97369e92ab', 'd0b0727f-a233-4a1f-8600-f49fc1f25bc9', '48595f52-b22c-4485-9244-f4004255b972', null, null, '笔记2——1', '<p>笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1</p><p>笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1</p>', '1403229527083', '1403229527083');
INSERT INTO `cn_note` VALUES ('bb09798b-8f24-46ec-9c92-1534c2e1a9f5', 'd0b0727f-a233-4a1f-8600-f49fc1f25bc9', '48595f52-b22c-4485-9244-f4004255b972', null, null, '14', '', '1402890408352', '1402890408352');
INSERT INTO `cn_note` VALUES ('bd502150-c687-4808-9438-a3159f54a380', '64639e62-9241-4efb-874b-01e97257cb6e', '333c6d0b-e4a2-4596-9902-a5d98c2f665a', null, null, 't1', '', '1402883273532', '1402883273532');
INSERT INTO `cn_note` VALUES ('bd66c7f4-5a99-4787-a13b-297add41f2ed', '516f6f4f-eaa3-4c76-84ff-530b92c7f64d', null, null, null, 'title1...', '笔记笔记。。。', '1403253344556', '1403253344556');
INSERT INTO `cn_note` VALUES ('beb79886-8697-44a4-b736-786aee1dc4ae', '6dc39e41-8c9e-4791-9c13-52a8e537fe64', '524f7440-7283-4b2d-8af5-4a67570e892e', null, null, 'sssss', '', '0', '1402654823022');
INSERT INTO `cn_note` VALUES ('c05111d5-7ff1-40ce-847e-f7c70afc16eb', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '1——5', '<p>1——5</p><p>1——5</p><p>1——5</p><p>1——5</p><p>1——5</p><p>1——5</p><p><br/></p>', '1402922332695', '1402922332695');
INSERT INTO `cn_note` VALUES ('c141800f-a8f5-4350-a7d3-f67bb93dc67a', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '27', '', '1402637136906', '1402637136906');
INSERT INTO `cn_note` VALUES ('c347f832-e2b2-4cb7-af6f-6710241bcdf6', 'd0e7ce0d-4893-4705-a51a-9a73d259bc70', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '啊啊啊啊', '<p>灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌</p><p>灌灌灌灌灌灌灌过嘎嘎嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎嘎嘎嘎嘎个灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌</p><p>阿萨德飞洒地方撒的发生大撒地方盛大撒旦阿斯蒂芬撒的发生大阿斯蒂芬阿萨德阿斯蒂芬阿萨德阿斯蒂芬阿斯蒂芬撒地方阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬<br/></p>', '0', '1402562104482');
INSERT INTO `cn_note` VALUES ('c4b5baec-3d36-4cb2-8a6d-33dd4f0082c8', 'b800156e-42b6-4ca6-b1d4-16901635e431', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, 'test', '', '1412415824640', '1412415824640');
INSERT INTO `cn_note` VALUES ('c7862663-b155-4556-bdd7-1b8ef8decf55', '4b86d1f9-6345-4532-bc50-ee86442f004b', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '笔记3', '', '1402538191489', '1402538191489');
INSERT INTO `cn_note` VALUES ('c9250b3e-ed22-432c-960a-175dbc2134d1', '1db556b9-d1dc-4ed9-8274-45cf0afbe859', '48595f52-b22c-4485-9244-f4004255b972', null, null, '测试收藏活动笔记——1', '<p>测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1</p>', '1403234357167', '1403234357167');
INSERT INTO `cn_note` VALUES ('cf892e06-bf51-40e6-b5a8-7f60f1582554', '1d46f5db-f569-4c05-bdba-75106108fcba', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '13', '', '1402918097228', '1402918097228');
INSERT INTO `cn_note` VALUES ('d007c3d1-226d-434c-8d45-740c5852a78b', 'a1669286-b171-4a06-b2fc-2dfe5afdb0ec', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '123', '', '1405730728825', '1405730728825');
INSERT INTO `cn_note` VALUES ('d3a95052-d772-43ee-8fec-910a5dc336f5', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '13', '', '1402918283780', '1402918283780');
INSERT INTO `cn_note` VALUES ('d3ded3ca-4e79-48fd-a501-ea4df79936c1', '516f6f4f-eaa3-4c76-84ff-530b92c7f64d', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '安装笔记', '<p>首先配置环境~<br/></p>', '0', '1403070709726');
INSERT INTO `cn_note` VALUES ('d45c0f17-5a6e-4d6c-ba31-701017ca0753', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '23', '', '1402637127385', '1402637127385');
INSERT INTO `cn_note` VALUES ('d5019055-30e8-4cdc-bfac-97c6bad9518f', '3e1e84eb-924c-4418-a04d-b0e4347cf583', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '叮叮叮', '', '1402539293420', '1402539293420');
INSERT INTO `cn_note` VALUES ('d68f570d-51aa-4585-acdc-ea2c0e063a03', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '25', '', '1402919345503', '1402919345503');
INSERT INTO `cn_note` VALUES ('d85982ab-dd32-4c0d-94d2-649da47691d7', '20b4cbec-bd55-4c21-9c41-3a11ada2b803', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '周佳note', '', '1402902402726', '1402902402726');
INSERT INTO `cn_note` VALUES ('d9fccea0-4abd-47de-a3e7-9b9a047bb7ca', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '10', '', '1402637093133', '1402637093133');
INSERT INTO `cn_note` VALUES ('db29d725-34b4-480d-8d26-8438b81d4c0d', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '33', '', '1402637153778', '1402637153778');
INSERT INTO `cn_note` VALUES ('db88b965-4216-45fe-8e6a-c0381fdb6850', '20b4cbec-bd55-4c21-9c41-3a11ada2b803', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '测试参加活动——11111111111', '', '1402997948720', '1402997948720');
INSERT INTO `cn_note` VALUES ('df26d19a-a6fa-42d5-9e20-506d1c9b52e4', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '撒旦法撒旦', '', '1402911131665', '1402911131665');
INSERT INTO `cn_note` VALUES ('e0abeeb6-1290-4204-b453-c18c1210a921', 'a1669286-b171-4a06-b2fc-2dfe5afdb0ec', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '东方飞', '', '1403079731435', '1403079731435');
INSERT INTO `cn_note` VALUES ('e18e390d-be42-46bb-8028-bbf684ac101b', '516f6f4f-eaa3-4c76-84ff-530b92c7f64d', null, null, null, 'title1...', '笔记笔记。。。', '1403258346113', '1403258346113');
INSERT INTO `cn_note` VALUES ('e3164ed5-025c-4e3d-bf97-635c18aec845', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '13', '', '1402916036586', '1402916036586');
INSERT INTO `cn_note` VALUES ('e361d00f-e9e2-457a-bd1a-8b7d60e96c74', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '6', '', '1402637082707', '1402637082707');
INSERT INTO `cn_note` VALUES ('e410fc11-0fe3-44b4-9972-347279a46cc2', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '3', '', '1402637076638', '1402637076638');
INSERT INTO `cn_note` VALUES ('e42e03b3-287d-4a44-95fa-498eca565a35', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '2', '', '1402637073718', '1402637073718');
INSERT INTO `cn_note` VALUES ('e5a7bced-bbe8-4fc9-add7-2eaa9201a464', '1d46f5db-f569-4c05-bdba-75106108fcba', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '13', '', '1402918970371', '1402918970371');
INSERT INTO `cn_note` VALUES ('e5a9d662-e142-45ea-abe4-734554ad4639', '20b4cbec-bd55-4c21-9c41-3a11ada2b803', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '测试参加活动——乱七八糟', '', '1402998258282', '1402998258282');
INSERT INTO `cn_note` VALUES ('e633e99d-c8dd-44f3-8d8e-5b0966e0927c', '- è¯·éæ© -', '48595f52-b22c-4485-9244-f4004255b972', null, null, '1——1', '<p>1——11——11——11——11——11——11——11——11——11——11——11——11——1</p>', '0', '1402888272331');
INSERT INTO `cn_note` VALUES ('e6add2e6-76e8-4b55-954d-521615f319c0', '1d46f5db-f569-4c05-bdba-75106108fcba', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '13', '', '1402918174030', '1402918174030');
INSERT INTO `cn_note` VALUES ('e7ad7070-6417-4362-a316-8d61dc004ebb', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, 'Demo1', '', '1404865122090', '1404865122090');
INSERT INTO `cn_note` VALUES ('e7cbaf1a-591f-4c61-8517-01f8c160e23e', '1d46f5db-f569-4c05-bdba-75106108fcba', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '测试参加活动——乱七八糟', '', '1402999042856', '1402999042856');
INSERT INTO `cn_note` VALUES ('eacf1a78-2863-4d81-8b36-de23d21c23bc', '1d46f5db-f569-4c05-bdba-75106108fcba', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '5', '', '1402919759335', '1402919759335');
INSERT INTO `cn_note` VALUES ('eb08f452-2bce-498c-b32c-75103252718b', '0cd94778-4d52-486d-a35d-263b3cfe6de9', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, 'fffff', '<p>sdsdfas<br/></p>', '0', '1402914256924');
INSERT INTO `cn_note` VALUES ('eb8d766b-1795-4c8e-b0e4-f8dc0d2325b8', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '测试参加活动——11111111111', '', '1402919607509', '1402919607509');
INSERT INTO `cn_note` VALUES ('ebd65da6-3f90-45f9-b045-782928a5e2c0', 'fa8d3d9d-2de5-4cfe-845f-951041bcc461', '524f7440-7283-4b2d-8af5-4a67570e892e', null, null, '测试笔记——4', '', '1402637035665', '1402637035665');
INSERT INTO `cn_note` VALUES ('ed1ad6d4-301f-427d-bf8f-ca46fd957603', '20b4cbec-bd55-4c21-9c41-3a11ada2b803', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '啊啊啊啊', '<p>灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌</p><p>灌灌灌灌灌灌灌过嘎嘎嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎嘎嘎嘎嘎个灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌</p><p>阿萨德飞洒地方撒的发生大撒地方盛大撒旦阿斯蒂芬撒的发生大阿斯蒂芬阿萨德阿斯蒂芬阿萨德阿斯蒂芬阿斯蒂芬撒地方阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬<br/></p>', '1403502122510', '1403502122510');
INSERT INTO `cn_note` VALUES ('f113ba13-24a0-4552-a0d5-a1ee65241cd2', '516f6f4f-eaa3-4c76-84ff-530b92c7f64d', null, null, null, 'title1...', '???????', '1403258304931', '1403258304931');
INSERT INTO `cn_note` VALUES ('f2e28f90-7862-467b-a17e-31fcd9f7147b', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '24', '', '1402637129975', '1402637129975');
INSERT INTO `cn_note` VALUES ('f3ad58a7-eb14-4766-90b2-25d5fd22113b', '1d46f5db-f569-4c05-bdba-75106108fcba', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '13', '', '1402917565146', '1402917565146');
INSERT INTO `cn_note` VALUES ('f4594f33-06d4-47dc-87cf-c3bd20e5a23f', '0b11444a-a6d6-45ff-8d46-282afaa6a655', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '阿斯蒂芬阿斯蒂芬撒飞', '', '1402562701593', '1402562701593');
INSERT INTO `cn_note` VALUES ('f4cce0e5-ba14-4deb-bc04-e396f53c40f3', '1d46f5db-f569-4c05-bdba-75106108fcba', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '13', '', '1402916290924', '1402916290924');
INSERT INTO `cn_note` VALUES ('f74d03aa-d01d-4989-95e8-4757d6ca8a2a', 'b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '11', '<p>asdfasdfsadfaaa<br/></p>', '0', '1402648154475');
INSERT INTO `cn_note` VALUES ('fed920a0-573c-46c8-ae4e-368397846efd', 'fa8d3d9d-2de5-4cfe-845f-951041bcc461', '524f7440-7283-4b2d-8af5-4a67570e892e', null, null, '测试笔记——3', '', '1402637030385', '1402637030385');
INSERT INTO `cn_note` VALUES ('ffc2cf21-78ed-4647-adb4-3e545613ef26', '20b4cbec-bd55-4c21-9c41-3a11ada2b803', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '啊啊啊啊', '<p>灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌</p><p>灌灌灌灌灌灌灌过嘎嘎嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎嘎嘎嘎嘎个灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌</p><p>阿萨德飞洒地方撒的发生大撒地方盛大撒旦阿斯蒂芬撒的发生大阿斯蒂芬阿萨德阿斯蒂芬阿萨德阿斯蒂芬阿斯蒂芬撒地方阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬<br/></p>', '1412404343546', '1412404343546');
INSERT INTO `cn_note` VALUES ('fsaf-as-df-asdf-as-df-dsa', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '我的收藏1', '111111', '1402539293420', '1402539293420');
INSERT INTO `cn_note` VALUES ('ss19055-30e8-4cdc-bfac-97c6bad9518f', '6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', null, null, '我的收藏2', '2222', '1402539293420', '1402539293420');

-- ----------------------------
-- Table structure for `cn_notebook`
-- ----------------------------
DROP TABLE IF EXISTS `cn_notebook`;
CREATE TABLE `cn_notebook` (
  `cn_notebook_id` varchar(100) NOT NULL COMMENT '笔记本ID',
  `cn_user_id` varchar(100) DEFAULT NULL COMMENT '用户ID',
  `cn_notebook_type_id` varchar(100) DEFAULT NULL COMMENT '笔记本类型ID',
  `cn_notebook_name` varchar(500) DEFAULT NULL COMMENT '笔记本名',
  `cn_notebook_desc` text COMMENT '笔记本说明',
  `cn_notebook_createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cn_notebook_id`),
  KEY `FK_Note_User_Reference` (`cn_user_id`),
  KEY `FK_Reference_6` (`cn_notebook_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cn_notebook
-- ----------------------------
INSERT INTO `cn_notebook` VALUES ('0037215c-09fe-4eaa-aeb5-25a340c6b39b', '52f9b276-38ee-447f-a3aa-0d54e7a736e4', '5', 'wsf', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('01e24d89-15ab-4b6a-bf6f-2e5ad10b2041', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', '5', '笔记本1111', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('049d4cd3-943b-4fc0-97cf-520cd788fe85', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', '5', '笔记本1', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('0b11444a-a6d6-45ff-8d46-282afaa6a655', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', '5', '笔记本1', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('0cd94778-4d52-486d-a35d-263b3cfe6de9', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', '5', 'zhoujia_test', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('12119052-874c-4341-b85d-6529e171ed83', '48595f52-b22c-4485-9244-f4004255b972', '5', '测试——5', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('1755013b-05fc-4218-83cf-956287a81b49', 'ea09d9b1-ede7-4bd8-b43d-a546680df00b', '4', 'push', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('1b05c9c7-f1cd-4842-beae-15ed95a1febb', '03590914-a934-4da9-ba4d-b41799f917d1', '3', 'action', null, '2014-07-09 17:16:45');
INSERT INTO `cn_notebook` VALUES ('1d46f5db-f569-4c05-bdba-75106108fcba', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', '1', 'favorites', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('1db556b9-d1dc-4ed9-8274-45cf0afbe859', '48595f52-b22c-4485-9244-f4004255b972', '3', 'action', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('1ea71525-2a72-4115-abb0-197b78e92f29', '524f7440-7283-4b2d-8af5-4a67570e892e', '5', 'sssss', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('1ecf916f-61b8-409a-8173-1e548ac65d89', 'ea09d9b1-ede7-4bd8-b43d-a546680df00b', '3', 'action', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('1fdb7adb-5da0-41f7-8f4e-5a512dbed9fc', '52f9b276-38ee-447f-a3aa-0d54e7a736e4', '4', 'push', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('20b4cbec-bd55-4c21-9c41-3a11ada2b803', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', '3', 'action', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('2a4ca5bb-3073-4194-9d4e-5db0ec5c0998', '48595f52-b22c-4485-9244-f4004255b972', '2', 'recycle', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('2c0bda01-b6bb-48b3-92e5-89f42cda6d27', '333c6d0b-e4a2-4596-9902-a5d98c2f665a', '4', 'push', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('4acb305b-5def-47ae-8832-c2a188662085', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', '4', 'push', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('516f6f4f-eaa3-4c76-84ff-530b92c7f64d', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', '5', 'hadoop', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('5612df0f-2b3a-4a8c-8df7-e1de67b6abcd', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', '5', 'time_test', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('59b354f8-47ae-437d-a432-7d28736bd894', '48595f52-b22c-4485-9244-f4004255b972', '5', '333', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('64639e62-9241-4efb-874b-01e97257cb6e', '333c6d0b-e4a2-4596-9902-a5d98c2f665a', '5', 'test_1', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('6666666666666666666666666666666666', '524f7440-7283-4b2d-8af5-4a67570e892e', '3', 'avtion', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('6d763ac9-dca3-42d7-a2a7-a08053095c08', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', '2', 'recycle', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('6dc39e41-8c9e-4791-9c13-52a8e537fe64', '524f7440-7283-4b2d-8af5-4a67570e892e', '5', '测试笔记本——2', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('738202b0-41de-4aee-9278-5f2134091ae2', '333c6d0b-e4a2-4596-9902-a5d98c2f665a', '3', 'action', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('8844559e-9d93-459b-a9db-2afcb8a592c8', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', '5', 'klsfj', null, '2014-07-18 17:39:32');
INSERT INTO `cn_notebook` VALUES ('885bbeab-ab12-4048-adb2-c6fd9c3e9be8', '03590914-a934-4da9-ba4d-b41799f917d1', '2', 'recycle', null, '2014-07-09 17:16:45');
INSERT INTO `cn_notebook` VALUES ('8888888888888888888888888888888888', '524f7440-7283-4b2d-8af5-4a67570e892e', '1', 'favorites', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('8be77c36-3cd5-4727-a8a9-071316a2eb11', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', '5', 'zhoujia-111', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('94730716-2002-4952-ba23-aeb1e92ea00a', '52f9b276-38ee-447f-a3aa-0d54e7a736e4', '1', 'favorites', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('97a87189-c661-4a14-8081-faf011904499', '03590914-a934-4da9-ba4d-b41799f917d1', '4', 'push', null, '2014-07-09 17:16:45');
INSERT INTO `cn_notebook` VALUES ('9999999999999999999999999999999999', '524f7440-7283-4b2d-8af5-4a67570e892e', '2', 'recycle', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('9c68ca1a-830f-4a81-a8ec-d148d2df4f7f', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', '5', 'dddd ', null, '2014-06-27 15:18:32');
INSERT INTO `cn_notebook` VALUES ('a1358ece-bd30-48a2-a53c-0fe195609fd2', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', '5', 'wsf', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('a1669286-b171-4a06-b2fc-2dfe5afdb0ec', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', '5', 'Hello', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('a20ac761-c1eb-462a-8ed9-c0a9fb412e70', '03590914-a934-4da9-ba4d-b41799f917d1', '1', 'favorites', null, '2014-07-09 17:16:45');
INSERT INTO `cn_notebook` VALUES ('a248decc-0fb6-402c-83e9-ea33a276968a', '333c6d0b-e4a2-4596-9902-a5d98c2f665a', '1', 'favorites', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('ab2a2058-8d8f-41a1-b7c4-b4a7b6f95fc3', '333c6d0b-e4a2-4596-9902-a5d98c2f665a', '2', 'recycle', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('af8be968-66bb-4b75-ac5d-d7deb772640f', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', '5', '而成的', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('b6887c05-7316-4088-8d67-c451f1474575', 'ea09d9b1-ede7-4bd8-b43d-a546680df00b', '5', '笔记1', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('b800156e-42b6-4ca6-b1d4-16901635e431', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', '5', 'Demo', null, '2014-07-07 17:19:46');
INSERT INTO `cn_notebook` VALUES ('b8080f1b-bb1e-4929-853c-b1cd1e2ff7a5', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', '5', '发大水发', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('bfe73e2c-289f-4eab-82b2-b82ba17c1396', '48595f52-b22c-4485-9244-f4004255b972', '4', 'push', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('c3cc0f49-5f58-4585-85aa-675ce38a2368', '524f7440-7283-4b2d-8af5-4a67570e892e', '5', '得得得得得', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('c7f7fcdb-37c0-4d04-8dea-99123c672d4a', '524f7440-7283-4b2d-8af5-4a67570e892e', '5', '22222222222222222', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('c8d81ee5-f8cd-49e8-b2e6-ab174a926d95', '48595f52-b22c-4485-9244-f4004255b972', '5', '测试——22222', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('cce17f11-6b90-4a17-87a2-74df0f5d4991', 'ea09d9b1-ede7-4bd8-b43d-a546680df00b', '5', '笔记2', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('d0b0727f-a233-4a1f-8600-f49fc1f25bc9', '48595f52-b22c-4485-9244-f4004255b972', '1', 'favorites', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('d0e7ce0d-4893-4705-a51a-9a73d259bc70', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', '5', '别基本3', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('d92e6b86-e48a-485d-8f11-04a93818bb42', '48595f52-b22c-4485-9244-f4004255b972', '5', '测试——1', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('db31c93f-957f-4f3c-ae67-cd443d5c0d06', 'ea09d9b1-ede7-4bd8-b43d-a546680df00b', '1', 'favorites', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('dd7fd38c-3d22-4206-bcdd-324c1cb8983b', '52f9b276-38ee-447f-a3aa-0d54e7a736e4', '3', 'action', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('e46239d6-4f54-426c-a448-f7a0d45f9425', 'ea09d9b1-ede7-4bd8-b43d-a546680df00b', '2', 'recycle', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('f34edc18-df1e-4a32-9fa6-242e4729481d', '39295a3d-cc9b-42b4-b206-a2e7fab7e77c', '5', 'Demo', null, '2014-07-07 17:19:39');
INSERT INTO `cn_notebook` VALUES ('f45f368b-6558-426e-a58e-a7b819d29ca9', '52f9b276-38ee-447f-a3aa-0d54e7a736e4', '2', 'recycle', null, '2014-06-27 15:18:59');
INSERT INTO `cn_notebook` VALUES ('fa8d3d9d-2de5-4cfe-845f-951041bcc461', '524f7440-7283-4b2d-8af5-4a67570e892e', '5', '测试笔记本——3', null, '2014-06-27 15:18:59');

-- ----------------------------
-- Table structure for `cn_notebook_type`
-- ----------------------------
DROP TABLE IF EXISTS `cn_notebook_type`;
CREATE TABLE `cn_notebook_type` (
  `cn_notebook_type_id` varchar(100) NOT NULL COMMENT '笔记本类型ID',
  `cn_notebook_type_code` varchar(100) DEFAULT NULL COMMENT '笔记本类型Code',
  `cn_notebook_type_name` varchar(500) DEFAULT NULL COMMENT '笔记本类型名称',
  `cn_notebook_type_desc` text COMMENT '笔记本类型说明',
  PRIMARY KEY (`cn_notebook_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cn_notebook_type
-- ----------------------------
INSERT INTO `cn_notebook_type` VALUES ('1', 'favorites', 'favorites', '收藏');
INSERT INTO `cn_notebook_type` VALUES ('2', 'recycle', 'recycle', '回收站');
INSERT INTO `cn_notebook_type` VALUES ('3', 'action', 'action', '活动');
INSERT INTO `cn_notebook_type` VALUES ('4', 'push', 'push', '推送');
INSERT INTO `cn_notebook_type` VALUES ('5', 'normal', 'normal', '正常');

-- ----------------------------
-- Table structure for `cn_note_activity`
-- ----------------------------
DROP TABLE IF EXISTS `cn_note_activity`;
CREATE TABLE `cn_note_activity` (
  `cn_note_activity_id` varchar(100) NOT NULL COMMENT '投稿ID',
  `cn_activity_id` varchar(100) DEFAULT NULL COMMENT '活动ID',
  `cn_note_id` varchar(100) DEFAULT NULL COMMENT '笔记ID',
  `cn_note_activity_up` int(11) DEFAULT NULL COMMENT '投稿赞:增加数',
  `cn_note_activity_down` int(11) DEFAULT NULL COMMENT '投稿踩:增加数',
  `cn_note_activity_title` varchar(500) DEFAULT NULL,
  `cn_note_activity_body` text,
  PRIMARY KEY (`cn_note_activity_id`),
  KEY `FK_Reference_4` (`cn_activity_id`),
  KEY `FK_Reference_5` (`cn_note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cn_note_activity
-- ----------------------------
INSERT INTO `cn_note_activity` VALUES ('', null, 'ce997ee1-0adf-4d71-9be9-fe32807c34fb', null, null, null, null);
INSERT INTO `cn_note_activity` VALUES ('0533bce4-0341-4d07-a953-3e6bbb402c75', '8', '737a9a27-b02f-4cc2-b447-eba0f047cd0d', '0', '0', 'aaaa', '<p>顶顶顶顶顶顶顶顶顶顶顶顶顶顶<br/></p>');
INSERT INTO `cn_note_activity` VALUES ('07468f36-fe97-4033-aa77-88c867a4fc3b', '3', '046b0110-67f9-48c3-bef3-b0b23bda9d4e', '0', '0', '啊啊啊啊', '<p>灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌</p><p>灌灌灌灌灌灌灌过嘎嘎嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎嘎嘎嘎嘎个灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌</p><p>阿萨德飞洒地方撒的发生大撒地方盛大撒旦阿斯蒂芬撒的发生大阿斯蒂芬阿萨德阿斯蒂芬阿萨德阿斯蒂芬阿斯蒂芬撒地方阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬<br/></p>');
INSERT INTO `cn_note_activity` VALUES ('0c6b43f6-ada8-4eba-a859-c7f3ad68ea10', '1', '326f17e8-ff04-4a79-b33b-ae4bb3bb5f1b', '0', '0', '测试收藏活动笔记——1', '<p>测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1</p>');
INSERT INTO `cn_note_activity` VALUES ('1111223213', '111222', '1231312312313', '0', '0', 'junit test', '阿斯顿福建收到了空间发啊死啦款到即发阿斯利康京东方');
INSERT INTO `cn_note_activity` VALUES ('1111223213123123', '11122231231', '1231312312313', '0', '0', 'junit test', '阿斯顿福建收到了空间发啊死啦款到即发阿斯利康京东方');
INSERT INTO `cn_note_activity` VALUES ('1111223213123123adf', '11122231231', '1231312312313', '0', '0', 'junit test', '阿斯顿福建收到了空间发啊死啦款到即发阿斯利康京东方');
INSERT INTO `cn_note_activity` VALUES ('1a2348f1-d083-480d-b899-41df960927bf', 'fa8d3d9d-2de5-4cfe-845f-951041bcc461', '3febebb3-a1b7-45ac-83ba-50cdb41e5fc1', '0', '0', '测试笔记——1', '');
INSERT INTO `cn_note_activity` VALUES ('1ef6eeaa-e995-409f-a810-7c1eeb736e99', '6dc39e41-8c9e-4791-9c13-52a8e537fe64', 'ce997ee1-0adf-4d71-9be9-fe32807c34fb', '0', '0', 'ddddddddddddddddddd', '<p>彭川测试彭川测试彭川测试彭川测试彭川测试彭川测试彭川测试彭川测试dddddd</p>');
INSERT INTO `cn_note_activity` VALUES ('20010a60-bab4-41ea-9aff-18d6c16cd110', 'fa8d3d9d-2de5-4cfe-845f-951041bcc461', '754f9d52-3c25-40e1-ae5a-6110d799e608', '0', '0', 'note2', '<p>阿斯顿发送到撒旦法撒旦法斯蒂芬</p><p>阿萨德fas东方as东方</p><p>asdf s撒地方as东方</p><p>asdfas的</p><p>asdf asdf asd飞</p><p>撒地方sad飞as东方asdf撒旦</p><p>sa东方</p><p>阿斯蒂芬asd飞洒地方<br/></p>');
INSERT INTO `cn_note_activity` VALUES ('2630c3fb-ac81-4501-9d54-c6fa8cd26dd5', '1', 'd3ded3ca-4e79-48fd-a501-ea4df79936c1', '0', '0', '安装笔记', '<p>首先配置环境~<br/></p>');
INSERT INTO `cn_note_activity` VALUES ('30d697bf-c1eb-466b-9f9d-83019c6d3a56', '1', '60480071-f989-4945-9b1c-0d2aba07ae96', '0', '0', '测试参加活动——乱七八糟', '');
INSERT INTO `cn_note_activity` VALUES ('5595e8c9-df35-4e91-8e8c-a3af3a0c3de3', '1', '7cc685b4-1b0b-4900-8511-f948aa2c2e28', '0', '0', '测试参加活动——11111111111', '');
INSERT INTO `cn_note_activity` VALUES ('60aadac1-6e35-4b2e-a5c4-3cd430a7803a', 'fa8d3d9d-2de5-4cfe-845f-951041bcc461', 'b4f82f9f-bc0f-480a-b8f2-335164d69945', '0', '0', 'dddd', '');
INSERT INTO `cn_note_activity` VALUES ('61c4fbd2-b311-49f0-93cf-556b198c850f', 'fa8d3d9d-2de5-4cfe-845f-951041bcc461', 'ebd65da6-3f90-45f9-b045-782928a5e2c0', '0', '0', '测试笔记——4', '');
INSERT INTO `cn_note_activity` VALUES ('6aa515cc-43b2-4ecc-8bb6-f298ad2cabd7', '1', '5565bda4-ddee-4f87-844e-2ba83aa4925f', '0', '0', '1——5', '<p>1——5</p><p>1——5</p><p>1——5</p><p>1——5</p><p>1——5</p><p>1——5</p><p><br/></p>');
INSERT INTO `cn_note_activity` VALUES ('74a9eb36-043b-4715-8c4f-0b7927eea7de', 'undefined', '3febebb3-a1b7-45ac-83ba-50cdb41e5fc1', '0', '0', '测试笔记——1', '');
INSERT INTO `cn_note_activity` VALUES ('788f6e74-aa66-46eb-bc24-f041935080ff', 'fa8d3d9d-2de5-4cfe-845f-951041bcc461', 'b4f82f9f-bc0f-480a-b8f2-335164d69945', '0', '0', 'dddd', '');
INSERT INTO `cn_note_activity` VALUES ('918dc992-3b64-40a4-9750-7868b15121c7', 'fa8d3d9d-2de5-4cfe-845f-951041bcc461', 'ebd65da6-3f90-45f9-b045-782928a5e2c0', '0', '0', '测试笔记——4', '');
INSERT INTO `cn_note_activity` VALUES ('9971724f-e890-429b-8ffc-a52eb73e59a4', '1', '326f17e8-ff04-4a79-b33b-ae4bb3bb5f1b', '0', '0', '测试收藏活动笔记——1', '<p>测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1</p>');
INSERT INTO `cn_note_activity` VALUES ('9a0512d2-e8e3-431b-9a2b-c010e01b8cf0', 'c7f7fcdb-37c0-4d04-8dea-99123c672d4a', '60480071-f989-4945-9b1c-0d2aba07ae96', '0', '0', '测试参加活动——乱七八糟', '');
INSERT INTO `cn_note_activity` VALUES ('9f3fe6bc-3353-4f91-8883-452e37edcd5c', 'fa8d3d9d-2de5-4cfe-845f-951041bcc461', '60480071-f989-4945-9b1c-0d2aba07ae96', '0', '0', '测试参加活动——乱七八糟', '');
INSERT INTO `cn_note_activity` VALUES ('a892e798-55aa-4ee1-ac7a-feec25f52f3a', '8', 'b5fc7da0-b5e8-4792-8f1f-9fd4b347a64f', '0', '0', '笔记1——132', '<p>阿斯顿辅导费的阿萨德东方</p><p>爱的色放飞速达阿萨德</p><p>阿萨德撒地方 撒旦法撒旦按时发达发放倒萨士大夫</p><p>阿萨德法撒旦阿斯蒂芬123123<br/></p>');
INSERT INTO `cn_note_activity` VALUES ('ae2aa279-6f29-4723-97a0-71269e649921', '1', '326f17e8-ff04-4a79-b33b-ae4bb3bb5f1b', '0', '0', '测试收藏活动笔记——1', '<p>测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1</p>');
INSERT INTO `cn_note_activity` VALUES ('b492c950-8690-4c50-a0dd-2ee45a6ce199', '1', 'b6f39eed-7d6f-42a5-af4f-53b3a1d12451', '0', '0', '周佳1111', '<p>啊水井坊绿卡圣诞节法拉盛简单了咖啡机卡拉斯的了发生发了束带结发阿斯蒂芬</p><p>SD卡反击asflsakd拉斯加发斯蒂芬</p><p>asfsda飞阿斯蒂芬</p><p>阿斯蒂芬</p><p>阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬as的阿斯蒂芬<br/></p>');
INSERT INTO `cn_note_activity` VALUES ('ba60ed45-1474-4ae2-af7c-73b10dcffbc0', '1', '8530622b-f739-4048-a23f-d226228756b3', '0', '0', '2——1', '');
INSERT INTO `cn_note_activity` VALUES ('bea04303-1590-4da8-8905-3f5a3b0202e8', 'fa8d3d9d-2de5-4cfe-845f-951041bcc461', 'ebd65da6-3f90-45f9-b045-782928a5e2c0', '0', '0', '测试笔记——4', '');
INSERT INTO `cn_note_activity` VALUES ('c08620aa-dbf6-401a-9c86-59030417c70b', 'fa8d3d9d-2de5-4cfe-845f-951041bcc461', '3febebb3-a1b7-45ac-83ba-50cdb41e5fc1', '0', '0', '测试笔记——1', '');
INSERT INTO `cn_note_activity` VALUES ('c365d8e6-7a51-4607-af9a-08261c2a6f7b', 'fa8d3d9d-2de5-4cfe-845f-951041bcc461', 'e633e99d-c8dd-44f3-8d8e-5b0966e0927c', '0', '0', '1——1', '<p>1——11——11——11——11——11——11——11——11——11——11——11——11——1</p>');
INSERT INTO `cn_note_activity` VALUES ('c44c84eb-983c-49a5-8922-34f82a6750b9', 'fa8d3d9d-2de5-4cfe-845f-951041bcc461', '668354a9-c7b4-46a0-9a6d-b138cdefc941', '0', '0', 'aaaa', '<p>啊啊啊啊啊啊啊啊啊啊啊啊</p><p>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p><p><br/></p><p><br/></p><p>啊&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p><p>啊&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p><p>啊&nbsp; 啊啊安装啊擦杀手锏几十封水电费哈数据库电话费阿迪少喝咖啡哈苏丹红将SD卡后方可发生东方航空阿飞啊剑神发哈卡斯加和东方加水电费哈斯卡东方红卡萨京东方看见司法局分开奖号覅王全覆盖撒地方将和的发射到发神经货到付款级啊双飞刀暗红色的罚款京哈卡加少废话卡加水电费卡拉斯电话费卡加水电费就啊哈撒地方库哈斯电话费卡萨丁后发生剪短发了卡萨京东方缴费【if圣诞节罚款加阿斯顿发货阿斯顿减肥撒旦了咖啡机收到啊剑神咖啡哈桑就款到发货爱上积分卡水井坊路口减肥拉斯克奖分拉斯克奖法拉克水煎服啊拉斯克奖地方阿拉山口缴费乐俊凯减肥拉斯克奖发了卡萨京东方看京东方<br/></p>');
INSERT INTO `cn_note_activity` VALUES ('d1311a01-20f0-4645-b764-b4066613134f', 'fa8d3d9d-2de5-4cfe-845f-951041bcc461', '53d1b3ed-59a1-4715-a7b2-9027b0d551e0', '0', '0', '周佳note', '');
INSERT INTO `cn_note_activity` VALUES ('d322e34c-e8f3-4a29-9bb1-55fa4395879f', '3', '046b0110-67f9-48c3-bef3-b0b23bda9d4e', '0', '0', '啊啊啊啊', '<p>灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌</p><p>灌灌灌灌灌灌灌过嘎嘎嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎嘎嘎嘎嘎个灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌</p><p>阿萨德飞洒地方撒的发生大撒地方盛大撒旦阿斯蒂芬撒的发生大阿斯蒂芬阿萨德阿斯蒂芬阿萨德阿斯蒂芬阿斯蒂芬撒地方阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬<br/></p>');
INSERT INTO `cn_note_activity` VALUES ('ddddddddddddddddddddddddddd', '1', 'ce997ee1-0adf-4d71-9be9-fe32807c34fb', '0', '0', 'ddddddddddddddddd', '								</pre>');
INSERT INTO `cn_note_activity` VALUES ('e49eff6a-0ff1-4c57-b529-c7e6257388d4', '1', '3febebb3-a1b7-45ac-83ba-50cdb41e5fc1', '0', '0', '测试笔记——1', '');
INSERT INTO `cn_note_activity` VALUES ('eeeeeeeeeeeeeeeeeeeee', '1', 'ce997ee1-0adf-4d71-9be9-fe32807c34fb', '0', '0', 'eeeeeeee', '<pre class=\"prettyprint linenums\">\r\n&lt;script type=\"text/javascript\"&gt;\r\n	function get_dom(e){\r\n		return document.getElementById(e);\r\n	}\r\n	function set_height(){\r\n		var pc_height=window.innerHeight;\r\n		pc_height=pc_height-131;\r\n		get_dom(\'first_side_right\').style.height=(pc_height-31)+\'px\';\r\n		get_dom(\'second_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'four_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'input_note_text\').value=pc_height+\'px\';\r\n		get_dom(\'third_side_right\').style.height=(pc_height-15)+\'px\';\r\n		get_dom(\'fifth_side_right\').style.height=(pc_height-15)+\'px\';\r\n	}\r\n	set_height();\r\n	window.onresize=function(){\r\n		set_height();//pengchuan\r\n	}\r\n	function get_dom(e){\r\n		return document.getElementById(e);\r\n	}\r\n	function set_height(){\r\n		var pc_height=window.innerHeight;\r\n		pc_height=pc_height-131;\r\n		get_dom(\'first_side_right\').style.height=(pc_height-31)+\'px\';\r\n		get_dom(\'second_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'four_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'input_note_text\').value=pc_height+\'px\';\r\n		get_dom(\'third_side_right\').style.height=(pc_height-15)+\'px\';\r\n		get_dom(\'fifth_side_right\').style.height=(pc_height-15)+\'px\';\r\n	}\r\n	set_height();\r\n	window.onresize=function(){\r\n		set_height();//pengchuan\r\n	}\r\n	function get_dom(e){\r\n		return document.getElementById(e);\r\n	}\r\n	function set_height(){\r\n		var pc_height=window.innerHeight;\r\n		pc_height=pc_height-131;\r\n		get_dom(\'first_side_right\').style.height=(pc_height-31)+\'px\';\r\n		get_dom(\'second_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'four_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'input_note_text\').value=pc_height+\'px\';\r\n		get_dom(\'third_side_right\').style.height=(pc_height-15)+\'px\';\r\n		get_dom(\'fifth_side_right\').style.height=(pc_height-15)+\'px\';\r\n	}\r\n	set_height();\r\n	window.onresize=function(){\r\n		set_height();//pengchuan\r\n	}\r\n	function get_dom(e){\r\n		return document.getElementById(e);\r\n	}\r\n	function set_height(){\r\n		var pc_height=window.innerHeight;\r\n		pc_height=pc_height-131;\r\n		get_dom(\'first_side_right\').style.height=(pc_height-31)+\'px\';\r\n		get_dom(\'second_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'four_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'input_note_text\').value=pc_height+\'px\';\r\n		get_dom(\'third_side_right\').style.height=(pc_height-15)+\'px\';\r\n		get_dom(\'fifth_side_right\').style.height=(pc_height-15)+\'px\';\r\n	}\r\n	set_height();\r\n	window.onresize=function(){\r\n		set_height();//pengchuan\r\n	}\r\n	function get_dom(e){\r\n		return document.getElementById(e);\r\n	}\r\n	function set_height(){\r\n		var pc_height=window.innerHeight;\r\n		pc_height=pc_height-131;\r\n		get_dom(\'first_side_right\').style.height=(pc_height-31)+\'px\';\r\n		get_dom(\'second_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'four_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'input_note_text\').value=pc_height+\'px\';\r\n		get_dom(\'third_side_right\').style.height=(pc_height-15)+\'px\';\r\n		get_dom(\'fifth_side_right\').style.height=(pc_height-15)+\'px\';\r\n	}\r\n	set_height();\r\n	window.onresize=function(){\r\n		set_height();//pengchuan\r\n	}\r\n	function get_dom(e){\r\n		return document.getElementById(e);\r\n	}\r\n	function set_height(){\r\n		var pc_height=window.innerHeight;\r\n		pc_height=pc_height-131;\r\n		get_dom(\'first_side_right\').style.height=(pc_height-31)+\'px\';\r\n		get_dom(\'second_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'four_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'input_note_text\').value=pc_height+\'px\';\r\n		get_dom(\'third_side_right\').style.height=(pc_height-15)+\'px\';\r\n		get_dom(\'fifth_side_right\').style.height=(pc_height-15)+\'px\';\r\n	}\r\n	set_height();\r\n	window.onresize=function(){\r\n		set_height();//pengchuan\r\n	}\r\n	function get_dom(e){\r\n		return document.getElementById(e);\r\n	}\r\n	function set_height(){\r\n		var pc_height=window.innerHeight;\r\n		pc_height=pc_height-131;\r\n		get_dom(\'first_side_right\').style.height=(pc_height-31)+\'px\';\r\n		get_dom(\'second_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'four_side_right\').style.height=pc_height+\'px\';\r\n		get_dom(\'input_note_text\').value=pc_height+\'px\';\r\n		get_dom(\'third_side_right\').style.height=(pc_height-15)+\'px\';\r\n		get_dom(\'fifth_side_right\').style.height=(pc_height-15)+\'px\';\r\n	}\r\n	set_height();\r\n	window.onresize=function(){\r\n		set_height();//pengchuan\r\n	}\r\n&lt;/script&gt;\r\n								</pre>');
INSERT INTO `cn_note_activity` VALUES ('ffdf744f-0845-49bf-b7b3-81b3cd622cf9', 'fa8d3d9d-2de5-4cfe-845f-951041bcc461', '9187ffd3-4c1e-4768-9f2f-c600e835b823', '0', '0', '测试笔记——2', '');
INSERT INTO `cn_note_activity` VALUES ('sssssssssssssssssssssssssssssss', '1', 'ce997ee1-0adf-4d71-9be9-fe32807c34fb', '0', '0', 'ssssssssssssssssssssssssssss', 'ssssssssssssssssssssss');
INSERT INTO `cn_note_activity` VALUES ('wwwwwwwwwwwwwwwwwww', '1', 'ce997ee1-0adf-4d71-9be9-fe32807c34fb', '0', '0', '我勒个去', '我勒个去~~~~~');

-- ----------------------------
-- Table structure for `cn_note_status`
-- ----------------------------
DROP TABLE IF EXISTS `cn_note_status`;
CREATE TABLE `cn_note_status` (
  `cn_note_status_id` varchar(100) NOT NULL COMMENT '笔记状态ID',
  `cn_note_status_code` varchar(100) DEFAULT NULL COMMENT '笔记状态Code',
  `cn_note_status_name` varchar(500) DEFAULT NULL COMMENT '笔记状态名字',
  PRIMARY KEY (`cn_note_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cn_note_status
-- ----------------------------
INSERT INTO `cn_note_status` VALUES ('1', 'normal', 'normal');

-- ----------------------------
-- Table structure for `cn_note_type`
-- ----------------------------
DROP TABLE IF EXISTS `cn_note_type`;
CREATE TABLE `cn_note_type` (
  `cn_note_type_id` varchar(100) NOT NULL COMMENT '笔记本类型ID',
  `cn_note_type_code` varchar(100) DEFAULT NULL COMMENT '笔记本类型Code',
  `cn_note_type_name` varchar(500) DEFAULT NULL COMMENT '笔记本类型名称',
  `cn_note_type_desc` text COMMENT '笔记本类型说明',
  PRIMARY KEY (`cn_note_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cn_note_type
-- ----------------------------
INSERT INTO `cn_note_type` VALUES ('1', 'normal', 'normal', null);

-- ----------------------------
-- Table structure for `cn_share`
-- ----------------------------
DROP TABLE IF EXISTS `cn_share`;
CREATE TABLE `cn_share` (
  `cn_share_id` varchar(100) NOT NULL COMMENT '共享ID',
  `cn_share_title` varchar(500) DEFAULT NULL COMMENT '共享标题',
  `cn_share_body` text COMMENT '共享内容',
  `cn_note_id` varchar(100) DEFAULT NULL COMMENT '笔记id',
  PRIMARY KEY (`cn_share_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cn_share
-- ----------------------------
INSERT INTO `cn_share` VALUES ('009d6943-223e-450d-aa26-3aa25edfc8a4', '1——1', '<p>1——11——11——11——11——11——11——11——11——11——11——11——11——1</p>', 'e633e99d-c8dd-44f3-8d8e-5b0966e0927c');
INSERT INTO `cn_share` VALUES ('0a02ba3e-a74c-41b8-8494-01b2e3632f99', '1——1', '<p>1——11——11——11——11——11——11——11——11——11——11——11——11——1</p>', 'e633e99d-c8dd-44f3-8d8e-5b0966e0927c');
INSERT INTO `cn_share` VALUES ('0c031c50-0e95-42ea-8d20-f2f37ca056ef', 'dddd', '<p>阿斯顿发送到阿斯顿发撒旦法撒地方撒地方撒旦发斯蒂芬阿斯顿发撒旦法阿斯蒂芬飞东方撒地方撒地方阿斯顿发撒旦法撒地方阿斯顿发送到</p><p>sadfsadfasdfasd</p><p>的发生撒旦sa东方as东方as东方</p><p>撒地方</p><p>s撒地方</p><p>士大夫</p><p>阿斯蒂芬asd飞asdf</p><p>撒旦f爱上d撒</p><p>撒地方</p><p>撒地方</p><p>阿斯蒂芬</p><p>阿斯蒂芬</p><p>撒地方</p><p>爱上d撒地方</p><p>阿斯蒂芬</p><p>阿萨德f阿萨德f爱上阿斯蒂芬</p><p>撒旦</p><p>爱上</p><p>阿萨德f阿萨德</p><p>阿斯蒂芬</p><p><br/></p>', 'b4f82f9f-bc0f-480a-b8f2-335164d69945');
INSERT INTO `cn_share` VALUES ('0d9b9856-23c5-44a7-ab1f-d444abae17a2', '29', '', 'a9c3f332-9e0b-44f2-9390-e4897806be04');
INSERT INTO `cn_share` VALUES ('0e3e2ae0-eb50-4044-b422-e713f5a5272b', '32', '', '1db4a1d8-76cc-46bb-9e30-9e67f0932530');
INSERT INTO `cn_share` VALUES ('1290dce6-d7f8-4418-b417-99f1a1f42b7b', '25', '', '1153295f-d1a5-4a39-b794-980633bdc3d8');
INSERT INTO `cn_share` VALUES ('186a5ab3-5be7-4fb1-8378-3432cf774edb', 'dddd', '<p>阿斯顿发送到阿斯顿发撒旦法撒地方撒地方撒旦发斯蒂芬阿斯顿发撒旦法阿斯蒂芬飞东方撒地方撒地方阿斯顿发撒旦法撒地方阿斯顿发送到</p><p>sadfsadfasdfasd</p><p>的发生撒旦sa东方as东方as东方</p><p>撒地方</p><p>s撒地方</p><p>士大夫</p><p>阿斯蒂芬asd飞asdf</p><p>撒旦f爱上d撒</p><p>撒地方</p><p>撒地方</p><p>阿斯蒂芬</p><p>阿斯蒂芬</p><p>撒地方</p><p>爱上d撒地方</p><p>阿斯蒂芬</p><p>阿萨德f阿萨德f爱上阿斯蒂芬</p><p>撒旦</p><p>爱上</p><p>阿萨德f阿萨德</p><p>阿斯蒂芬</p><p><br/></p>', 'b4f82f9f-bc0f-480a-b8f2-335164d69945');
INSERT INTO `cn_share` VALUES ('1d27fddd-415a-4745-9dcf-01fdda3b67cf', '笔记2——1', '<p>笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1</p><p>笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1笔记2——1</p>', '80e0f021-c826-4529-b2f2-a550f6d56ed7');
INSERT INTO `cn_share` VALUES ('1ed41d3e-23f6-4e77-905a-f577e5809c6e', '30', '', '7c547246-4fdb-4d29-93b6-8507ce04c81b');
INSERT INTO `cn_share` VALUES ('1f566f6f-6a63-48ea-a46b-c4a859bf5de8', '安装笔记', '<p>首先配置环境~<br/></p>', 'd3ded3ca-4e79-48fd-a501-ea4df79936c1');
INSERT INTO `cn_share` VALUES ('2233a28f-074f-46fe-ab22-a4cbd7879418', '3', '', 'e410fc11-0fe3-44b4-9972-347279a46cc2');
INSERT INTO `cn_share` VALUES ('271e6e19-26db-44e1-b76b-88bf43d8b8bb', '啊啊啊啊', '<p>灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌</p><p>灌灌灌灌灌灌灌过嘎嘎嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎嘎嘎嘎嘎个灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌嘎嘎灌灌灌灌灌灌灌灌灌灌</p><p>阿萨德飞洒地方撒的发生大撒地方盛大撒旦阿斯蒂芬撒的发生大阿斯蒂芬阿萨德阿斯蒂芬阿萨德阿斯蒂芬阿斯蒂芬撒地方阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬<br/></p>', 'c347f832-e2b2-4cb7-af6f-6710241bcdf6');
INSERT INTO `cn_share` VALUES ('2a144ad2-cda8-4994-a2f2-bf7f1924d5db', '24', '', 'f2e28f90-7862-467b-a17e-31fcd9f7147b');
INSERT INTO `cn_share` VALUES ('2c1733e4-d230-4d5d-917c-c02bc1aa1492', '9', '', '3238f91d-3be7-41d6-acd3-62d0b905203f');
INSERT INTO `cn_share` VALUES ('3042bbc5-ca6d-4f7b-b3a8-975adce7fca1', '22', '', '8d18aaf6-9238-46dc-9c03-988d733790cf');
INSERT INTO `cn_share` VALUES ('30b0d1bb-55a4-4f1b-aa14-55866a27b8fd', '34', '', '864fe9cb-7d46-4481-a8a0-93e6ec5a0ca7');
INSERT INTO `cn_share` VALUES ('31d77a69-d52b-462f-9f0e-eea8798e9df0', '8', '', 'a1211435-9bdc-41a1-89a8-d69e5e60873d');
INSERT INTO `cn_share` VALUES ('384e2f5e-62f8-4ccd-b8dc-800f36d77f0e', '13', '', '446fb256-611e-4c1e-884a-32f62896139a');
INSERT INTO `cn_share` VALUES ('483a9119-462c-453c-9241-8de1a3bc1287', '26', '', '43da4a7b-0f3f-4f3b-97c4-cc522b585375');
INSERT INTO `cn_share` VALUES ('53c5d6d9-fc93-4aee-acb8-86e41e22cfc7', 'wsf1', '<p>wsf<br/></p>', '051538a6-0f8e-472c-8765-251a795bc88f');
INSERT INTO `cn_share` VALUES ('577eea44-2125-4e39-b4bc-60c88eafb0bf', '20', '', '52f05a14-b88d-4a70-8166-991d9b663854');
INSERT INTO `cn_share` VALUES ('58206ff7-9054-4adb-962e-48d98ad82cb5', '测试参加活动——11111111111', '', '7cc685b4-1b0b-4900-8511-f948aa2c2e28');
INSERT INTO `cn_share` VALUES ('58a1d7bd-0c16-4e50-9534-06b3b299e2fb', '1——4', '<p>测试</p><p>1——4</p><p>1——4</p><p>1——4</p><p>1——4</p><p>1——4</p><p>1——4<br/></p>', '07305c91-d9fa-420d-af09-c3ff209608ff');
INSERT INTO `cn_share` VALUES ('5b23fcfd-55b4-4c7d-ba0b-11463838b737', '1——5', '<p>1——5</p><p>1——5</p><p>1——5</p><p>1——5</p><p>1——5</p><p>1——5</p><p><br/></p>', '5565bda4-ddee-4f87-844e-2ba83aa4925f');
INSERT INTO `cn_share` VALUES ('5bb4d1b1-623e-442b-8491-3ed6b9a8e89c', '14', '', '7f46f26d-c999-487f-ba57-09300ea9c961');
INSERT INTO `cn_share` VALUES ('5ced12ea-3e84-4ec6-b60a-56caa11f6658', '19', '', '0a233251-8991-493c-87c8-d36e9433eae3');
INSERT INTO `cn_share` VALUES ('607cacae-1b5c-41ca-9a60-5c0f5d170385', '16', '', 'a0eda0b9-7cab-4fd3-b707-33faf074001f');
INSERT INTO `cn_share` VALUES ('671a1a8a-052e-49dd-a400-18e9cf5d8271', '安装笔记', '<p>首先配置环境~<br/></p>', 'd3ded3ca-4e79-48fd-a501-ea4df79936c1');
INSERT INTO `cn_share` VALUES ('6b33394c-17f9-4205-9424-d016ec663454', '1——3', '<p>1——3</p><p>1——3</p><p>1——3</p><p>1——3</p><p>1——3</p><p>1——3</p><p>1——3</p><p>1——3</p><p>1——3</p><p>1——3</p><p>1——3</p><p>1——3</p><p><br/></p>', '19fbb55b-0541-433b-a7cd-dba52220a447');
INSERT INTO `cn_share` VALUES ('6eb03bff-fb99-4c29-b9bd-18cafef0266f', '18', '', '69ccf926-2b95-487c-8aa4-9c65bd094a75');
INSERT INTO `cn_share` VALUES ('6ef19a79-188c-44a6-93fb-2fbde3a7c7b7', '17', '', '7e4affa2-8cd5-4ba0-abda-751605999507');
INSERT INTO `cn_share` VALUES ('7bd78bc9-bae0-4665-aa03-f1d24f9337da', '4', '', '6d6f5a2a-a09c-4410-be41-10906c5a59e6');
INSERT INTO `cn_share` VALUES ('7c1d010c-9644-4baa-ad77-f53a9e816c24', '21', '', '3651f802-aac2-4337-b700-68857c2cb04c');
INSERT INTO `cn_share` VALUES ('7f8ef845-e668-4aa4-bd11-7082765a9ea9', '31', '', '5c59bc2d-6e7d-4ad9-b0e1-1a871ee8694d');
INSERT INTO `cn_share` VALUES ('83ad2c1a-aff5-4702-b35d-58705dddabb3', '23', '', 'd45c0f17-5a6e-4d6c-ba31-701017ca0753');
INSERT INTO `cn_share` VALUES ('899e18bc-4ba9-485f-9d29-963ee6ebc770', '周佳note', '<p>阿斯顿撒旦法撒旦撒旦撒地方</p><p>阿斯蒂芬阿斯蒂芬as阿斯蒂芬</p><p>sadf爱上</p><p>士大夫</p><p>sadf asd飞as的fsd飞as东方</p><p>阿斯蒂芬</p><p>阿斯蒂芬<br/></p>', '53d1b3ed-59a1-4715-a7b2-9027b0d551e0');
INSERT INTO `cn_share` VALUES ('8c6e4ba3-2a41-47b4-9d2a-64da4a146476', '1——1', '<p>1——11——11——11——11——11——11——11——11——11——11——11——11——1</p>', 'e633e99d-c8dd-44f3-8d8e-5b0966e0927c');
INSERT INTO `cn_share` VALUES ('8ee69ab9-9af9-47ce-8ce2-9561f78e0949', '7', '', '5efc0d6a-1fe3-45d5-863f-618d403a6d7f');
INSERT INTO `cn_share` VALUES ('95f31c0f-91ad-44d6-bd67-066ca452e014', '27', '', 'c141800f-a8f5-4350-a7d3-f67bb93dc67a');
INSERT INTO `cn_share` VALUES ('96527b27-d113-4aa7-91ec-625a7a86839d', '15', '', '9860f9f4-3922-47db-a350-f8948fb852e8');
INSERT INTO `cn_share` VALUES ('99fa2a02-e965-407b-9b46-6f44eec52337', '测试收藏活动笔记——1', '<p>测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1测试收藏活动笔记——1</p>', '326f17e8-ff04-4a79-b33b-ae4bb3bb5f1b');
INSERT INTO `cn_share` VALUES ('9a4bafd3-b6ec-434f-bd03-454d48d25102', '3', '', 'e410fc11-0fe3-44b4-9972-347279a46cc2');
INSERT INTO `cn_share` VALUES ('9d7a7a99-d2fd-4f72-ae93-09a3609dcd4f', '33', '', 'db29d725-34b4-480d-8d26-8438b81d4c0d');
INSERT INTO `cn_share` VALUES ('ab16e4d0-a7ee-4a04-83c9-95314d0b13c5', '1', '<p>11111<br/></p>', '42a84ff7-198e-4c73-abdc-95f0fdc718f8');
INSERT INTO `cn_share` VALUES ('afef156c-82c3-4f9b-a0c7-27dc5fa37435', '1——1', '<p>1——11——11——11——11——11——11——11——11——11——11——11——11——1</p>', 'e633e99d-c8dd-44f3-8d8e-5b0966e0927c');
INSERT INTO `cn_share` VALUES ('b75083e9-e7c3-4f7c-a52c-24c6b72fe5f0', '11', '', 'f74d03aa-d01d-4989-95e8-4757d6ca8a2a');
INSERT INTO `cn_share` VALUES ('bf0a0f7a-1b8f-40d8-a260-151a928ed330', '周佳1111', '<p>啊水井坊绿卡圣诞节法拉盛简单了咖啡机卡拉斯的了发生发了束带结发阿斯蒂芬</p><p>SD卡反击asflsakd拉斯加发斯蒂芬</p><p>asfsda飞阿斯蒂芬</p><p>阿斯蒂芬</p><p>阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬as的阿斯蒂芬<br/></p>', 'b6f39eed-7d6f-42a5-af4f-53b3a1d12451');
INSERT INTO `cn_share` VALUES ('c773453b-b335-45a3-a0ec-ed0eb290b5e5', '2', '', 'e42e03b3-287d-4a44-95fa-498eca565a35');
INSERT INTO `cn_share` VALUES ('c9e56985-70b4-4f3c-be21-5c258950d020', '12', '', 'a8796896-7b1d-484f-9c3a-2b2616c4dfc3');
INSERT INTO `cn_share` VALUES ('d7ee4ee4-dc06-4b40-961e-4b7ff1985611', '10', '', 'd9fccea0-4abd-47de-a3e7-9b9a047bb7ca');
INSERT INTO `cn_share` VALUES ('e0200450-0b11-43d2-a599-fca43b6803e5', '28', '', '71543875-249a-48a3-8e85-e23f543fcf60');
INSERT INTO `cn_share` VALUES ('e26120e4-85f1-4ef8-bfda-e87b0a0b4386', '阿萨德', '<p>切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切去切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切切去切切切切切切切切切切去去去去去去起起切切切切切切切切切切切切切切切切切切切切切起起切切切切切切切切切切切切切切切切切切切切切切切切切切切切切去前切切切切切切切切切切切切切切切切切切切切切切切切切去起起切切切切切切切切切切切切切切切切切切切切切去去&nbsp;&nbsp;&nbsp;&nbsp; 切切切切切切切切切切切切切切切切切切切哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇哇<br/></p>', '2f85e280-60c6-41a8-a1c3-e27df98dc7fd');
INSERT INTO `cn_share` VALUES ('e900f87b-106c-409f-bfb0-efa69f59a3a8', '6', '', 'e361d00f-e9e2-457a-bd1a-8b7d60e96c74');
INSERT INTO `cn_share` VALUES ('fa79c413-8c5d-478a-9c49-465be836c253', '1——1', '<p>1——11——11——11——11——11——11——11——11——11——11——11——11——1</p>', 'e633e99d-c8dd-44f3-8d8e-5b0966e0927c');
INSERT INTO `cn_share` VALUES ('fd015d5d-e13e-429b-8a7c-d099a074e7da', '5', '', '4e26ba27-7d01-4dd0-8ca5-cd679beaffb5');

-- ----------------------------
-- Table structure for `cn_user`
-- ----------------------------
DROP TABLE IF EXISTS `cn_user`;
CREATE TABLE `cn_user` (
  `cn_user_id` varchar(100) NOT NULL COMMENT '用户ID',
  `cn_user_name` varchar(100) DEFAULT NULL COMMENT '用户名',
  `cn_user_password` varchar(100) DEFAULT NULL COMMENT '密码',
  `cn_user_token` varchar(100) DEFAULT NULL COMMENT '令牌',
  `cn_user_desc` text COMMENT '说明',
  PRIMARY KEY (`cn_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cn_user
-- ----------------------------
INSERT INTO `cn_user` VALUES ('03590914-a934-4da9-ba4d-b41799f917d1', 'zhouj', '55587a910882016321201e6ebbc9f595', null, null);
INSERT INTO `cn_user` VALUES ('2273f742-61ec-4440-b88a-42cf48db19ff', 'zhoujia123', '4297f44b13955235245b2497399d7a93', null, null);
INSERT INTO `cn_user` VALUES ('333c6d0b-e4a2-4596-9902-a5d98c2f665a', 'test1', '96e79218965eb72c92a549dd5a330112', null, null);
INSERT INTO `cn_user` VALUES ('39295a3d-cc9b-42b4-b206-a2e7fab7e77c', 'zhoujia', '4297f44b13955235245b2497399d7a93', null, null);
INSERT INTO `cn_user` VALUES ('48595f52-b22c-4485-9244-f4004255b972', 'demo', 'c8837b23ff8aaa8a2dde915473ce0991', null, null);
INSERT INTO `cn_user` VALUES ('524f7440-7283-4b2d-8af5-4a67570e892e', 'pc', 'e10adc3949ba59abbe56e057f20f883e', null, null);
INSERT INTO `cn_user` VALUES ('52f9b276-38ee-447f-a3aa-0d54e7a736e4', 'wsf', '6e7d70ed3edfb80421235af5c4ad24aa', null, null);
INSERT INTO `cn_user` VALUES ('6f339f0a-2068-4db1-8fef-8e68f444c72c', 'saipi', '4297f44b13955235245b2497399d7a93', null, null);
INSERT INTO `cn_user` VALUES ('974375a8-8557-4308-bd36-9455c7863239', 'zhoujia1231', '6a204bd89f3c8348afd5c77c717a097a', null, null);
INSERT INTO `cn_user` VALUES ('bf9d2885-f34e-4c78-9ae5-2723f62aa2b5', 'saipi', '4297f44b13955235245b2497399d7a93', null, null);
INSERT INTO `cn_user` VALUES ('ea09d9b1-ede7-4bd8-b43d-a546680df00b', 'yht', '96e79218965eb72c92a549dd5a330112', null, null);
