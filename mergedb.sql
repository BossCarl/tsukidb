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
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `userID` bigint DEFAULT NULL,
  `course_id` bigint DEFAULT NULL,
  `enrollment_id` bigint DEFAULT NULL,
  `target_score` bigint DEFAULT NULL,
  PRIMARY KEY (`quizid`),
  KEY `enrollment_id` (`enrollment_id`),
  KEY `userID` (`userID`),
  KEY `target_score` (`target_score`),
  CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollment` (`enrollmentid`),
  CONSTRAINT `quiz_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userid`),
  CONSTRAINT `quiz_ibfk_3` FOREIGN KEY (`target_score`) REFERENCES `instructor` (`instructorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `quiz_taken` (
  `quiztknid` bigint NOT NULL AUTO_INCREMENT,
  `quiz_score` bigint DEFAULT NULL,
  `quiz_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`quiztknid`),
  KEY `user_id` (`user_id`),
  KEY `quiz_score` (`quiz_score`),
  CONSTRAINT `quiz_taken_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`userid`),
  CONSTRAINT `quiz_taken_ibfk_2` FOREIGN KEY (`quiz_score`) REFERENCES `quizscores` (`quizid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `quizquestions` (
  `questionid` bigint NOT NULL AUTO_INCREMENT,
  `quiz_id` bigint DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `choice1` varchar(255) DEFAULT NULL,
  `choice2` varchar(255) DEFAULT NULL,
  `choice3` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `instructorID` bigint DEFAULT NULL,
  PRIMARY KEY (`questionid`),
  KEY `quiz_id` (`quiz_id`),
  KEY `instructorID` (`instructorID`),
  CONSTRAINT `quizquestions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quizid`),
  CONSTRAINT `quizquestions_ibfk_2` FOREIGN KEY (`instructorID`) REFERENCES `instructor` (`instructorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `quizscores` (
  `quizid` bigint NOT NULL AUTO_INCREMENT,
  `quiz_1` bigint DEFAULT NULL,
  `quiz_2` bigint DEFAULT NULL,
  `quiz_3` bigint DEFAULT NULL,
  `final_exam` bigint DEFAULT NULL,
  `enrollmentid` bigint DEFAULT NULL,
  `questionid` bigint DEFAULT NULL,
  PRIMARY KEY (`quizid`),
  KEY `questionid` (`questionid`),
  KEY `enrollmentid` (`enrollmentid`),
  CONSTRAINT `quizscores_ibfk_1` FOREIGN KEY (`questionid`) REFERENCES `quizquestions` (`questionid`),
  CONSTRAINT `quizscores_ibfk_2` FOREIGN KEY (`enrollmentid`) REFERENCES `enrollment` (`enrollmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `support` (
  `supportid` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`supportid`)
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


