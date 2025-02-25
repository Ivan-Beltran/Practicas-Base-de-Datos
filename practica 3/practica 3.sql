create database practica2;
use practica2;
CREATE TABLE usuarios(
Id_usuario INT PRIMARY KEY auto_increment,
nombre VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
is_deleted BOOLEAN default false
);

CREATE TABLE ordenes(
id_orden INT PRIMARY KEY AUTO_INCREMENT,
id_usuario INT references usuarios(Id_usuario),
producto VARCHAR(100) NOT NULL,
cantidad INT,
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

insert into usuarios(nombre,email)
values('juan perez','juan@example.com'),
('maria lópez','marialopez@gmail.com'),
('ivan beltrán','beltran16@gmail.com'),
('josue segovia','segovia@gmail.com'),
('pedro hernandez','pedrito@gmail.com');


insert into ordenes(id_usuario,producto,cantidad) values
(1,'laptop',1),
(1,'maouse',2),
(1,'teclado',1);

select * from ordenes;

delete from ordenes where id_orden=1;
select * from usuarios where is_deleted=false

update usuarios set is_deleted= true where id_usuario=1


