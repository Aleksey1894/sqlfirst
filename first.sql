drop table if exists customer cascade;
drop table if exists deliveri cascade;
drop table if exists contacts cascade;
drop table if exists purchase cascade;
drop table if exists catalogue cascade;
drop table if exists dog cascade;
drop table if exists cat cascade;
drop table if exists bird cascade;

create table public.catalogue(
    id serial primary key,
    dog_id integer,
	cat_id integer,	 
	bird_id integer     
);
create table public.customer(
	id serial primary key,
	f_name varchar(100) not null,
	l_name varchar(100) not null,
	email varchar(100) not null
);

create table public.deliveri(
	id serial primary key,
	del_1 varchar(50) not null,
	del_2 varchar(50)not null
);

create table public.contacts(
	id serial primary key,
	cont_1 bigint not null,
	cont_2 bigint not null
);

create table public.purchase(
    id serial primary key,
    date_order date,
    cost_order numeric(5, 2),  
    customer_id integer,   
    quantity integer,
	contacts_id integer,
	deliveri_id integer,
	foreign key(customer_id) references public.customer(id),
	foreign key(contacts_id) references public.contacts(id),
	foreign key(deliveri_id) references public.deliveri(id)
);

create table public.dog(
    id serial primary key,
	dog_id integer,
    foreign key(dog_id) references public.catalogue(id),
	dryfood_d varchar(50),
	liquidfood_d varchar(50),
	toys_d varchar(50)   
);

create table public.cat(
    id serial primary key,
	cat_id integer,
    foreign key(cat_id) references public.catalogue(id),
    dryfood_c varchar(50) not null,
	liquidfood_c varchar(50) not null,
	toys_c varchar(50) not null
);

create table public.bird(
    id serial primary key,
	bird_id integer,
    foreign key(bird_id) references public.catalogue(id),
	food_b varchar(50),
	birdcage_b varchar(50)    
);


insert into public.deliveri (del_1, del_2)
values ('novaposhta','ukrposhta');

insert into public.contacts (cont_1, cont_2)
values (0671234567, 0931234567);

--select * from customer;
--select * from deliveri;
--select * from bird;
--select * from dog;
--select * from cat;
--select * from catalogue;
--select * from purchase;
select * from contacts;
