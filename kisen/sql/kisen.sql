
desc fan;

select * from agency;
select * from manager;

alter table "fan" add(fan_name varchar2(50) not null);

alter table "fan" add("enabled" number);

alter table fan drop column "grade";

select * from authority;

ALTER TABLE "agency" RENAME COLUMN "agency_no" TO agency_no;

select * from "authority";
alter TABLE "authority" rename to authority;

commit;

insert into team_point values(13, 'yellowTube', 122, 1100, sysdate, 18);
insert into team_point values(14, 'yellowFrodo', 122, 1100, sysdate, 18);
insert into team_point values(15, 'yellowAppeach', 122, 1100, sysdate, 18);
insert into team_point values(16, 'yellowMuzi', 122, 3000, sysdate, 18);
insert into team_point values(17, 'yellowRyan', 122, 1200, sysdate, 18);
insert into team_point values(18, 'yellowbanana', 122, 4100, sysdate, 18);
insert into team_point values(19, 'yellow', 122, 500, sysdate, 18);
insert into team_point values(20, 'white', 122, 1900, sysdate, 18);
insert into team_point values(21, 'black', 122, 1700, sysdate, 18);
insert into team_point values(22, 'eco03', 122, 1200, sysdate, 18);

-- 회원가입 - 최신 fan_no조회
select f.*
from (
    select "fan_no"
    from "fan"
    order by "enroll_date" desc
    ) f
where rownum = 1;

select * from fan;
select * from agency;
select * from manager;
select * from authority;

select
			*
		from
			authority
		where
			fan_id = 'jyp2222';

insert into "manager" values ('47', null);

commit;

--security - fk참조를 위해 id에 unique제약조건 추가
ALTER TABLE "fan" ADD UNIQUE ("fan_id");

--security사용을 위한 authority테이블 추가
create table "authority" (
    "fan_id" varchar2(20) not null, -- 회원아이디
    "authority" varchar2(20) not null, -- 권한
    constraint pk_authority primary key ("fan_id", "authority"), --한 회원이 여러 권한을 가질 수 있도록 묶어서 pk설정
    constraint fk_authority_fan_id foreign key("fan_id") references "fan"("fan_id")
);

ALTER TABLE "authority" RENAME COLUMN "fan_id" TO fan_id;
ALTER TABLE "authority" RENAME COLUMN "authority" TO authority;

--일반사용자
insert into "authority" values ('abc123', 'ROLE_USER');
insert into "authority" values ('abc333', 'ROLE_USER');
--기획사
insert into "authority" values ('sm11111', 'ROLE_USER');
insert into "authority" values ('sm11111', 'ROLE_AGENCY');
--관리자
insert into "authority" values ('abc222', 'ROLE_USER');
insert into "authority" values ('abc222', 'ROLE_AGENCY');
insert into "authority" values ('abc222', 'ROLE_ADMIN');

select * from "authority"; where "authority" = 'ROLE_MANAGER';
delete from "authority" where "authority" = 'ROLE_ADMIN';

 -- constraint pk_menu primary key(id), 
alter table fan rename constraint "PK_FAN" to PK_FAN;

commit;

select
			*
		from
			"authority"
		where
			"fan_id" = 'abc333';
            
create table persistent_logins (
    username varchar2(64) not null, --사용자 아이디
    series varchar2(64) primary key, --security에서 발급하는 문자열
    token varchar2(64) not null, --username, password, expiry time에 대한 hashing값
    last_used timestamp not null
);



select
			*
		from
			"authority"
		where
			fan_id = 'abc333';
            
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'AUTHORITY';

desc user_constraints;

desc fan;

commit;
