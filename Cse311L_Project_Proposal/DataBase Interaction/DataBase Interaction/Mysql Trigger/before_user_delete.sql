CREATE TRIGGER `before_user_delete` BEFORE DELETE ON `users`
 FOR EACH ROW BEGIN
  INSERT INTO users_log (`user_id`, `fname`, `lame`, `gender`, `age`, `username`, `password`, `address`, `phone_num`) VALUES
(old.user_id, old.fname, old.lame, old.gender, old.age,old.username, old.password, old.address, old.phone_num);
  
   END