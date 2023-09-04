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
