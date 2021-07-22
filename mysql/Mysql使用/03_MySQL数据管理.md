## MySQL数据管理

### 外键

> 方式一：在创建表时，增加约束 (麻烦， 比较复杂)

```sql
create table if not exists `student` (
	`id` int(4) not null auto_increment comment '学号',
	`name` varchar(30) not null default '匿名' comment '姓名',
	`pwd` varchar(20) not null default '123456' comment '密码',
	`sex` enum('男','女','未定义') default '未定义' not null comment '性别',
	`gradeid` int(10) not null comment '学生的年级',			-- 外键对应字段
	`birthday` datetime default NULL comment '出生日期',
	`address` varchar(100) default null comment '家庭住址',
	`email` varchar(30) default null comment '邮箱',
	primary key (`id`),					
	key `FK_gradeid` (`gradeid`),			-- 设置键
	constraint `FK_gradeid` foreign key (`gradeid`) references `grade` (`gradeid`)			-- 定义外键联合
)auto_increment=1
engine=innodb charset=utf8;
```





> 方式二：在已有的表中添加外键

```sql
/*
create table if not exists `student` (
	`id` int(4) not null auto_increment comment '学号',
	`name` varchar(30) not null default '匿名' comment '姓名',
	`pwd` varchar(20) not null default '123456' comment '密码',
	`sex` enum('男','女','未定义') default '未定义' not null comment '性别',
	`gradeid` int(10) not null comment '学生的年级',
	`birthday` datetime default NULL comment '出生日期',
	`address` varchar(100) default null comment '家庭住址',
	`email` varchar(30) default null comment '邮箱',
	primary key (`id`)
)engine=innodb charset=utf8;
*/
alter table `student`
add constraint `FK_gradeid` foreign key(`gradeid`) references `grade` (`gradeid`);

------------------------------------------------------
alter table <表> add constraint <约束名> 
foreign key(<作为外键的字段>) references <被引用的表>(<被引用的字段>);
```



**以上的操作都是物理外键， 数据库级别的外键，不建议使用！(避免数据库过多而造成的困扰， 这里了解即可)** 

**==最佳实践：==** 

- 数据库就是单纯的表，只用来存储数据，只有行(数据) 和 列(字段)
- 我们想使用多张表的数据， 想使用外键， 使用一些复杂的操作，都通过 **程序** 去实现



### DML语言

**DML语言，数据操作语言** 

- **insert** : (插入)添加
- update : 更新
- delete : 删除



### 添加

```sql
-- 插入
insert into `grade` (`gradename`) values ('小明');
insert into `grade` (`gradename`) values ('小红');
-- insert into <表名> (<字段1>, <字段2>....) values (<值1>, <值2>....)
select * from `grade`;			-- 查看表的全部数据
/*
+---------+-----------+
| gradeid | gradename |
+---------+-----------+
|       1 | 小明      |
|       2 | 小红      |
+---------+-----------+
*/
/*
insert into student (name, sex) values ('张三', '男'); 
insert into student (name, sex) values ('李四', '男');
insert into student (name, sex) values ('小丽', '女');
*/
-- 插入多条数据
insert into student (name, sex) values ('张三', '男') ,('李四', '男'),('小丽', '女');
--  insert into <表名> (<字段>....) values (<值>....),(<值>....).... 
select * from student;
/*
+----+------+--------+-----+----------+---------+-------+
| id | name | pwd    | sex | birthday | address | email |
+----+------+--------+-----+----------+---------+-------+
|  1 | 张三 | 123456 | 男  | NULL     | NULL    | NULL  |
|  2 | 李四 | 123456 | 男  | NULL     | NULL    | NULL  |
|  3 | 小丽 | 123456 | 女  | NULL     | NULL    | NULL  |
+----+------+--------+-----+----------+---------+-------+
 */

```

注意事项：

- 字段和字段之间用英文逗号隔开
- 字段是可以省略的，但是后面的值必须要一一对应
- 可以同时插入多条数据， values 



### 修改(更新)

```sql
-- update student set sex='女' where name='李四';
-- update <表名> set <要更改的属性> = <值> where 查找条件;
-- update student set pwd='aaaaaa';
-- 如果不指定条件，则会将更改执行到每一条数据(如果在工作时不慎操作，请赶紧跑路！！！嘻嘻)
update student set name='白鲸', email='32165@qq.com' where id=1;
-- 修改多个属性
select * from student;
/*
+----+------+--------+-----+----------+---------+--------------+
| id | name | pwd    | sex | birthday | address | email        |
+----+------+--------+-----+----------+---------+--------------+
|  1 | 白鲸 | aaaaaa | 男  | NULL     | NULL    | 32165@qq.com |
|  2 | 李四 | aaaaaa | 女  | NULL     | NULL    | NULL         |
|  3 | 小红 | aaaaaa | 女  | NULL     | NULL    | NULL         |
+----+------+--------+-----+----------+---------+--------------+
*/
```

- update <表名> set <属性>=<值>,<属性>=<值>.... where 查找条件;
- 条件：where 子句 运算符 属性等于某个值，或者大于某个值，或者在某个区间

操作符会返回 布尔值

| 比较运算符           | 含义                                       |
| -------------------- | ------------------------------------------ |
| =                    | 等于                                       |
| <=>                  | 严格比较两个NULL值是否相等                 |
| <> 或 !=             | 不等于                                     |
| >、<、>=、<=         | 比较运算                                   |
| berween...and...     | 区间(闭合区间)                             |
| not berween...and... | 不在区间内                                 |
| in                   | 在集合中                                   |
| not in               | 不在集合中                                 |
| like                 | 模糊匹配，'%'匹配多个字符，'_'匹配一个字符 |
| regexp 或 rlike      | 正则式匹配                                 |
| is null              | 为空                                       |
| is not null          | 不为空                                     |

|逻辑运算符|含义|
| -------------------- | ------------------------------------------ |
| and      | 与         |
| or       | 或       |
| not | 非 |
| xor | 异或 |

运算符具有优先级，在不确定优先级的情况下可用小括号()使其保持最高优先级



### 删除

> delete 命令

语法：delete from 表名 [where 条件]

```sql
-- 删除
delete from student where id=3;
-- 删除指定条件的数据
delete from student;
-- 删除表中所有数据(谨慎使用)
select * from student;
```

> truncate 命令

作用：完全清空一个数据库表，表的结构和索引约束不会变

```sql
truncate grade;
```

语法：truncate <表名>

> 区别

- 相同点：都能删除数据，都不会删除表结构
- 不同点：
    - truncate 重新设置 自增列 计数器会归零
    - truncate 不会影响事务