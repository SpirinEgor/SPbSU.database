/* VIEWS */

/* 1. Покупатели с указанием документа и фильтром по водительским правам */
create view customer_with_driver_license as
select
    c.name as name,
    c.age as age,
    c.rating as rating,
    c.comment as comment,
    d.number
from
    Couriers as c
inner join 
    Documents as d
on
    c.document_id = d.id and
    d.type = 'driver license';

/* 2. Номера заказов с информацией о курьере */
create view orderid_with_courier as
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
    co.courier_id = c.id;

/* 3. Заказы с информацией о курьерах */
create view order_with_courier as
select
	c.name as courier_name,
    c.age as courier_age,
    c.rating as courier_rating,
    c.comment as courier_comment,
    o.name as order_name,
    o.departure as order_departure,
    o.destination as order_destination,
    o.status as order_status,
    o.comment as order_comment
from 
	Orders as o
left join
	orderid_with_courier as c
on
	o.id = c.order_id;

/* Выполненные заказы с информацией о курьере */
select *
from order_with_courier
where order_status = 'done';

/* Заказы `in progress` становятся выполненными */
update order_with_courier
set order_status = 'done'
where order_status = 'in progress';


/* INDEXES */

/* Основная информация о курьере */
create index courier_info
on Couriers (name, age, rating);

/* Заказ с габаритами */
create index order_size
on Orders (name, height, width, depth);

/* Номер документа с его типом (уникально) */
create unique index document_number_type
on Documents (type, number);


/* CASCADE DELETE */

/* Каскад для Покупателя и поля с id документа */
alter table Customers drop constraint Customer_Document_id_FK;
alter table Customers add constraint Customer_Document_id_FK
    foreign key (document_id)
    references Documents(id)
    on delete cascade
    on update cascade;

/* TRIGGER */

/* Обновление статуса заказа при взятие его курьером */
create trigger take_order_trigger on Courier_orders
after insert
as
begin
    update Orders
    set status = 'in progress'
    where
        status = 'in queue' and
        id = any (select order_id from inserted)
end;

/* Вызываем срабатывание триггера */
insert into Courier_orders
values (1, 2);

/* Проверяем статус */
select status
from Orders
where id = 2;


/* PROCEDURE */

/* Заказы одного покупателя */
create procedure GetCustomerOrders @customer_id int
as
select *
from Orders
where id = any (
    select order_id
    from Customer_orders
    where customer_id = @customer_id
    );

exec GetCustomerOrders 1;