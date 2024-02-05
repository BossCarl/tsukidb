CREATE TABLE `certification` (
  `certificateid` bigint NOT NULL AUTO_INCREMENT,
  `certificate_file` varchar(255) DEFAULT NULL,
  `criteria` varchar(255) DEFAULT NULL,
  `date_issued` date DEFAULT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `quiztkn_id` bigint DEFAULT NULL,
  PRIMARY KEY (`certificateid`),
  KEY `quiztkn_id` (`quiztkn_id`),
  CONSTRAINT `certification_ibfk_1` FOREIGN KEY (`quiztkn_id`) REFERENCES `quiz_taken` (`quiztknid`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `course` (
  `courseid` bigint NOT NULL AUTO_INCREMENT,
  `criteria` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `instructor_id` bigint DEFAULT NULL,
  PRIMARY KEY (`courseid`),
  KEY `FKqk2yq2yk124dhlsilomy36qr9` (`instructor_id`),
  CONSTRAINT `FKqk2yq2yk124dhlsilomy36qr9` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`instructorid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `enrollment` (
  `enrollmentid` bigint NOT NULL AUTO_INCREMENT,
  `cancellation_reason` varchar(255) DEFAULT NULL,
  `cancelled` varchar(255) DEFAULT NULL,
  `enrollment_date` date DEFAULT NULL,
  `course_id` bigint DEFAULT NULL,
  `support_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`enrollmentid`),
  KEY `FKbhhcqkw1px6yljqg92m0sh2gt` (`course_id`),
  KEY `FKmy1hnpppxotxu770v1lktqc5d` (`support_id`),
  KEY `FK4x08no2mpupkr616h50w3aksx` (`user_id`),
  CONSTRAINT `FK4x08no2mpupkr616h50w3aksx` FOREIGN KEY (`user_id`) REFERENCES `users` (`userid`),
  CONSTRAINT `FKbhhcqkw1px6yljqg92m0sh2gt` FOREIGN KEY (`course_id`) REFERENCES `course` (`courseid`),
  CONSTRAINT `FKmy1hnpppxotxu770v1lktqc5d` FOREIGN KEY (`support_id`) REFERENCES `support` (`supportid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `instructor` (
  `instructorid` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`instructorid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `quiz` (
  `quizid` bigint NOT NULL AUTO_INCREMENT,
  `quiz_title` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `quiz_score` bigint DEFAULT NULL,
  `quiz_published` bigint DEFAULT NULL,
  `quiz_created_at` date DEFAULT NULL,
  `quiz_updated_at` date DEFAULT NULL,
  `quiz_published_at` date DEFAULT NULL,
  `quiz_start_time` date DEFAULT NULL,
  `quiz_end_time` date DEFAULT NULL,
  `quiz_content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`quizid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `quiz_meta` (
  `quiz_metaid` bigint NOT NULL AUTO_INCREMENT,
  `quizmeta_id` bigint DEFAULT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`quiz_metaid`),
  KEY `quizmeta_id` (`quizmeta_id`),
  CONSTRAINT `quiz_meta_ibfk_1` FOREIGN KEY (`quizmeta_id`) REFERENCES `quiz` (`quizid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `quiz_taken` (
  `quiztknid` bigint NOT NULL AUTO_INCREMENT,
  `quiz_score` bigint DEFAULT NULL,
  `quiz_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`quiztknid`),
  KEY `user_id` (`user_id`),
  KEY `quiz_taken_ibfk_2_idx` (`quiz_score`),
  CONSTRAINT `quiz_taken_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`userid`),
  CONSTRAINT `quiz_taken_ibfk_2` FOREIGN KEY (`quiz_score`) REFERENCES `take` (`takeid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `quizanswer` (
  `quizanswerid` bigint NOT NULL AUTO_INCREMENT,
  `quizanswer_id` bigint DEFAULT NULL,
  `questionanswer_id` bigint DEFAULT NULL,
  `answer_correct` varchar(255) DEFAULT NULL,
  `answer_created_at` date DEFAULT NULL,
  `answer_updated_at` date DEFAULT NULL,
  `answer_content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`quizanswerid`),
  KEY `quizanswer_id` (`quizanswer_id`),
  KEY `questionanswer_id` (`questionanswer_id`),
  CONSTRAINT `quizanswer_ibfk_1` FOREIGN KEY (`quizanswer_id`) REFERENCES `quiz` (`quizid`),
  CONSTRAINT `quizanswer_ibfk_2` FOREIGN KEY (`questionanswer_id`) REFERENCES `quizquestion` (`questionid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `quizquestion` (
  `questionid` bigint NOT NULL AUTO_INCREMENT,
  `quizquestion_id` bigint DEFAULT NULL,
  `quiz_topic` varchar(255) DEFAULT NULL,
  `question_created_at` date DEFAULT NULL,
  `question_updated_at` date DEFAULT NULL,
  `question_content` varchar(255) DEFAULT NULL,
  `quiz1_score` bigint DEFAULT NULL,
  `quiz2_score` bigint DEFAULT NULL,
  `quiz3_score` bigint DEFAULT NULL,
  PRIMARY KEY (`questionid`),
  KEY `quizquestion_id` (`quizquestion_id`),
  CONSTRAINT `quizquestion_ibfk_1` FOREIGN KEY (`quizquestion_id`) REFERENCES `quiz` (`quizid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `support` (
  `supportid` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`supportid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `take` (
  `takeid` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `takequiz_id` bigint DEFAULT NULL,
  `take_status` smallint DEFAULT NULL,
  `take_score` smallint DEFAULT NULL,
  `take_published` tinyint DEFAULT NULL,
  `take_created_at` date DEFAULT NULL,
  `take_updated_at` date DEFAULT NULL,
  `take_started_at` date DEFAULT NULL,
  `take_finished_at` date DEFAULT NULL,
  `take_content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`takeid`),
  KEY `takequiz_id` (`takequiz_id`),
  CONSTRAINT `take_ibfk_1` FOREIGN KEY (`takequiz_id`) REFERENCES `quiz` (`quizid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `takeanswer` (
  `takeanswerid` bigint NOT NULL AUTO_INCREMENT,
  `taketake_id` bigint DEFAULT NULL,
  `takequestion_id` bigint DEFAULT NULL,
  `takeanswer_id` bigint DEFAULT NULL,
  `take_created_at` date DEFAULT NULL,
  `take_updated_at` date DEFAULT NULL,
  PRIMARY KEY (`takeanswerid`),
  KEY `takeanswer_id` (`takeanswer_id`),
  KEY `takequestion_id` (`takequestion_id`),
  KEY `taketake_id` (`taketake_id`),
  CONSTRAINT `takeanswer_ibfk_1` FOREIGN KEY (`takeanswer_id`) REFERENCES `quizanswer` (`quizanswerid`),
  CONSTRAINT `takeanswer_ibfk_2` FOREIGN KEY (`takequestion_id`) REFERENCES `quizquestion` (`questionid`),
  CONSTRAINT `takeanswer_ibfk_3` FOREIGN KEY (`taketake_id`) REFERENCES `take` (`takeid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `userid` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
