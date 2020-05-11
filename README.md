# CAC LOGIN TEST

Generate cert: 
```sh
cd scripts
./generate_X509.sh
```

Run the server: 
```sh
cd ../
docker-compose up
```

Error when trying to authenticate:
```json
{
    "error_description": "X509 client certificate is missing.",
    "error": "invalid_request"
}
```
