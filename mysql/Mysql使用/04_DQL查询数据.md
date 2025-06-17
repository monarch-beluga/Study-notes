DQL查询数据(最重点)

### DQL

(Data Query LANGUAGE：数据查询语言)

- 所有的查询操作都用 **select** 
- 简单的查询，复杂的查询它都能做
- ==数据库中最核心的语言，最重要的语句== 
- 使用频率最高的语句

**==使用的表与数据==** 

https://github.com/monarch-beluga/Study-Code/blob/master/mysql/DQL.sql



### 查询指定字段

>  查询整张表：select * from <表名>;

```sql
select * from student;
```

![image-20210501125451507](https://img2020.cnblogs.com/blog/2213660/202105/2213660-20210501125453604-1964074446.png) 

> 查询一张表指定字段：select <字段名>, <字段名>... from <表名>;

```sql
select StudentNo, StudentName from student;
```

![image-20210501125645073](https://img2020.cnblogs.com/blog/2213660/202105/2213660-20210501125646831-175561027.png) 

> 给结果一个别名,可以给字段取别名，也可以给表取别名: **as** 

```sql
select StudentNo as 学号, StudentName as 学生姓名 from student as s;
```

![image-20210501125756097](https://img2020.cnblogs.com/blog/2213660/202105/2213660-20210501125757855-1421835426.png) 

> 函数 concat(a, b) : 拼接

```sql
select StudentNo as 学号, concat('姓名', StudentName) as 新名字 from student;
```

![image-20210501125932698](https://img2020.cnblogs.com/blog/2213660/202105/2213660-20210501125934463-1038086239.png) 

> distinct: 去重，去除select 查询出来的结果中重复的数据，重复的数据只显示一条

```sql
-- 查询一下有哪些同学参加了考试: destinct 去重
select distinct StudentNo from result;
```

![image-20210501130848026](https://img2020.cnblogs.com/blog/2213660/202105/2213660-20210501130849769-1451890165.png) 

> 表达式

```sql
select version();			-- 查询系统版本 (函数)
select 100*3 as 结果;			-- 获取计算结果  (表达式)
select @@auto_increment_increment;  -- 查询自增步长   (变量)

-- 学员考试成绩+1分
select StudentNo, StudentResult+1 as 提分后 from result;
```

**==数据库中的表达式：文本值, 列，null, 函数，计算表达式，系统变量...==** 

select `表达式` from <表名>



### where 条件子句

> 逻辑运算符

| 逻辑运算符 | 含义 |
| ---------- | ---- |
| and        | 与   |
| or         | 或   |
| not        | 非   |
| xor        | 异或 |
```sql
-- 查询学生成绩在[95,100]之间的学生
select studentno, studentresult from result where studentresult<=100 and studentresult>=95;

-- 查询除了1000号学生之外的同学的成绩
select studentno, studentresult from result where studentno != 1000; -- 1
select studentno, studentresult from result where not studentno = 1000;   -- 2
```

where子句可以在原来查询的基础上再指定条件进行筛选

格式：select ... from ... where ...;

条件为 `表达式` , 多条表达式可以通过逻辑运算符来拼接为复杂的表达式

> 模糊查询：比较运算符

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

```sql
-- 查询在北京的同学：like  %匹配多个字符，_匹配一个字符
select studentno, studentname, address from student where address like '%北京%';

-- 查询姓名为张三、李四、王五的学员: in   
select studentno, studentname from student where studentname in ('张三', '李四', '王五');
```



### 联表查询

> Jion 对比

![image-20210503102122645](https://img2020.cnblogs.com/blog/2213660/202105/2213660-20210503102123787-1645091320.png) 

1. 分析需求，分析查询的字段来自哪些表 (连接查询)
2. 确定使用哪种连接查询
3. 确定交叉点 (这两个表中那个数据是相同的)
4. 判断的条件

> 两表查询

```sql
------------- 联表查询 join ----------
--- 查询参加了考试的同学(学号，姓名，科目编号，分数)
-- inner join
select s.studentNo, studentname, subjectno, studentresult			-- 查询字段
from student as s				-- 设置别名
inner join result as r			-- 连接方法
where s.studentno = r.studentno;		-- 确定交叉点并判断

-- right join
select s.studentNo, studentname, subjectno, studentresult
from student as s
inner join result as r
on s.studentno = r.studentno;		-- on等效于where，一般在联表查询时用on

-- left join
select s.studentNo, studentname, subjectno, studentresult
from student as s
left join result as r
on s.studentno = r.studentno;
```

| 操作       | 描述                                                     |
| ---------- | -------------------------------------------------------- |
| inner join | 返回匹配条件的行                                         |
| left join  | 会从左表中返回所有的行，右表中没有匹配条件的行用NULL填充 |
| right join | 会从右表中返回所有的行，左表中没有匹配条件的行用NULL填充 |

格式：

```sql
select <字段>, <字段>, <字段>, <字段>...		-- 两表重合的字段要指定一个表显示
from <左表> as l					-- 一般都会使用别名
<连接类型> <右表> as r			-- 默认为inner join
on <判断条件>
[where 联表查询之后再进行筛选];
```

> 多表查询

```sql
--- 查询参加了考试的学生的学号，姓名，科目名，分数 (三表联合)
select s.studentno, studentname, subjectname, studentresult
from student as s
inner join result as r
on s.studentno = r.studentno
inner join subject as sub
on sub.subjectno = r.subjectno;
```

**多表联合即在两表联合的基础上再添加多个连接类型与判断条件**

格式

```sql
select <字段>, <字段>, <字段>, <字段>...
from <表1> as t1
<连接类型> <表2> as t2
on <判断条件>
<连接类型> <表3> as t3
on <判断条件>
...
[where 联表查询之后再进行筛选];
```

> 自连接

自己的表和自己的表连接，核心：==一张表拆为两张一样的表即可== 

```sql
-- --- 表与数据
create table category (
	categoryid int(10) unsigned not null auto_increment comment '主题id',
	pid int(10) not null comment '父id',
	categoryname varchar(50) not null comment '主题名字',
	primary key (categoryid)
)engine = innodb auto_increment=2 charset=utf8;

insert into category (pid, categoryname)
values
(1, '信息技术'),
(1, '软件开发'),
(3, '数据库'),
(1, '美术设计'),
(3, 'web开发'),
(5, 'ps技术'),
(2, '办公信息');
```

父表

| categoryid | categoryName |
| ---------- | ------------ |
| 2          | 信息技术     |
| 3          | 软件开发     |
| 5          | 美术设计     |

子表

| pid  | categoryid | categoryName |
| ---- | ---------- | ------------ |
| 3    | 4          | 数据库       |
| 2    | 8          | 办公信息     |
| 3    | 6          | web开发      |
| 5    | 7          | ps技术       |

操作：查询父类对应的子类关系

| 父类     | 子类     |
| -------- | -------- |
| 信息技术 | 办公信息 |
| 软件开发 | 数据库   |
| 软件开发 | web开发  |
| 美术设计 | ps技术   |

```SQL
select l.categoryname as '父类', r.categoryname as '子类'
from category as l
inner join category as r			-- 自己与自己连接
on l.categoryid = r.pid;
-- +----------+----------+
-- | 父类     | 子类     |
-- +----------+----------+
-- | 软件开发 | 数据库   |
-- | 软件开发 | web开发  |
-- | 美术设计 | ps技术   |
-- | 信息技术 | 办公信息 |
-- +----------+----------+	
```



### 分页与排序

> 排序

升序 ==asc== 降序 ==desc== 

```sql
select s.studentno, studentname, subjectname, studentresult
from student as s
inner join result as r
on s.studentno = r.studentno
inner join subject as sub
on sub.subjectno = r.subjectno
where subjectname = 'C#基础'
order by studentresult desc;			-- 降序
```

![image-20210504091640449](https://img2020.cnblogs.com/blog/2213660/202105/2213660-20210504091640932-1344457646.png) 

格式：==order by== <字段> ==asc/desc== 

```sql
-- --- 多级排序：先以学号排序，再以学科名称排序
select s.studentno, studentname, subjectname, studentresult
from student as s
inner join result as r
on s.studentno = r.studentno
inner join subject as sub
on sub.subjectno = r.subjectno
order by studentno asc, subjectname asc;		-- 多条排序字段用逗号分隔
```

多级排序格式：==order by== <字段1> ==asc/desc==, <字段2> ==asc/desc== ...

多级排序在保证前面字段排序的结果下再进行排序

> 分页

当数据量十分大时，为了缓解数据库压力，给人的体验更好

```sql
-- --- 分页：下面以每个学员为一页，即一页4个数据
-- 查看所有
select s.studentno, studentname, subjectname, studentresult
from student as s
inner join result as r
on s.studentno = r.studentno
inner join subject as sub
on sub.subjectno = r.subjectno
order by studentno asc;
-- 查看第一个
select s.studentno, studentname, subjectname, studentresult
from student as s
inner join result as r
on s.studentno = r.studentno
inner join subject as sub
on sub.subjectno = r.subjectno
order by studentno asc
limit 0,4;
-- 查看第二个
select s.studentno, studentname, subjectname, studentresult
from student as s
inner join result as r
on s.studentno = r.studentno
inner join subject as sub
on sub.subjectno = r.subjectno
order by studentno asc
limit 4,4;
```

格式：**limit <起始行>, <行数>** 

==注：第一条数据为 0== 



### 子查询

```sql
-- --- 查询'C#基础'分数不小于80分的学生的学号和姓名
-- 1.使用联表
select distinct s.studentno, studentname
from student as s
inner join result as r
on s.studentno = r.studentno
inner join subject as sub
on sub.subjectno = r.subjectno
where subjectname = 'C#基础' and studentresult > 80;
-- 2.使用子查询
select distinct studentno, studentname 
from student 
where studentno in (
	select studentno 
	from result 
	where studentresult > 80 and subjectno = (
		select subjectno 
		from subject
		where subjectname = 'C#基础'
	)
);
```

本质：==在where子句中添加一个查询语句== 

由于子查询只运用了 **select** 查询语句，而未使用联表，那么子查询的效率是更高的

当我们需要查询两个或多个表的字段时，我们就用联表查询，

当我们只需要查询一个表的字段，但是需求涉及到多个表时，我们就使用子查询来提高效率

**子查询和联表查询是可以嵌套使用的** 



### 分组和过滤

```sql
-- 查询每个科目的平均分、最高分、最低分
select subjectname as 课程名称,
avg(studentresult) as 平均分,
max(studentresult) as 最高分,
min(studentresult) as 最低分
from result as r
inner join subject as sub
on r.subjectno = sub.subjectno
group by subjectname  		-- 通过什么来分组
having 平均分 > 80;			-- 过滤
```

==group by== : 分组

==having== : 过滤(作用相当于where，但是是作用于分组后的数据，且不能使用where来判断分组后的数据)



### 总结

查询语句的基本格式:

select <字段>, <字段>...

from <表>

[xxx join <表> on <字段> = <字段>]

...

[where <条件> and <条件> ...]

[group by <分组字段>]

[having <条件>]

[order by <字段> asc/desc]

[limit n, m];

**上述格式中关键字的使用位置顺序很重要，如where不能在order by 后面** 

