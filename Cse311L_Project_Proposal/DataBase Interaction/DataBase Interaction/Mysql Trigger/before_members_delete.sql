CREATE TRIGGER `before_members_delete` BEFORE DELETE ON `members`
 FOR EACH ROW BEGIN
      
INSERT INTO members_log (`member_id`, `name`, `weight`, `joining_date`, `end_of_membership`, `membership_id`, `user_id`, `picture`) VALUES
(old.`member_id`, old.`name`, old.`weight`, old.`joining_date`, old.`end_of_membership`, old.`membership_id`, old.`user_id`, old.`picture`);
           
       END