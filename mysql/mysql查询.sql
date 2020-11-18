
----查询
--	查看数据表中的指定字段
select 字段名称,字段名称 from 数据表名称;

--	查看数据表中所检索的行
select * from 数据表名称 where 检索表达式;

--	查看数据表中指定字段的中的检索名称
select 字段名称 from 数据表名称 where 检索表达式;

--	查看不重复
select distinct

----检索查询表达式
--	表示与的关系
and

--	查询区间
between表示区间
字段名称 between 数值 and 数值
字段名称 > 数值 and 字段名称 < 数值

--	表示包含关系
in

--	表示或者关系
or

--	查看数据表中所有字段的名称
select * from 数据表名称;

--	按一列降序或升序查询
降序
order by 字段名称 desc
升序， 默认升序
order by 字段名称 [asc]

--	按多列降序或升序查询
一列升降查询表达式, 一列升降查询表达式
前面的优先执行

--	统计
统计某一字段
select count(字段名称) from 数据表名称 where 检索表达式;
统计表数
select count(*) from 数据表名称 where 检索表达式;

--	最值
max()/min()

-- 切片查找（索引）
第一个值为开始位置，第二个值为查询多少条
limit 值,值;

--	复合语句子查询
查询表达式(查询表达式)

--	平均
avg()

--	分组
group by 字段名称

--	分组条件查询
分组表达式 having 检索表达式

--	模糊检索
like '3%'
3为一个标识，%为通配符

--	多表查询
select 字段名称,字段名称 from 数据表名称,数据表名称 where 数据表名称.字段名称

--	命名显示字段名称
select 字段名称 as 新名称 from 数据表名称


