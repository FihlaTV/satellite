# satellite
![a cute satellite](docs/satellite.jpg)

#### Build
```bash
go build .
``` 
   
#### Deploy Server
```bash
satellite -port=80
```
     
#### Deploy Clients
**Deploy Client 1**   
```bash
satellite -remote="127.0.0.1:80" -create

2019/03/07 16:39:20 Creating SDP tunnel via ws://127.0.0.1:8080/tunnel
2019/03/07 16:39:20 SDP tunnel established: 127.0.0.1:63614
Channel created. join with, -join=bi0cla21lrk5ptf60ae0
```
**Deploy Client 2**    
```bash
satellite -remote="127.0.0.1:80" -join=bi0cla21lrk5ptf60ae0
```

