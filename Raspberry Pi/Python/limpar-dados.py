#!/usr/bin/env python3
from gpiozero import Button
import RPi.GPIO as GPIO
import os
import time
GPIO.setmode(GPIO.BCM)
button1=2
# button2=14
# button3=15
GPIO.setup(button1,GPIO.IN,pull_up_down=GPIO.PUD_UP)
# GPIO.setup(button2,GPIO.IN,pull_up_down=GPIO.PUD_UP)
# GPIO.setup(button3,GPIO.IN,pull_up_down=GPIO.PUD_UP)
print('press a button')
while(1):
      if GPIO.input(2)==0:
           print('Botao 1 - limpar dados')
           os.system("ssh -p 22 -i /root/.ssh/root root@191.36.8.34 sudo -u aluno killall mate-session")
           os.system("ssh -p 22 -i /etc/teste aluno@191.36.8.34 killall -9 mate-session")
           os.system("ssh -p 22 -i /etc/teste aluno@191.36.8.34 killall -9 mate-session")
           os.system("ssh -p 22 -i /etc/teste aluno@191.36.8.34 killall -9 mate-session")
           os.system("ssh -p 22 -i /etc/teste aluno@191.36.8.34 killall -9 mate-session")
           os.system("ssh -p 22 -i /etc/teste aluno@191.36.8.34 killall -9 mate-session")
           os.system("sleep 1")
           os.system("ssh -p 22 -i /root/.ssh/root root@191.36.8.34 rm -r /home/aluno")
           os.system("ssh -p 22 -i /root/.ssh/root root@191.36.8.34 tar -zxvf /etc/.aluno.tar.gz -C /home")
           os.system("ssh -p 22 -i /root/.ssh/root root@191.36.8.34 chown -R aluno:aluno /home/aluno")
           os.system("ssh -p 22 -i /root/.ssh/root root@191.36.8.34 chown -R root:root /home/aluno/.ssh/authorized_keys")
#           os.system("rm -r /home/aluno")
#           os.system("tar -zxvf /etc/.aluno.tar.gz -C /home")
#           os.system("rm -r /home/sdr")
#           os.system("tar -zxvf /etc/.sdr.tar.gz -C /home")
           os.system("pkill -9 -t tty7")

#      elif GPIO.input(14)==0:
#           print('Botao 2 - Aumentar o som')

#      elif GPIO.input(15)==0:
#           print('Botao 3 - Diminuir o som')

      time.sleep(0.1)
