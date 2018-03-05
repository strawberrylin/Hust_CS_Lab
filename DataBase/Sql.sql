
CREATE TABLE user(
  user_id INT(11) PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(100) NOT NULL ,
  password VARCHAR(100) NOT NULL ,
  nickname VARCHAR(100) UNIQUE NOT NULL ,
  type int(5) NOT NULL
);

CREATE TABLE address(
  addr_id INT(11) PRIMARY KEY AUTO_INCREMENT,
  address VARCHAR(100) NOT NULL ,
  tel CHAR(15) NOT NULL ,
  post CHAR(10) NOT NULL ,
  user_id INT(11) NOT NULL ,
  FOREIGN KEY(user_id) REFERENCES user(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ordert(
  order_id INT(11) PRIMARY KEY AUTO_INCREMENT ,
  date DATE NOT NULL ,
  status int DEFAULT 0,
  goodsname VARCHAR(100),
  user_id INT(11) NOT NULL ,
  addr_id INT(11) NOT NULL ,
  FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE ON UPDATE CASCADE ,
  FOREIGN KEY (addr_id) REFERENCES address(addr_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE goods(
  goods_id INT(11) PRIMARY KEY AUTO_INCREMENT,
  goodsname VARCHAR(100) NOT NULL ,
  price DOUBLE NOT NULL ,
  info VARCHAR(200),
  imag VARCHAR(100),
  store INT DEFAULT 0,
  type_id INT(11),
  FOREIGN KEY  (type_id) REFERENCES category(type_id)
);

CREATE TABLE category(
  type_id int(11) PRIMARY KEY AUTO_INCREMENT,
  typesname VARCHAR(30)  NOT NULL
);

CREATE TRIGGER order_count
  AFTER UPDATE ON ordert
  FOR EACH ROW
  BEGIN
    UPDATE goods SET store = store-1 WHERE goodsname = old.goodsname;
  END;
UPDATE ordert SET status=1 WHERE order_id=12;
SELECT * from ordert;
DROP TRIGGER order_count;

alter table user convert to character set utf8;
alter table address convert to character set utf8;
alter table goods convert to character set utf8;
alter table ordert convert to character set utf8;
alter table category convert to character set utf8;

#user
INSERT INTO user(username, password, nickname, type) VALUES ("wanglin","123456","strawberrylin",1);
INSERT INTO user(username, password, nickname, type) VALUES ("guojiani","123456","caiji",0);
INSERT INTO user(username, password, nickname, type) VALUES ("luoweicheng","123456","shadiao",0);
INSERT INTO user(username, password, nickname, type) VALUES ("zengzhen","123456","caibi",0);
SELECT * FROM user;

#address
INSERT INTO address(address, tel, post, user_id) VALUES ("ProvinceHuBeiWuHanHUST","13419606224","637394",18);
#category

INSERT INTO category(typesname) VALUES ("Summer");
INSERT INTO category(typesname) VALUES ("Computer");
SELECT * FROM category;
#goods

INSERT INTO goods(goodsname, price, info, imag, store, type_id) VALUES ("Short",33.3,"A summer clothes which is essential,making you feel cool.","/images/react.png",20,5);
INSERT INTO goods(goodsname, price, info, imag, store, type_id) VALUES ("T-shirt",99.9,"A t-shirt makes you feel cool and tells the young life.","/images/react.png",100,5);
INSERT INTO goods(goodsname, price, info, imag, store, type_id) VALUES ("Memory",456,"DDL3,8GB,Kingston","/images/react.png",20,6);
INSERT INTO goods(goodsname, price, info, imag, store, type_id) VALUES ("Screen",1000,"Sumsun,4K,high level.","/images/react.png",40,6);
SELECT * FROM goods;
#ordert


