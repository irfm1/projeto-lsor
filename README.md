# Projeto de LSOR


## Descrição

Projeto desenvolvido para a disciplina de Laboratorio de Redes, do curso de Sistemas de Informação do Instituto Federal de Alagoas.

## Instalação

### Requisitos

- Kathara
- Docker

## Topologia

![Topologia](
https://raw.githubusercontent.com/irfm1/projeto-lsor/main/topologia.png)



### Instalação

1. Clone o repositório
2. Entre na pasta do projeto
3. Execute o kathara com o comando `kathara lstart`

### DHCP e DNS

````
dig A squid.admweb.empresa.com.br
````

````
dig A dns.admweb.empresa.com.br
````

````
dig NS dns.admweb.empresa.com.br
````

````
dig A email.admweb.empresa.com.br
````

````
dig MX email.admweb.empresa.com.br
````

````
dig A samba.admweb.empresa.com.br
````

````
dig A www.admweb.empresa.com.br
````

````
dig CNAME app.admweb.empresa.com.br
````

````
dig A ftp.admweb.empresa.com.br
````

### FTP

- Para verificar se o ProFTPd está rodando:
   ````
    ps auwx | grep proftpd
   ````
   ````
    proftpd -v
   ````
   ````
    service proftpd status
   ````

- Testes
    - Da máquina PC utilizando o endereço IP de destino; 

    ````
        ftp 10.10.10.2
    ````
    
    ````
        ftp> put /files/1.txt /home/usuario1/1.txt
    ````
    
    ````
        get 1.txt /tmp/1.txt
    ````

    ````
        ftp ftp.admweb.empresa.com.br
    ````




