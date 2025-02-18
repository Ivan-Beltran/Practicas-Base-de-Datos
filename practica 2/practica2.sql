CREATE DATABASE tiendaDeVideoJuegos;

use tiendaDeVideoJuegos;

CREATE TABLE Videojuegos(
id INT UNSIGNED auto_increment PRIMARY KEY,
nameVideogame VARCHAR(100) NOT NULL,
plataforma VARCHAR(100) NOT NULL,
genero VARCHAR (50) ,
desarrollador VARCHAR(100),
precio DECIMAL(12,2) NOT NULL,
fechaLanzamiento DATE ,
existencias INT  DEFAULT 0
);

CREATE TABLE clientes(
id INT UNSIGNED auto_increment PRIMARY KEY,
nombreCliente VARCHAR(150) NOT NULL,
email VARCHAR(100) NOT NULL,
phone VARCHAR(20) NOT NULL,
address VARCHAR(200) NOT NULL,
fechaRegistros DATE DEFAULT(CURRENT_DATE),
membresiaCliente ENUM('regular','premium','vip') DEFAULT 'regular'
);

CREATE TABLE empleados(
id INT UNSIGNED auto_increment primary KEY,
nombre VARCHAR(100) NOT NULL,
cargo ENUM("gerente","supervisor","vendedor") NOT NULL

);


CREATE TABLE ventas(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fechaVenta DATETIME DEFAULT CURRENT_TIMESTAMP,
    totalPagar DECIMAL(10,2) NOT NULL,
    metodoPago ENUM('efectivo', 'tarjeta', 'transferencia') NOT NULL,
    idCliente INT UNSIGNED NOT NULL,
    idEmpleado INT UNSIGNED NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES clientes(id),
    FOREIGN KEY (idEmpleado) REFERENCES empleados(id)
);

CREATE TABLE detallesVentas(
idDetalle INT UNSIGNED auto_increment PRIMARY KEY,
cantidad INT NOT NULL,
precioUnitario DECIMAL(10,2) NOT NULL,
subTotal DECIMAL(10,2) NOT NULL,
idVenta INT UNSIGNED NOT NULL,
FOREIGN KEY (idVenta) REFERENCES ventas(id),
idVideoJuego INT UNSIGNED NOT NULL,
FOREIGN KEY (idVideoJuego) REFERENCES Videojuegos(id)
)
