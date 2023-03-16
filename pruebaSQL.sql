create schema minimarketdonjose;
use minimarketdonjose;

CREATE TABLE producto(
producto_id INTEGER primary key auto_increment not null,
nombreProducto VARCHAR(25),
cantidadProducto INTEGER,
tipoProducto_id INTEGER not null,
FOREIGN KEY (tipoProducto_id) REFERENCES tipoProducto (tipoProducto_id)
);

CREATE TABLE tipoProducto(
tipoProducto_id INTEGER primary key auto_increment not null,
nombreTipo VARCHAR(25)
);

CREATE TABLE proveedor(
proveedor_id INTEGER primary key auto_increment not null,
nombreProveedor VARCHAR(25)
);

CREATE TABLE productoProveedor (
productoProvedor_id INTEGER primary key auto_increment not null,
producto_id INTEGER not null,
proveedor_id INTEGER not null,
FOREIGN KEY (producto_id) REFERENCES producto (producto_id),
FOREIGN KEY (proveedor_id) REFERENCES proveedor (proveedor_id)
);

CREATE TABLE venta (
venta_id INTEGER primary key auto_increment not null,
fechaVenta DATE,
totalVenta INTEGER,
producto_id INTEGER not null,
FOREIGN KEY (producto_id) REFERENCES producto (producto_id)
);

insert into producto (nombreProducto, cantidadProducto, tipoProducto_id)
values ("Lapiz",100,1),("Manzana",20,2),("Gomadeborrar",100,1),("Frutilla",10,2),("Zapatilla",5,3);

insert into tipoProducto (nombreTipo)
values ("Libreria"), ("Frutas"), ("Vestuario"), ("Articulos de aseo");

insert into proveedor (nombreproveedor)
values ("Fabercastell"), ("LapizLopez"), ("Vega Central"), ("Lo Valledor"), ("Nike"), ("Adidas");


select * from producto;

select * from proveedor;

select producto.nombreProducto, tipoProducto.nombreTipo
from producto join tipoProducto on producto.tipoProducto_id = tipoProducto.tipoProducto_id
where tipoProducto.nombreTipo like "Frutas";

SELECT YEAR(fechaVenta) AS anio, nombreProducto, SUM(totalVenta) AS totalVentas
FROM venta
JOIN producto ON venta.producto_id = producto.producto_id
GROUP BY YEAR(fechaVenta), nombreProducto
ORDER BY anio ASC, totalVentas DESC;

