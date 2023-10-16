drop database thesisdb;
CREATE DATABASE  IF NOT EXISTS thesisdb;
USE thesisdb;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;


CREATE TABLE users (
  id int NOT NULL AUTO_INCREMENT,
  user_name text DEFAULT NULL,
  password text DEFAULT NULL,
  role text DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

create table professors (
    id int not null AUTO_INCREMENT,
    full_name text,
    specialty text,
    user_id int,
    help_user_id int,
    primary key(id),
    foreign key(user_id) references users(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


create table students (
    id int not null AUTO_INCREMENT,
    full_name text,
    year_of_studies int,
    average_grade double,
    number_of_remaining_courses int,
    user_id int,
    primary key(id),
    foreign key(user_id) references users(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

create table subjects (
    id int not null AUTO_INCREMENT,
    title text,
    objectives text,
    professor_id int,
    primary key(id),
    foreign key(professor_id) references professors(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

create table thesis (
    id int not null AUTO_INCREMENT,
    student_id int,
    professor_id int,
    subject_id int,
    implementation_grade float,
    presentation_grade float,
    report_grade float,
    total_grade float,
    primary key(id),
    foreign key(professor_id) references professors(id),
    foreign key(student_id) references students(id),
    foreign key(subject_id) references subjects(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;




create table applications (
    id int not null AUTO_INCREMENT,
    student_id int,
    subject_id int,
    primary key(id),
    foreign key(subject_id) references subjects(id),
    foreign key(student_id) references students(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
