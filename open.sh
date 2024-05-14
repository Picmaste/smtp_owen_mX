#!/bin/bash
rele=$(snmpget -v 2c -c private  192.168.19.40 .1.3.6.1.4.1.51014.2.301.44544.470 |  sed  's/^.\{47\}//')
echo "rele=$rele"
result=$(($rele | $((2**($1-1))) ))
# Вывод результата в поток
snmpset -v 2c -c private  192.168.19.40  .1.3.6.1.4.1.51014.2.301.44544.470  u $result
echo "Результат: $result"

