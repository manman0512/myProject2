SET NAMES UTF8;
DROP DATABASE IF EXISTS vancl;
CREATE DATABASE  vancl CHARSET=UTF8;
USE vancl;
#用户信息表
CREATE TABLE vancl_user(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	uname VARCHAR(32),
	upwd VARCHAR(32),
	email VARCHAR(64),
	phone VARCHAR(16),
 	avatar VARCHAR(128),
	gender TINYINT DEFAULT 1
);

INSERT INTO vancl_user VALUES(NULL,'zhangmanman','123456','zhangmanman@qq.com','13843284925',null,'0');
INSERT INTO vancl_user VALUES(NULL,'lianliuchao','123456','lianliuchao@qq.com','13843284925',null,'1');
INSERT INTO vancl_user VALUES(NULL,'ningco','123456','ningco@qq.com','13843284925',null,'1');

/**收货地址表**/
CREATE TABLE vancl_receiver_address(
	aid INT PRIMARY KEY,
	user_id INT,
	receiver VARCHAR(16),
	province VARCHAR(16),
	city VARCHAR(16),
	county VARCHAR(16),
	address VARCHAR(128),
	cellphone VARCHAR(16),
	fixedphone VARCHAR(16),
	postcode CHAR(6),
	tag VARCHAR(16),
	is_default TINYINT 
);

/*购物车条目**/
CREATE TABLE vancl_shopping_cart(
	cid INT PRIMARY KEY,
	user_id INT,
	product_id INT,
	count INT
);

/***用户订单列表详情****/
CREATE TABLE vancl_order_detail(
	did INT,
	order_id INT,
	product_id INT,
	count INT
);
/****首页轮播广告商品****/
CREATE TABLE vancl_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)#点击图片要跳转
);
INSERT INTO vancl_index_carousel VALUES(NULL,'/img/carousel/banner1.png','轮播商品1','product_details.html?lid=2'),
																				(NULL,'/img/carousel/banner2.png','轮播商品2','product_details.html?lid=2'),
																				(NULL,'/img/carousel/banner3.png','轮播商品3','product_details.html?lid=2'),
																				(NULL,'/img/carousel/banner4.png','轮播商品4','product_details.html?lid=2');
/**************导航栏****************/
CREATE TABLE vancl_index_nav(
	name VARCHAR(16),
	url VARCHAR(64),
	title	VARCHAR(32)
);
INSERT INTO vancl_index_nav VALUES('商品首页','/index.html','商品首页'),
	('T恤',"/index.html",'多种多样的T恤'),
	('衬衫',"/index.html",'多种多样的衬衫'),
	('C9',"/index.html","多种多样的C9"),
	('麻',"/index.html","多种多样的麻"),
	('鞋',"/index.html","多种多样的鞋"),
	('水柔棉',"/index.html","多种多样的水柔棉"),
	('裤装',"/index.html","多种多样的裤子"),
	('外套',"/index.html","多种多样的外套"),
	('私人订制',"/index.html","私人订制");


