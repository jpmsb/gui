#!/bin/bash

xterm -geometry 500x500 -bg black -fg black -e "exit"
yad --center --image="/usr/share/images/conectando.jpg" --no-buttons --auto-close --no-escape --undecorated &
timeout 1 ping -q -i 0.2 -c 2 172.18.20.200
ping="$?"

nc -z -w5 172.18.20.200 8000
nc="$?"
killall -9 yad

if [ "$ping" = "2" ]; then
    yad --center --image="/usr/share/images/conexao-servidor-fora.jpg" --button="Tentar novamente":0 --button="Desligar":"systemctl poweroff -i" --buttons-layout=center --no-escape --timeout=60 --timeout-indicator=bottom
    if [ "$?" = "0" ]; then
        yad --center --image="/usr/share/images/conectando.jpg" --no-buttons --auto-close --no-escape --undecorated &
        sudo dhclient ens3
        /home/aluno/.xsession

    fi

elif [ "$nc" = "0" ]; then
    test -e /home/aluno/.jpmsb

    if [ "$?" = "0" ]; then
        echo "Arquivo .jpmsb encontrado!!"
        conteudo_arquivo=$(cat /home/aluno/.jpmsb)
            if [ "$conteudo_arquivo" = "rancher" ]; then
                echo "Restaurando ambiente sem compartilhamento de som"
                yad --center --image="/usr/share/images/conectando-ambiente-trabalho.jpg" --no-buttons --auto-close --no-escape --undecorated &
                sleep 30 && killall -9 yad &
                x2goclient --hide --sessionid=rancher

            elif [ "$conteudo_arquivo" = "rancher-som" ]; then
                echo "Restaurando ambiente com compartilhamento de som"
                yad --center --image="/usr/share/images/conectando-ambiente-trabalho.jpg" --no-buttons --auto-close --no-escape --undecorated &
                /opt/SoundWireServer/SoundWireServer &
                sleep 30 && killall -9 yad &
                x2goclient --hide --sessionid=rancher-som

            fi
    elif [ "$?" = "1" ]; then
        echo "Início normal"
        xterm -geometry 500x500 -bg black -fg black -e "exit"
        yad --center --button="Cancelar":1 --button="Entendido":0 --image='/usr/share/images/informativo600.jpg' --timeout=240 --timeout-indicator=bottom

        if [ "$?" = "0" ]; then
            yad --center --image="/usr/share/images/informativo-audio-permitir.jpg" --button="Recusar":1 --button="Permitir":0

            if [ "$?" = "0" ]; then
                echo "rancher-som" > /home/aluno/.jpmsb
                yad --center --image="/usr/share/images/conectando-ambiente-trabalho.jpg" --no-buttons --auto-close --no-escape --undecorated &
                /opt/SoundWireServer/SoundWireServer &
                sleep 30 && killall -9 yad &
                x2goclient --hide --sessionid=rancher-som

            elif [ "$?" = "1" ]; then
                echo "rancher" > /home/aluno/.jpmsb
                yad --center --image="/usr/share/images/conectando-ambiente-trabalho.jpg" --no-buttons --auto-close --no-escape --undecorated &
                sleep 30 && killall -9 yad &
                x2goclient --hide --sessionid=rancher

            fi

        elif [ "$?" = "1" ]; then
            systemctl poweroff

        fi
    fi

elif [ "$ping" = "0" ] && [ "$nc" = "1" ]; then
    yad --center --image="/usr/share/images/conexao-porta-fora.jpg" --button="Ok":"systemctl poweroff -i" --buttons-layout=center --no-escape --timeout=60 --timeout-indicator=bottom

fi
