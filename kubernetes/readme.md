# k8s

## initial bs

```bash
sudo git clone -b k8s https://github.com/pabloqpacin/lamp_docker /mnt/PROYECTO

cd /mnt/PROYECTO/kubernetes

for file in ./*; do
    kubectl apply -f $file
done

watch kubectl get all -o wide
```


```bash
mycli -h $IP -P $DB_PORT -u root -ppassword -D helpdesk_core_php


curl -v localhost:30080
# <b>Warning</b>:  mysqli::__construct(): php_network_getaddresses: getaddrinfo failed: Name or service not known in <b>/var/www/html/src/Database.php</b> on line <b>14</b><br />
# <br />
# <b>Warning</b>:  mysqli::__construct(): (HY000/2002): php_network_getaddresses: getaddrinfo failed: Name or service not known in <b>/var/www/html/src/Database.php</b> on line <b>14</b><br />
# <br />
# <b>Warning</b>:  mysqli::query(): Couldn't fetch mysqli in <b>/var/www/html/index.php</b> on line <b>24</b>.

```
