use ebdb;
CREATE TABLE IF NOT EXISTS auth_permission (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    content_type_id int NOT NULL,
    codename varchar(100) NOT NULL,
    UNIQUE (content_type_id, codename)
);
INSERT INTO auth_permission VALUES(1,'Can add permission',1,'add_permission');
INSERT INTO auth_permission VALUES(2,'Can change permission',1,'change_permission');
INSERT INTO auth_permission VALUES(3,'Can delete permission',1,'delete_permission');
INSERT INTO auth_permission VALUES(4,'Can add group',2,'add_group');
INSERT INTO auth_permission VALUES(5,'Can change group',2,'change_group');
INSERT INTO auth_permission VALUES(6,'Can delete group',2,'delete_group');
INSERT INTO auth_permission VALUES(7,'Can add user',3,'add_user');
INSERT INTO auth_permission VALUES(8,'Can change user',3,'change_user');
INSERT INTO auth_permission VALUES(9,'Can delete user',3,'delete_user');
INSERT INTO auth_permission VALUES(10,'Can add content type',4,'add_contenttype');
INSERT INTO auth_permission VALUES(11,'Can change content type',4,'change_contenttype');
INSERT INTO auth_permission VALUES(12,'Can delete content type',4,'delete_contenttype');
INSERT INTO auth_permission VALUES(13,'Can add session',5,'add_session');
INSERT INTO auth_permission VALUES(14,'Can change session',5,'change_session');
INSERT INTO auth_permission VALUES(15,'Can delete session',5,'delete_session');
INSERT INTO auth_permission VALUES(16,'Can add site',6,'add_site');
INSERT INTO auth_permission VALUES(17,'Can change site',6,'change_site');
INSERT INTO auth_permission VALUES(18,'Can delete site',6,'delete_site');
INSERT INTO auth_permission VALUES(19,'Can add migration history',7,'add_migrationhistory');
INSERT INTO auth_permission VALUES(20,'Can change migration history',7,'change_migrationhistory');
INSERT INTO auth_permission VALUES(21,'Can delete migration history',7,'delete_migrationhistory');
INSERT INTO auth_permission VALUES(22,'Can add pad',8,'add_pad');
INSERT INTO auth_permission VALUES(23,'Can change pad',8,'change_pad');
INSERT INTO auth_permission VALUES(24,'Can delete pad',8,'delete_pad');
INSERT INTO auth_permission VALUES(25,'Can add note',9,'add_note');
INSERT INTO auth_permission VALUES(26,'Can change note',9,'change_note');
INSERT INTO auth_permission VALUES(27,'Can delete note',9,'delete_note');
CREATE TABLE IF NOT EXISTS auth_group_permissions (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    group_id int NOT NULL,
    permission_id int NOT NULL REFERENCES auth_permission (id),
    UNIQUE (group_id, permission_id)
);
CREATE TABLE IF NOT EXISTS auth_group (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(80) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS auth_user_groups (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id int NOT NULL,
    group_id int NOT NULL REFERENCES auth_group (id),
    UNIQUE (user_id, group_id)
);
CREATE TABLE IF NOT EXISTS auth_user_user_permissions (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id int NOT NULL,
    permission_id int NOT NULL REFERENCES auth_permission (id),
    UNIQUE (user_id, permission_id)
);
CREATE TABLE IF NOT EXISTS auth_user (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    password varchar(128) NOT NULL,
    last_login datetime NOT NULL,
    is_superuser bool NOT NULL,
    username varchar(30) NOT NULL UNIQUE,
    first_name varchar(30) NOT NULL,
    last_name varchar(30) NOT NULL,
    email varchar(75) NOT NULL,
    is_staff bool NOT NULL,
    is_active bool NOT NULL,
    date_joined datetime NOT NULL
);

CREATE TABLE IF NOT EXISTS django_content_type (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    app_label varchar(100) NOT NULL,
    model varchar(100) NOT NULL,
    UNIQUE (app_label, model)
);
INSERT INTO django_content_type VALUES(1,'permission','auth','permission');
INSERT INTO django_content_type VALUES(2,'group','auth','group');
INSERT INTO django_content_type VALUES(3,'user','auth','user');
INSERT INTO django_content_type VALUES(4,'content type','contenttypes','contenttype');
INSERT INTO django_content_type VALUES(5,'session','sessions','session');
INSERT INTO django_content_type VALUES(6,'site','sites','site');
INSERT INTO django_content_type VALUES(7,'migration history','south','migrationhistory');
INSERT INTO django_content_type VALUES(8,'pad','pads','pad');
INSERT INTO django_content_type VALUES(9,'note','notes','note');
CREATE TABLE IF NOT EXISTS django_session (
    session_key varchar(40) NOT NULL PRIMARY KEY,
    session_data text NOT NULL,
    expire_date datetime NOT NULL
);
INSERT INTO django_session VALUES('02mtaqvf3e1ux9h90oth1vpz55xfff3m','NzA0ZTI0YmFmMmQ0YzE1YWM5Nzc4NDNmNjhhOGFlNTM2YTI3MDZjMDp7fQ==','2020-02-19 16:27:19.745866');
INSERT INTO django_session VALUES('kpogepq2fge071cifl7a8tkre5poqtp9','NzA0ZTI0YmFmMmQ0YzE1YWM5Nzc4NDNmNjhhOGFlNTM2YTI3MDZjMDp7fQ==','2020-02-21 19:47:06.861272');
CREATE TABLE IF NOT EXISTS django_site (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    domain varchar(100) NOT NULL,
    name varchar(50) NOT NULL
);
INSERT INTO django_site VALUES(1,'example.com','example.com');
CREATE TABLE IF NOT EXISTS south_migrationhistory (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    app_name varchar(255) NOT NULL,
    migration varchar(255) NOT NULL,
    applied datetime NOT NULL
);
INSERT INTO south_migrationhistory VALUES(1,'pads','0001_initial','2020-02-03 19:32:46.782713');
INSERT INTO south_migrationhistory VALUES(2,'notes','0001_initial','2020-02-03 19:32:46.820225');
CREATE TABLE IF NOT EXISTS pads_pad (id int NOT NULL PRIMARY KEY AUTO_INCREMENT, name varchar(100) NOT NULL, user_id int NOT NULL);
INSERT INTO pads_pad VALUES(1,'Test',2);
CREATE TABLE IF NOT EXISTS notes_note (id int NOT NULL PRIMARY KEY AUTO_INCREMENT, pad_id int NULL, user_id int NOT NULL, name varchar(100) NOT NULL, text text NOT NULL, created_at datetime NOT NULL, updated_at datetime NOT NULL);

CREATE TABLE IF NOT EXISTS django_migrations (id int NOT NULL PRIMARY KEY AUTO_INCREMENT, app varchar(255) NOT NULL, name varchar(255) NOT NULL, applied datetime NOT NULL);
INSERT INTO django_migrations VALUES(1,'contenttypes','0001_initial','2020-02-07 19:44:19.895876');
INSERT INTO django_migrations VALUES(2,'auth','0001_initial','2020-02-07 19:44:19.907581');
INSERT INTO django_migrations VALUES(3,'sessions','0001_initial','2020-02-07 19:44:19.912333');
INSERT INTO django_migrations VALUES(4,'sites','0001_initial','2020-02-07 19:44:19.917032');

CREATE INDEX auth_permission_37ef4eb4 ON auth_permission (content_type_id);
CREATE INDEX auth_group_permissions_5f412f9a ON auth_group_permissions (group_id);
CREATE INDEX auth_group_permissions_83d7f98b ON auth_group_permissions (permission_id);
CREATE INDEX auth_user_groups_6340c63c ON auth_user_groups (user_id);
CREATE INDEX auth_user_groups_5f412f9a ON auth_user_groups (group_id);
CREATE INDEX auth_user_user_permissions_6340c63c ON auth_user_user_permissions (user_id);
CREATE INDEX auth_user_user_permissions_83d7f98b ON auth_user_user_permissions (permission_id);
CREATE INDEX django_session_b7b81f0c ON django_session (expire_date);
CREATE INDEX pads_pad_6340c63c ON pads_pad (user_id);
CREATE INDEX notes_note_a9a6ce0f ON notes_note (pad_id);
CREATE INDEX notes_note_6340c63c ON notes_note (user_id);
COMMIT;