/*************首页商品列表******************/
CREATE TABLE vancl_index_product(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(64),
    pic VARCHAR(128),
    href VARCHAR(128)
);
INSERT INTO vancl_index_product VALUES(NULL,"0.8折起 BUBUBOSFLFJA 女装特卖","img/floor/f1/f1_01.jpg","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 女装特卖","img/floor/f1/f1_02.jpg","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 女装特卖","img/floor/f1/f1_03.jpg","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 女装特卖","img/floor/f1/f1_04.jpg","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 欧美风格","img/floor/f2/f2_01.png","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 欧美风格","img/floor/f2/f2_02.png","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 欧美风格","img/floor/f2/f2_03.png","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 女装特卖","img/floor/f2/f2_04.png","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 冬季新品","img/floor/f3/f3_01.png","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 冬季新品","img/floor/f3/f3_02.png","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 冬季新品","img/floor/f3/f3_03.png","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 冬季新品","img/floor/f3/f3_04.png","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 型男必备","img/floor/f4/f4_04.png","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 型男必备","img/floor/f4/f4_04.png","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 型男必备","img/floor/f4/f4_04.png","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 型男必备","img/floor/f4/f4_04.png","products.html");
/*************商品列表-图片-***************/
CREATE TABLE vancl_product_pic(
	pic_id INT PRIMARY KEY AUTO_INCREMENT,
	lid INT,
	sm VARCHAR(128),
	md VARCHAR(128),
	lg VARCHAR(128)
);  
INSERT INTO vancl_product_pic VALUES(NULL,1,'img/product/sm/6375443-1j201710131550493576.jpg','img/product/md/6375443-1j201710131550493576.jpg','img/product/lg/6375443-1j201710131550493576.jpg'),
(NULL,1,"img/product/sm/6375443-2201710131550493576.jpg","img/product/md/6375443-2201710131550493576.jpg","img/product/lg/6375443-2201710131550493576.jpg"),
(NULL,1,"img/product/sm/6375443-5201611021701149855.jpg","img/product/md/6375443-5201611021701149855.jpg","img/product/lg/6375443-5201611021701149855.jpg"),
(NULL,1,"img/product/sm/6375443-6201611021701149855.jpg","img/product/md/6375443-6201611021701149855.jpg","img/product/lg/6375443-6201611021701149855.jpg"),
(NULL,1,"img/product/sm/6375443-7201611021701149855.jpg","img/product/md/6375443-7201611021701149855.jpg","img/product/lg/6375443-7201611021701149855.jpg"),
(NULL,1,"img/product/sm/6375443-8201611021701149855.jpg","img/product/md/6375443-8201611021701149855.jpg","img/product/lg/6375443-8201611021701149855.jpg"),
(NULL,1,"img/product/sm/6375443-9201611021701149855.jpg","img/product/md/6375443-9201611021701149855.jpg","img/product/lg/6375443-9201611021701149855.jpg"),
(NULL,2,"img/product/sm/6375218-1j201710130915288969.jpg","img/product/md/6375218-1j201710130915288969.jpg","img/product/lg/6375218-1j201710130915288969.jpg"),
(NULL,2,"img/product/sm/6375218-2201710130915288969.jpg","img/product/md/6375218-2201710130915288969.jpg","img/product/lg/6375218-2201710130915288969.jpg"),
(NULL,2,"img/product/sm/6375218-03201610261056430813.jpg","img/product/md/6375218-03201610261056430813.jpg","img/product/lg/6375218-03201610261056430813.jpg"),
(NULL,2,"img/product/sm/6375218-04201610261056430813.jpg","img/product/md/6375218-04201610261056430813.jpg","img/product/lg/6375218-04201610261056430813.jpg"),
(NULL,2,"img/product/sm/6375218-05201610261056430813.jpg","img/product/md/6375218-05201610261056430813.jpg","img/product/lg/6375218-05201610261056430813.jpg"),
(NULL,2,"img/product/sm/6375218-06201610261056430813.jpg","img/product/md/6375218-06201610261056430813.jpg","img/product/lg/6375218-06201610261056430813.jpg"),
(NULL,2,"img/product/sm/6375218-07201610261056430813.jpg","img/product/md/6375218-07201610261056430813.jpg","img/product/lg/6375218-07201610261056430813.jpg");

