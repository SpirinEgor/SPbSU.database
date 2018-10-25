/* 1. Имена всех курьеров */
select name
from Couriers;

/* 2. Завершённые заказы, отсортированные по времени */
select *
from Orders
where
	status = 'done'
order by
	timestamp asc;

/* 3. Различные варианты рейтинга курьеров */
select distinct rating
from Couriers;

/* 4. Заказы в очереди или уже в обработке отсортированные в лексикографическом порядке*/
select *
from Orders
where
	status in ('in queue', 'in progress')
order by
	name asc;

/* 5. Заказчики с возрастом от 18 до 40 лет */
select *
from Customers
where
	age between 18 and 40
order by
	age asc; 

/* 6. Курьеры, которые носят заказы с максимальным измерением меньше 15 см */
select 
	c.name as name
from
	Couriers as c
left join
	Courier_orders as co
on c.id = co.courier_id
where
	co.order_id = any (
		select id
		from Orders
		where
			height < 15 and
			width < 15 and
			depth < 15
	);

/* 7. Все заказчики, указавшие паспорт */
select
	customers.name as name
from
	Customers as customers
inner join
	Documents as docs
on
	customers.document_id = docs.id and
	docs.type = 'passport';

/* 8. Заказы с информацией о курьерах */
select *
from 
	Orders as o
left join
	(
		select 
			c.name as name,
			c.age as age,
			c.rating as rating,
			c.comment as comment,
			co.order_id as order_id
		from
			Couriers as c
		inner join
			Courier_orders as co
		on
			co.courier_id = c.id
	) as c
on
	o.id = c.order_id;

/* 9. Средний возраст курьеров и заказчиков */
select
	'couriers' as who,
	avg(cast(age as float)) as avg_age
from Couriers
union all
select
	'customers' as who,
    avg(cast(age as float)) as avg_age
from Customers;

/* 10. Количество заказов у каждого заказчика */
select
	c.name as name,
	count(*) as total_order
from
	Customers as c
right join
	Customer_orders as co
on
	c.id = co.customer_id
group by
	c.name
union all
select
	c.name,
	0 as total_order
from
	Customers as c
left join
	Customer_orders as co
on
	c.id = co.customer_id
where
	co.customer_id is null
order by
	total_order desc;

/* 11. Курьеры, у которых заказы со средним весом больше 10 кг */
select 
	c.name as name,
	avg(o.weight) as avg_weight
from
	Couriers as c
left join
	(
		select
			o.weight as weight,
			co.courier_id as courier_id
		from
			Orders as o
		inner join
			Courier_orders as co
		on
			o.id = co.order_id
	) as o
on
	c.id = o.courier_id
group by
	c.name
having
	avg(o.weight) >= 10;
	
/* 12. Кто, что и от кого везёт */
select
	c.name as courier,
	c1.customer as customer,
	c1.order_name as order_name
from
	Couriers as c
inner join
	(
		select
			c.name as customer,
			o1.order_name as order_name,
			o1.courier_id as courier_id
		from
			Customers as c
		inner join
			(
				select
					o.name as order_name,
					po.courier_id as courier_id,
					po.customer_id as customer_id
				from
					Orders as o
				inner join
					Processed_orders as po
				on
					o.id = po.order_id
			) as o1
		on
			c.id = o1.customer_id
	) as c1
on
	c.id = c1.courier_id;