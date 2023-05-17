USE [Examen]

select c.fiID
,c.fiIDFactura
,D.fcNombre as deuda
,F.fiCantidad
,F.fiMonto
,F.fcMovim
,C.fiMontoCaja
from Caja as C 
LEFT JOIN Factura as F on f.fiIDFactura = c.fiIDFactura 
LEFT JOIN Deudas as D on D.fiIDDeuda = F.fiIDDeuda
where F.fcMovim = 'Salida'

select c.fiID
,c.fiIDFactura
,F.fiIDProducto
,P.fcNombre
,P.fiPrecioVenta
,F.fiCantidad
,F.fiMonto
,F.fcMovim
,F.fiIDCliente
,Cli.fcNombre
,C.fiMontoCaja
from Caja as C 
LEFT JOIN Factura as F on f.fiIDFactura = c.fiIDFactura 
LEFT JOIN Producto as P on P.fiIDProducto = F.fiIDProducto
LEFT JOIN Cliente as Cli on Cli.fiIDCliente = F.fiIDCliente
where F.fcMovim = 'Entrada'