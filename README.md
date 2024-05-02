# README

* Ruby Version
  3.3.0

* Rails Version
  7.1.3.2

* API URL
```
http://localhost:3000/api/v1/convert
```

* Docker 啟動指令

build image
```
docker build --build-arg MASTER_KEY="$MASTER_KEY" -t pre_test_api .
```
請替換$MASTER_KEY為你的主鍵。

run container
```
docker run -p 3000:3000 pre_test_api
```
