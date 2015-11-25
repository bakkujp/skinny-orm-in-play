create table user (
  id int not null AUTO_INCREMENT PRIMARY KEY ,
  name varchar(20) not null,
  description text,
  created_at timestamp not null default current_timestamp
);

create table tweet (
  id int not null AUTO_INCREMENT PRIMARY KEY ,
  user_id int not null references user(id),
  text text not null,
  created_at timestamp not null default current_timestamp
);

create table email (
  id int not null AUTO_INCREMENT PRIMARY KEY ,
  email varchar(20) not null,
  created_at timestamp not null default current_timestamp
);

create table account (
  id int not null AUTO_INCREMENT PRIMARY KEY ,
  name varchar(20) not null,
  created_at timestamp not null default current_timestamp
);

create table account_email (
  account_id int not null,
  email_id int not null
);

INSERT INTO email (id, email) VALUES (1, "bachpt@gmail.com");
INSERT INTO email (id, email) VALUES (2, "fluffbaby@yahoo.com");
INSERT INTO account (id, name) VALUES (1, "bachpt");
INSERT INTO account (id, name) VALUES (2, "fluff");
INSERT INTO account_email (account_id, email_id) VALUES (1, 1);
INSERT INTO account_email (account_id, email_id) VALUES (1, 2);
INSERT INTO account_email (account_id, email_id) VALUES (2, 1);
INSERT INTO account_email (account_id, email_id) VALUES (2, 2);




