#!/usr/bin/env bash

ano=$(date +%Y)
mes=$(date +%m)
dia_hoje=$(date +%-d)

meses=(January February March April May June July August September October November December)
nome_mes="${meses[$((10#$mes - 1))]}"

# dia da semana do dia 1 (0=domingo ... 6=sabado)
primeiro_wd=$(date -d "${ano}-${mes}-01" +%w)
dias_no_mes=$(date -d "${ano}-${mes}-01 +1 month -1 day" +%-d)

texto="Sun Mon Tue Wed Thu Fri Sat\n"

col=0
for ((i=0; i<primeiro_wd; i++)); do
    texto+="    "
    ((col++))
done

for ((d=1; d<=dias_no_mes; d++)); do
    if [ "$d" -eq "$dia_hoje" ]; then
        texto+=$(printf "[%2d]" "$d")
    else
        texto+=$(printf " %2d " "$d")
    fi
    ((col++))
    if [ "$col" -eq 7 ]; then
        texto+="\n"
        col=0
    fi
done

notify-send -a "Calendar" "󰃭 ${nome_mes} ${ano}" "<tt>${texto}</tt>" -i x-office-calendar