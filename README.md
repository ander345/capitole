# API FIND PRICE

## Access via port 8080

### URL SWAGGER 
```
 http://localhost:8080/swagger-ui/index.html
```

### Access DB H2
```
 http://localhost:8080/h2-console
```

### Credentials

JDBC URL: ``` jdbc:h2:mem:commercedb ```

User: ``` sa ```

Password: ``` password ```

## Docker

### Create image 
```
docker build -t "capitole_technical_test_pricing_api" .
```

### Execute docker-compose 
```
docker-compose up -d
```

#### With docker runs on port ``` 9090 ```

## Enunciado

En la base de datos de comercio electrónico de la compañía disponemos de la tabla PRICES que refleja el precio final (pvp) y la tarifa que aplica a un producto de una cadena entre unas fechas determinadas. A continuación se muestra un ejemplo de la tabla con los campos relevantes:

### Tabla PRICES
| BRAND_ID | START DATE | END_DATE | PRICE_LIST | PRODUCT_ID | PRIORITY | PRICE | CURR|
|--:|--:|--:|--:|--:|--:|--:|:--|
| 1 | 2020-06-14-00.00.00 | 2020-12-31-23.59.59 | 1 | 35455 | 0 | 35.50 | EUR|
|1 | 2020-06-14-15.00.00 | 2020-06-14-18.30.00 | 2 | 35455 | 1 | 25.45 | EUR|
| 1| 2020-06-15-00.00.00| 2020-06-15-11.00.00| 3| 35455| 1| 30.50| EUR|
|1| 2020-06-15-16.00.00| 2020-12-31-23.59.59| 4| 35455| 1| 38.95| EUR|

### Campos: 

`BRAND_ID`: foreign key de la cadena del grupo (1 = ZARA).
`START_DATE` , `END_DATE`: rango de fechas en el que aplica el precio tarifa indicado.
`PRICE_LIST`: Identificador de la tarifa de precios aplicable.
`PRODUCT_ID`: Identificador código de producto.
`PRIORITY`: Desambiguador de aplicación de precios. Si dos tarifas coinciden en un rago de fechas se aplica la de mayor prioridad (mayor valor numérico).
`PRICE`: precio final de venta.
`CURR`: iso de la moneda.

## Se pide:

Construir una aplicación/servicio en SpringBoot que provea una end point rest de consulta  tal que:
 

#### Acepte como parámetros de entrada: 

 - Fecha de aplicación 
 - Identificador de producto 
 - Identificador de cadena 

#### Devuelva como datos de salida: 

 - Identificador de producto    
 - Identificador de cadena 
 - Tarifa a aplicar 
 - Fechas de aplicación
 - Precio final a aplicar
 
Se debe utilizar una base de datos en memoria (tipo h2) e inicializar con los datos del ejemplo, (se pueden cambiar el nombre de los campos y añadir otros nuevos si se quiere, elegir el tipo de dato que se considere adecuado para los mismos).
         
Desarrollar unos test al endpoint rest que  validen las siguientes peticiones al servicio con los datos del ejemplo:                                                                              

          Test 1: petición a las 10:00 del día 14 del producto 35455   para la brand 1 (ZARA)
          Test 2: petición a las 16:00 del día 14 del producto 35455   para la brand 1 (ZARA)
          Test 3: petición a las 21:00 del día 14 del producto 35455   para la brand 1 (ZARA)
          Test 4: petición a las 10:00 del día 15 del producto 35455   para la brand 1 (ZARA)
          Test 5: petición a las 21:00 del día 16 del producto 35455   para la brand 1 (ZARA)

## Aspectos a tener en cuenta

- [x] **SCM-GIT**

	- [x] Uso de github para presentar el código
	- [x] Usar numerosos commits para poder seguir la evolución del código, así como comentarios significativos en ellos

- [x] **Tooling**

	- [x] Inclusión de Maven wrapper
	- [x] Buena definición del POM
	- [x] Uso de Flyway para migraciones de bases de datos

- [x] **Java**

	- [x] Usar últimas versiones y aplicar al máximo las opciones del lenguaje
	- [x] P.e.: si usas java 11, 17… usar streams, optionals y localdatetime

- [x] **Spring**

	- [x] Usar correctamente los archivos de recursos (definición del datasource e inicialización de la base de datos)
	- [x] Uso de advice para manejo de excepciones

- [x]  **CleanCode**

	- [x] Nombrado de métodos y variables de manera clara
	- [x] Inyección de dependencias por constructor
	- [x] Usar builders o constructores en lugar de setters (apreciable en RestExcepctionAdvice)
	- [x] Definir bien métodos y clases
	- [x] Que no haya acoplamiento en el diseño; no depender siempre de clases concretas y utilizar interfaces
	- [x] Buen diseño con bajo acoplamiento mediante el uso de interfaces y modelo diferente de base de datos y de API

- [x] **Testing**

	- [x] Tests de sistema con diferentes casuísticas y claros
	- [x] Aplicar testing unitarios
	- [x] Comprobar que pasen todos los tests