/****************商品库存表*********************/
CREATE TABLE vancl_product_details(
	cid INT PRIMARY KEY,
	pid INT ,
	family_id INT,
	title VARCHAR(128),
	price DECIMAL(10,2),
	promise VARCHAR(64),
	spec VARCHAR(64),
	color VARCHAR(128),
	size VARCHAR(128),
	shelf_time BIGINT(20),
	sold_count INT,
	is_onsale TINYINT(1)
)
INSERT INTO vancl_product_details VALUES(NULL,1,1,"羊毛大衣 手工面料 圆领 女",1699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),
(NULL,2,1,"羊毛大衣 手工面料 圆领 女",2699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),
(NULL,3,1,"羊毛大衣 手工面料 圆领 女",3699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),
(NULL,4,1,"牛津纺 手工面料 圆领 女",4699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),
(NULL,5,1,"羊毛大衣 手工面料 圆领 女",2699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),
(NULL,6,1,"羊毛大衣 手工面料 圆领 女",3699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),
(NULL,7,1,"牛津纺 手工面料 圆领 女",4699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),
(NULL,8,1,"羊毛大衣 手工面料 圆领 女",2699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),
(NULL,9,1,"羊毛大衣 手工面料 圆领 女",3699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),
(NULL,10,1,"牛津纺 手工面料 圆领 女",4699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),
(NULL,11,1,"羊毛大衣 手工面料 圆领 女",2699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),
(NULL,12,1,"羊毛大衣 手工面料 圆领 女",3699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),
(NULL,13,1,"牛津纺 手工面料 圆领 女",4699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),
(NULL,14,1,"羊毛大衣 手工面料 圆领 女",2699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),
(NULL,15,1,"羊毛大衣 手工面料 圆领 女",3699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),
(NULL,16,1,"牛津纺 手工面料 圆领 女",4699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),(NULL,17,1,"羊毛大衣 手工面料 圆领 女",2699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),
(NULL,18,1,"羊毛大衣 手工面料 圆领 女",3699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),
(NULL,19,1,"牛津纺 手工面料 圆领 女",4699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),(NULL,20,1,"羊毛大衣 手工面料 圆领 女",2699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),
(NULL,21,1,"羊毛大衣 手工面料 圆领 女",3699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),
(NULL,22,1,"牛津纺 手工面料 圆领 女",4699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),(NULL,23,1,"羊毛大衣 手工面料 圆领 女",2699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),
(NULL,24,1,"羊毛大衣 手工面料 圆领 女",3699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),
(NULL,25,1,"牛津纺 手工面料 圆领 女",4699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),(NULL,26,1,"羊毛大衣 手工面料 圆领 女",2699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),
(NULL,27,1,"羊毛大衣 手工面料 圆领 女",3699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),
(NULL,28,1,"牛津纺 手工面料 圆领 女",4699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),(NULL,29,1,"羊毛大衣 手工面料 圆领 女",2699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),
(NULL,30,1,"羊毛大衣 手工面料 圆领 女",3699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1),
(NULL,31,1,"牛津纺 手工面料 圆领 女",4699.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色|酒红色|墨绿色|咖啡色|粉色|淡黄色","S|M|L","2018-11-16",1000,1);

CREATE TABLE vancl_product_inventory(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
	pid INT,
	color VARCHAR(32),
	specs VARCHAR(32),
	sold_count INT,
	stock INT
)
INSERT INTO vancl_product_inventory VALUES(NULL,1,"黑色","S",1235,9999),
																					(NULL,1,"黑色","M",4554,9999),
																					(NULL,1,"黑色","L",458,9999),
																					(NULL,1,"黑色","XL",565,9999),
																					(NULL,1,"黑色","XXL",55635,9999),
																					(NULL,1,"酒红色","S",1235,9999),
																					(NULL,1,"酒红色","M",4554,9999),
																					(NULL,1,"酒红色","L",458,9999),
																					(NULL,1,"酒红色","XL",565,9999),
																					(NULL,1,"酒红色","XXL",55635,9999),
																					(NULL,1,"墨绿色","S",1235,9999),
																					(NULL,1,"墨绿色","M",4554,9999),
																					(NULL,1,"墨绿色","L",458,9999),
																					(NULL,1,"墨绿色","XL",565,9999),
																					(NULL,1,"墨绿色","XXL",55635,9999),
																					(NULL,1,"咖啡色","S",1235,9999),
																					(NULL,1,"咖啡色","M",4554,9999),
																					(NULL,1,"咖啡色","L",458,9999),
																					(NULL,1,"咖啡色","XL",565,9999),
																					(NULL,1,"咖啡色","XXL",55635,9999),
																					(NULL,1,"粉色","S",1235,9999),
																					(NULL,1,"粉色","M",4554,9999),
																					(NULL,1,"粉色","L",458,9999),
																					(NULL,1,"粉色","XL",565,9999),
																					(NULL,1,"粉色","XXL",55635,9999),
																					(NULL,2,"黑色","S",1235,9999),
																					(NULL,2,"黑色","M",4554,9999),
																					(NULL,2,"黑色","L",458,9999),
																					(NULL,2,"黑色","XL",565,9999),
																					(NULL,2,"黑色","XXL",55635,9999);
