-- 2. Ejecutar este script para generar las tablas y los datos necesarios
create database on_line_store;
use on_line_store;

create table users(
	id int primary key auto_increment,
    username varchar(50) not null,
    password varchar(200) not null)
    ;

create table products(
	id int primary key auto_increment,
    name varchar(100) not null,
    stock int not null,
    image varchar(200) not null
);

create table orders(
	id int primary key auto_increment,
    userId int not null,
    date date,
    constraint orders_users foreign key (userId) references users(id)
);

create table order_details(
	id int primary key auto_increment,
    orderId int not null,
    productId int not null,
    quantity int(2) not null,
    constraint order_details_orders foreign key(orderId) references orders(id),
    constraint order_details_products foreign key(productId) references products(id)
);

insert into users(username, password) 
values 
('clark_kent@dccomics.com', '123'),
('bruce_wane@dccomics.com', '123')
;

INSERT INTO products (name, stock, image) VALUES
  ('Pantalla Acer', 5, 'acer.jpg'),
  ('Teclado Logitech', 3, 'teclado-logitech.jpg'),
  ('Mouse Microsoft', 4, 'mouse-microsoft.jpg'),
  ('Impresora Epson', 1, 'impresora-epson.jpg'),
  ('Monitor Samsung', 2, 'monitor-samsung.jpg'),
  ('Laptop Lenovo', 5, 'laptop-lenovo.jpg'),
  ('CPU Dell', 3, 'cpu-dell.jpg'),
  ('Disco Duro Toshiba', 4, 'disco-duro-toshiba.jpg'),
  ('Memoria RAM Kingston', 1, 'memoria-kingstong.jpg'),
  ('Tarjeta Gráfica NVIDIA', 2, 'tarjeta-grafica-nvidia.jpg'),
  ('Router TP-Link', 5, 'router-tplink.jpg'),
  ('Altavoces Sony', 3, 'altavoces-sony.jpg'),
  ('Webcam Logitech', 4, 'webcan-logitech.jpg'),
  ('Tableta Wacom', 1, 'tableta-wacon.jpg'),
  ('Escáner Canon', 2, 'escaner-canon.jpg'),
  ('Auriculares Sennheiser', 5, 'auriculares-sennhiser.jpg'),
  ('Proyector Epson', 3, 'proyector-epson.jpg'),
  ('Monitor LG', 4, 'monitor-lg.jpg'),
  ('Impresora Brother', 1, 'impresora-brother.jpg'),
  ('Laptop HP', 2, 'laptop-hp.jpg');

-- Si usted puede ejecutar la siguiente consulta, ha creado correctamente la base de datos.
select * from products;

-- Si esta consulta genera resultados, usted ha podido resolver todos los pasos del examen.
select o.id, p.name, od.quantity from orders o
inner join order_details od on o.id = od.orderId
inner join products p on p.id = od.productId
;