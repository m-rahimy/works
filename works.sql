--
-- Table structure for table `contribution`
--

CREATE TABLE `contribution` (
  `project_id` int(10) NOT NULL,
  `developer_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `is_main` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `Developer`
--

CREATE TABLE `Developer` (
  `full_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `nick_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture_address` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'shadow.png',
  `profession` text COLLATE utf8_unicode_ci,
  `single_cv_file` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `story` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `Implementation`
--

CREATE TABLE `Implementation` (
  `project_id` int(10) NOT NULL,
  `tech_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `picture`
--

CREATE TABLE `picture` (
  `picture_id` int(10) NOT NULL,
  `picture_address` text COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `project_id` int(10) NOT NULL,
  `project_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `project_date` date DEFAULT NULL,
  `english_description` text COLLATE utf8_unicode_ci,
  `persian_description` text COLLATE utf8_unicode_ci,
  `progress_percent` int(11) NOT NULL DEFAULT '0',
  `tutorial_url` text COLLATE utf8_unicode_ci,
  `github_url` text COLLATE utf8_unicode_ci,
  `download_url` text COLLATE utf8_unicode_ci,
  `is_showable` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `socializing`
--

CREATE TABLE `socializing` (
  `id` int(5) NOT NULL,
  `developer_full_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `social_media` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `social_media_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `Socials`
--

CREATE TABLE `Socials` (
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `base_url` text COLLATE utf8_unicode_ci NOT NULL,
  `fa_icon_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Socials`
--

INSERT INTO `Socials` (`name`, `base_url`, `fa_icon_name`) VALUES
('facebook', 'http://www.facebook.com/', 'fa-facebook'),
('github', 'https://github.com/', 'fa-github'),
('google plus', 'https://plus.google.com/', 'fa-google-plus'),
('instagram', 'https://www.instagram.com/', 'fa-instagram'),
('linkedin', 'https://www.linkedin.com/in/', 'fa-linkedin'),
('twitter', 'https://twitter.com/', 'fa-twitter');

--
-- Table structure for table `tagging`
--

CREATE TABLE `tagging` (
  `project_id` int(10) NOT NULL,
  `tag_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `is_important` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tag_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tag_name`, `url`) VALUES
('ai', '0'),
('android', 'http://developer.android.com/'),
('application', '0'),
('arduino', '0'),
('bukkit', 'http://bukkit.org'),
('cafebazaar', 'https://cafebazaar.ir'),
('desktop', '0'),
('game', '0'),
('handheld', '0'),
('relational database', 'https://en.wikipedia.org/wiki/Relational_database'),
('webapp', '0');

--
-- Table structure for table `technology`
--

CREATE TABLE `technology` (
  `tech_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `technology`
--

INSERT INTO `technology` (`tech_name`, `url`) VALUES
('bootstrap', NULL),
('c', NULL),
('c++', NULL),
('code igniter', NULL),
('GPIO', 'https://en.wikipedia.org/wiki/General-purpose_input/output'),
('html5Canvas', NULL),
('java', 'https://www.java.com'),
('javafx', 'docs.oracle.com/javafx'),
('javascript', NULL),
('maven', NULL),
('mysql', NULL),
('php', NULL),
('python', NULL),
('raspberry pi', 'https://www.raspberrypi.org'),
('sensor modules', NULL),
('sk89q', 'http://sk89q.com'),
('sqlite', NULL),
('xephi', 'http://xephi.fr');

--
-- Indexes for table `contribution`
--
ALTER TABLE `contribution`
  ADD PRIMARY KEY (`project_id`,`developer_name`),
  ADD KEY `fk_contrib_developer` (`developer_name`);

--
-- Indexes for table `Developer`
--
ALTER TABLE `Developer`
  ADD PRIMARY KEY (`full_name`);

--
-- Indexes for table `Implementation`
--
ALTER TABLE `Implementation`
  ADD PRIMARY KEY (`project_id`,`tech_name`),
  ADD KEY `fk_imp_tech_name` (`tech_name`);

--
-- Indexes for table `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`picture_id`,`project_id`) USING BTREE,
  ADD KEY `fk_project_id` (`project_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`project_id`);

--
-- Indexes for table `socializing`
--
ALTER TABLE `socializing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dev_name` (`developer_full_name`),
  ADD KEY `fk_social` (`social_media`);

--
-- Indexes for table `Socials`
--
ALTER TABLE `Socials`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `tagging`
--
ALTER TABLE `tagging`
  ADD PRIMARY KEY (`project_id`,`tag_name`),
  ADD KEY `fk_tagging_tag_name` (`tag_name`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_name`) USING BTREE;

--
-- Indexes for table `technology`
--
ALTER TABLE `technology`
  ADD PRIMARY KEY (`tech_name`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `picture`
--
ALTER TABLE `picture`
  MODIFY `picture_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `project_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `socializing`
--
ALTER TABLE `socializing`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contribution`
--
ALTER TABLE `contribution`
  ADD CONSTRAINT `fk_contrib_developer` FOREIGN KEY (`developer_name`) REFERENCES `Developer` (`full_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_contrib_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Implementation`
--
ALTER TABLE `Implementation`
  ADD CONSTRAINT `fk_imp_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  ADD CONSTRAINT `fk_imp_tech_name` FOREIGN KEY (`tech_name`) REFERENCES `technology` (`tech_name`);

--
-- Constraints for table `picture`
--
ALTER TABLE `picture`
  ADD CONSTRAINT `fk_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`);

--
-- Constraints for table `socializing`
--
ALTER TABLE `socializing`
  ADD CONSTRAINT `fk_dev_name` FOREIGN KEY (`developer_full_name`) REFERENCES `Developer` (`full_name`),
  ADD CONSTRAINT `fk_social` FOREIGN KEY (`social_media`) REFERENCES `Socials` (`name`);

--
-- Constraints for table `tagging`
--
ALTER TABLE `tagging`
  ADD CONSTRAINT `fk_tagging_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  ADD CONSTRAINT `fk_tagging_tag_name` FOREIGN KEY (`tag_name`) REFERENCES `tags` (`tag_name`);
COMMIT;
