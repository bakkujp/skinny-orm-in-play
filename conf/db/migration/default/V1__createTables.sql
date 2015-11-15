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


