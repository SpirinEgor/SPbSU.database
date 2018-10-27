/* 1. Создание нового заказа */
insert into Orders
	(id, name, departure, destination, height, width, depth, weight, comment)
values 
	(
		(select max(id) + 1 from Orders),
		'Documents',
		'Universitetskii prospect 28',
		'Botanicheskaya ulitsa 66/2',
		30, 15, 2,
		10,
		null
	);
	
/* 2. Обновление статуса у всех заказов в очереди */
update Orders
set status = 'in progress'
where id = any (
	select id
	from Orders
	where status = 'in queue'
);

/* 3. Курьер с id 1 берёт последний доступный заказ */
insert into Courier_orders
values
	(
		1,
		(select max(id) from Orders where status = 'in queue')
	);

/* 4. Удаление всех заказов заказчика с id 1, у которых нет назначенных курьеров */
delete from Orders
where 
	id = any (select order_id from Customer_orders where customer_id = 1) and
	id not in (select order_id from Courier_orders);
	
/* 5. Удаление всех выполненных заказов (серия запросов) */
delete from Courier_orders
where 
	order_id = any(select id from Orders where status = 'done');
delete from Customer_orders
where 
	order_id = any(select id from Orders where status = 'done');
delete from Processed_orders
where 
	order_id = any(select id from Orders where status = 'done');
delete from Orders
where status = 'done';