select * from "fan";

desc "fan";

alter table "fan" add(fan_name varchar2(50) not null);

ALTER TABLE "fan" RENAME COLUMN fan_name TO "fan_name";

commit;

select * from "fan" where fan_id = 'hongg';