# ft_server
42 - This is a System Administration subject. You will discover Docker and you will set up your first web server.

### Build Docker image
```bash
$> docker build -t ft_server
```

### Create a container and run it
```bash
$> docker run -d -p 80:80 -p 443:443 --name ft_server ft_server
```

### Get access to the container via `bash`
```bash
$> docker exec -ti ft_server bash
```

### Autoindex on/off
By default, autoindex is enabled. To disable it :  
```bash
$> docker run -d -p 80:80 -p 443:443 --name ft_server --env INDEX=off ft_server
```
