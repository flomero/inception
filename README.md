# Inception

_One container is not enough - we need to go deeper!_

## Accessible Services

### Wordpress

- [http://localhost:80](http://localhost:80) (not available if HTTPS only)
- [http://localhost:433](http://localhost:433)

### FTP

- `ftp://localhost:21`

### Adminer

- [http://localhost:8080](http://localhost:8080)

### Portainer

- [http://localhost:9000](http://localhost:9000)

### Static Page

- [http://localhost:3000](http://localhost:3000)

## Other Services

### Redis

Cache server for Wordpress.

### MariaDB

Database server for Wordpress.

```bash
mariadb -pPassword
SHOW DATABASES;
USE wordpress;
SHOW TABLES;
SELECT * FROM wp_comments;
```
