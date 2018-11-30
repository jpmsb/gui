FROM debian:stretch

MAINTAINER João Pedro Menegali Salvan Bitencourt (joao.ms@aluno.ifsc.edu.br)

RUN export DEBIAN_FRONTEND=noninteractive && \
    \
    # Adicionando os repos da RNP por ser mais rapido
    echo "deb http://debian.pop-sc.rnp.br/debian stretch main contrib non-free" > /etc/apt/sources.list && \
    echo "deb http://debian.pop-sc.rnp.br/debian stretch-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://security.debian.org stretch/updates main contrib non-free" >> /etc/apt/sources.list && \
    apt update && \
    apt -y -q upgrade && \
    dpkg --add-architecture i386 && \
    \
    # Instalando algumas aplicacoes basicas
    apt update && apt -y -q install curl dialog gnupg1 apt-utils htop nload nmap arp-scan wget tar unzip lib32z1 lib32ncurses5 nano vim bzip2 libbz2-1.0 locales vlc wireshark gdb tcpdump apt-transport-https traceroute speedtest-cli telnet iperf whois libc6-i386 lzop && \
    # Adicioando fontes de aplicativos
    apt-key adv --recv-keys --keyserver keys.gnupg.net E1F958385BFE2B6E && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90 && \
    wget -O - http://repo.vivaldi.com/stable/linux_signing_key.pub | apt-key add - && \
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    wget -q -O - https://deb.opera.com/archive.key | apt-key add - && \
    wget -q -O - http://archive.raspberrypi.org/debian/raspberrypi.gpg.key | apt-key add - && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F88F6D313016330404F710FC9A2FD067A2E3EF7B && \
    echo "deb https://deb.opera.com/opera-stable/ stable non-free" > /etc/apt/sources.list.d/opera-stable.list && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
    echo "deb http://repo.vivaldi.com/stable/deb/ stable main" > /etc/apt/sources.list.d/vivaldi.list && \
    echo "deb http://packages.x2go.org/debian stretch main" > /etc/apt/sources.list.d/x2go.list && \
    echo "deb-src http://packages.x2go.org/debian stretch main" >> /etc/apt/sources.list.d/x2go.list && \
    echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list && \
    echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list && \
    echo "deb http://debian.pop-sc.rnp.br/debian stretch-backports main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://debian.pop-sc.rnp.br/debian/ jessie main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://debian.pop-sc.rnp.br/debian/ wheezy main" >> /etc/apt/sources.list && \
    echo "deb http://ppa.launchpad.net/gns3/ppa/ubuntu xenial main" >> /etc/apt/sources.list.d/gns3.list && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt update && \
    \
    # Instalando algumas bibliotecas
apt -y -q install libglu1-mesa lib32z1 lib32ncurses5 libfreetype6:i386 libsm6:i386 libxrender1:i386 libfontconfig1:i386 libxext6:i386 libappindicator1 libdbusmenu-glib4 libdbusmenu-gtk4 libindicator7 libvirt0 libxft2:i386 libpng16-16 libpng16-16:i386 libtool libtool-bin libgamin0 libgtkmm-3.0-dev libpulse-dev libfftw3-dev libncursesw5-dev && \
    \
    # Pacotes principais
    apt -y -q install x2go-keyring x2goserver x2goserver-xsession mate-desktop-environment qasmixer qashctl qasconfig pavucontrol mate-themes okular libreoffice libreoffice-l10n-pt-br fluidsynth vlc-plugin-fluidsynth qsynth fluid-soundfont-gm audacity gdebi-core x2goclient x2gousbmount x2goserver-fmbindings xournal kolourpaint4 oracle-java8-installer oracle-java8-set-default fritzing fritzing-data fritzing-parts kicad ipython ipython3 glade python-glade2 geogebra latexila dia inkscape kdenlive gimp kile pinta gajim gajim-omemo gajim-triggers gajim-httpupload gajim-urlimagepreview pulseaudio-equalizer pitivi gnuradio gqrx-sdr virt-manager spotify-client playonlinux wine winetricks git clementine r-base r-base-dev less cmake vivaldi-stable unrar cutecom graphviz python-vte bridge-utils uml-utilities ipython3-qtconsole scratch squeak-vm squeak-plugins-scratch geany mcu8051ide qt4-designer spyder3 kalzium logisim grass tracker wxmaxima prerex vprerex rsyslog pcb maxima cantor google-chrome-stable opera-stable googleearth-package hexchat hexchat-otr hexchat-perl hexchat-plugins hexchat-python3 qgis qgis-common qgis-providers-common qgis-server ipython-qtconsole distcc nemiver mysql-workbench yad aqemu bluefish xemacs21 anjuta kmag mercurial gnome-subtitles genius gns3-gui mpi-default-dev sqlite3 sqlitebrowser python-pip virtualenv python-virtualenv dh-virtualenv virtualenv-clone virtualenvwrapper fonts-noto kcolorchooser && \
    \
    # Algumas fontes a mais
    apt -y -q install fonts-noto fonts-cantarell fonts-crosextra-caladea fonts-crosextra-carlito fonts-dustin fonts-freefont-ttf fonts-hack-ttf fonts-oxygen fonts-roboto-hinted fonts-seto fonts-tlwg-laksaman fonts-tlwg-laksaman-ttf fonts-tlwg-purisa fonts-tlwg-purisa-ttf fonts-vlgothic ttf-adf-accanthis ttf-adf-baskervald ttf-adf-berenis ttf-adf-gillius ttf-adf-ikarius ttf-adf-irianis ttf-adf-libris ttf-adf-mekanus ttf-adf-switzera ttf-adf-tribun ttf-adf-universalis ttf-adf-verana ttf-engadget ttf-mscorefonts-installer ttf-sjfonts ttf-staypuft ttf-summersby && \
    \
    # Alguns pacotes de repositorios fora da versao estavel
    apt -y -q install -t stretch-backports octave liboctave-dev tilix golang && \
    cp /usr/lib/i386-linux-gnu/libpng16.so.16 /lib/i386-linux-gnu/libpng12.so.0 && \
    cp /usr/lib/x86_64-linux-gnu/libpng16.so.16 /lib/x86_64-linux-gnu/libpng12.so.0 && \
    apt -y -q purge wireshark wireshark-common && \
    apt -y -q install -t jessie libssl1.0.0 wireshark wireshark-common eagle && \ 
    apt -y -q install -t wheezy libpng12-0 libpng12-0:i386 && \
    ldconfig && \
    \
    # Refazendo a lista de repositorios
    echo "deb http://debian.pop-sc.rnp.br/debian stretch main contrib non-free" > /etc/apt/sources.list oracle-java8-set-default && \
    echo "deb http://debian.pop-sc.rnp.br/debian stretch-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://security.debian.org stretch/updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list && \
    echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list && \
    echo "deb http://archive.raspberrypi.org/debian/ stretch main ui" > /etc/apt/sources.list.d/raspi.list && \
    apt update && \
    \
    apt -y -q install gns3-gui gns3 && \
    chmod 755 /usr/bin/ubridge && \
    \
    # Instalando o pacote Cerebro
    wget https://github.com/KELiON/cerebro/releases/download/v0.3.1/cerebro_0.3.1_amd64.deb && \
    dpkg -i cerebro_0.3.1_amd64.deb && \
    rm -r cerebro_0.3.1_amd64.deb && \
    \
    # Instalando o RStudio
    wget https://download1.rstudio.org/rstudio-xenial-1.1.453-amd64.deb && \
    dpkg -i rstudio-xenial-1.1.453-amd64.deb && \
    rm -r rstudio-xenial-1.1.453-amd64.deb && \
    \
    # Master PDF Editor
    wget https://code-industry.net/public/master-pdf-editor-5.1.12_qt5.amd64.deb && \
    bash -c 'echo -e "y\n" |gdebi master-pdf-editor-5.1.12_qt5.amd64.deb' && \
    rm -r master-pdf-editor-5.1.12_qt5.amd64.deb && \
    \
    # HUB api do GitHub
    wget http://ftp.br.debian.org/debian/pool/main/h/hub/hub_2.5.1~ds1-1_amd64.deb -O /hub_2.5.1~ds1-1_amd64.deb && \
    dpkg -i /hub_2.5.1~ds1-1_amd64.deb && \
    rm -r hub_2.5.1~ds1-1_amd64.deb && \
    \
    # Instalar o Adobe Flash Player
    wget http://archive.canonical.com/ubuntu/pool/partner/a/adobe-flashplugin/adobe-flashplugin_20180911.1-0ubuntu0.14.04.1_amd64.deb -O /flash.deb && \
    dpkg -i /flash.deb && \
    rm /flash.deb && \
    \
    # Script para lidar com o armazenamento
    wget https://raw.githubusercontent.com/jpmsb/gui/master/scripts/armazenamento -O /usr/local/bin/armazenamento && \
    chmod 700 /usr/local/bin/armazenamento && \
    \
    # Aviso de compartilhamento de audio
    wget https://raw.githubusercontent.com/jpmsb/gui/master/scripts/aviso2 -O /usr/local/bin/aviso && \
    chmod 700 /usr/local/bin/aviso && \
    \
    # Script que inicia a interface sem compartilhamento de audio
    wget https://raw.githubusercontent.com/jpmsb/gui/master/scripts/rancher -O /usr/local/bin/rancher && \
    chmod 755 /usr/local/bin/rancher && \
    \
    # Script que inicia a interface com compartilhamento de audio
    wget https://raw.githubusercontent.com/jpmsb/gui/master/scripts/rancher-som -O /usr/local/bin/rancher-som && \
    chmod 755 /usr/local/bin/rancher-som && \
    \
    # Script com a interface explicativa de como fazer a conexao no celular
    wget https://raw.githubusercontent.com/jpmsb/gui/master/scripts/como-conectar -O /usr/local/bin/como-conectar && \
    chmod 500 /usr/local/bin/como-conectar && \
    \
    # Script para iniciar a IDE do Arduino
    wget https://raw.githubusercontent.com/jpmsb/gui/master/scripts/arduino -O /usr/local/bin/arduino && \
    chmod 755 /usr/local/bin/arduino && \
    \
    # Script que muda as permissoes da porta do Arduino
    wget https://raw.githubusercontent.com/jpmsb/gui/master/scripts/habilitar-arduino -O /usr/local/bin/habilitar-arduino && \
    chmod 755 /usr/local/bin/habilitar-arduino && \
    \
    # Uma piadinha minha
    wget https://raw.githubusercontent.com/jpmsb/gui/master/scripts/trocadilho -O /usr/local/bin/trocadilho && \
    chmod 755 /usr/local/bin/trocadilho && \
    \
    # Um sorteador para a minha piadinha
    wget https://github.com/jpmsb/gui/raw/master/sorteador -O /usr/local/bin/sorteador && \
    chmod 755 /usr/local/bin/sorteador && \
    \
    # Cliente em linha de comando para o Google Drive
    wget "https://docs.google.com/uc?id=0B3X9GlR6EmbnQ0FtZmJJUXEyRTA&export=download" -O /usr/local/bin/gdrive && \
    chmod 755 /usr/local/bin/gdrive && \
    \
    # Obtendo o Ftool, precisa ser mudado!! Meu servidor nao durara para sempre!! A versao para linux nao funciona
    wget jpmsb.sj.ifsc.edu.br/Ftool.exe -O /usr/local/bin/Ftool.exe && \
    wget jpmsb.sj.ifsc.edu.br/ftoolicon.png -O /usr/share/icons/ftoolicon.png && \
    wget jpmsb.sj.ifsc.edu.br/ftool.desktop -O /usr/share/applications/ftool.desktop && \
    \
    # Obtendo o AntConc
    wget http://www.laurenceanthony.net/software/antconc/releases/AntConc357/AntConc_64bit.tar.gz && \
    tar -xvf AntConc_64bit.tar.gz && \
    mv AntConc_64bit /usr/local/bin/ && \
    mv antconc_icon.png /usr/share/icons/ && \
    rm help.pdf license.pdf version_history.pdf && \
    chmod 755 /usr/local/bin/AntConc_64bit && \
    chmod 444 /usr/share/icons/antconc_icon.png && \
    rm -rf AntConc_64bit.tar.gz && \
    \
    # Code Blocks 17
    mkdir /codeblocks && \
    wget https://ufpr.dl.sourceforge.net/project/codeblocks/Binaries/17.12/Linux/Debian%20stable/codeblocks_17.12-1_amd64_stable.tar.xz -O /codeblocks/codeblocks.tar.xz && \
    tar -xvf /codeblocks/codeblocks.tar.xz -C /codeblocks/ && \
    dpkg -i /codeblocks/*.deb && \
    rm -r /codeblocks && \
    \
    # O WPS Office
    wget http://kdl1.cache.wps.com/ksodl/download/linux/a21//wps-office_10.1.0.5707~a21_amd64.deb -O /wpsoffice.deb && \
    dpkg -i /wpsoffice.deb && \
    rm -rf /wpsoffice.deb && \
    \
    # Script com a mensagem que permanece na area do trabalho quando o compartilhamento de audio esta ativo
    wget https://github.com/jpmsb/gui/raw/master/informativo-audio.jpg -O /usr/share/images/informativo-audio.jpg && \
    chmod 400 /usr/share/images/informativo-audio.jpg && \
    \
    # Instalacao da IDE MU para Python
    apt -y -q install mu python-gpiozero python3-gpiozero && \
    echo "# deb http://archive.raspberrypi.org/debian/ stretch main ui" > /etc/apt/sources.list.d/raspi.list && \
    apt update && \
    \
    # Remocao da permissao do passwd para usuario comum
    chmod 500 /usr/bin/passwd && \
    \
    # Feitio do atalhos
    # Atalho do Packet Tracer
    echo '[Desktop Entry]' >> /usr/share/applications/packettracer7.desktop && \
    echo 'Exec=/opt/pt/packettracer' >> /usr/share/applications/packettracer7.desktop && \
    echo 'Icon=/opt/pt/art/app.png' >> /usr/share/applications/packettracer7.desktop && \
    echo 'Type=Application' >> /usr/share/applications/packettracer7.desktop && \
    echo 'Terminal=false' >> /usr/share/applications/packettracer7.desktop && \
    echo 'Name=Packet Tracer 7' >> /usr/share/applications/packettracer7.desktop && \
    echo 'Categories=Network;' >> /usr/share/applications/packettracer7.desktop && \
    \
    # Atalho do Musixmatch, provavelmente sera removido caso nao volte a funcionar
    echo '[Desktop Entry]' >> /usr/share/applications/musixmatch.desktop && \
    echo 'Name=Musixmatch' >> /usr/share/applications/musixmatch.desktop && \
    echo 'Comment=Musixmatch Desktop App' >> /usr/share/applications/musixmatch.desktop && \
    echo 'Exec=/opt/Musixmatch/musixmatch' >> /usr/share/applications/musixmatch.desktop && \
    echo 'Terminal=false' >> /usr/share/applications/musixmatch.desktop && \
    echo 'Type=Application' >> /usr/share/applications/musixmatch.desktop && \
    echo 'Icon=/opt/Musixmatch/resources/app/assets/mxm-icon@2x.png' >> /usr/share/applications/musixmatch.desktop && \
    echo 'Categories=AudioVideo;Video;Player;TV;' >> /usr/share/applications/musixmatch.desktop && \
    \
    # Atalho da IDE do Arduino. Optou-se por utilizar a versãodo site oficial por ser mais atual
    echo "[Desktop Entry]" >> /usr/share/applications/arduino.desktop && \
    echo "Type=Application" >> /usr/share/applications/arduino.desktop && \
    echo "Name=Arduino IDE" >> /usr/share/applications/arduino.desktop && \
    echo "GenericName=Create physical computing projects" >> /usr/share/applications/arduino.desktop && \
    echo "Exec=arduino" >> /usr/share/applications/arduino.desktop && \
    echo "Icon=/opt/arduino-1.8.5/lib/icons/256x256/apps/arduino.png" >> /usr/share/applications/arduino.desktop && \
    echo "Terminal=false" >> /usr/share/applications/arduino.desktop && \
    echo "Categories=Development;Engineering;Electronics;" >> /usr/share/applications/arduino.desktop && \
    echo "MimeType=text/x-arduino" >> /usr/share/applications/arduino.desktop && \
    echo "Keywords=embedded electronics;electronics;avr;microcontroller;" >> /usr/share/applications/arduino.desktop && \
    \
    # Atalho do Clion
    echo "[Desktop Entry]" >> /usr/share/applications/clion.desktop && \
    echo "Version=1.0" >> /usr/share/applications/clion.desktop && \
    echo "Encoding=UTF-8" >> /usr/share/applications/clion.desktop && \
    echo "Name=CLion " >> /usr/share/applications/clion.desktop && \
    echo "Comment=A power tool For a power language" >> /usr/share/applications/clion.desktop && \
    echo "Exec=/opt/clion-2018/bin/clion.sh" >> /usr/share/applications/clion.desktop && \
    echo "Icon=/opt/clion-2018/bin/clion.svg" >> /usr/share/applications/clion.desktop && \
    echo "Terminal=false" >> /usr/share/applications/clion.desktop && \
    echo "Type=Application" >> /usr/share/applications/clion.desktop && \
    echo "Categories=Development" >> /usr/share/applications/clion.desktop && \
    \
    # Atalho do PyCharm
    echo "[Desktop Entry]" >> /usr/share/applications/pycharm.desktop && \
    echo "Version=1.0" >> /usr/share/applications/pycharm.desktop && \
    echo "Encoding=UTF-8" >> /usr/share/applications/pycharm.desktop && \
    echo "Name=PyCharm" >> /usr/share/applications/pycharm.desktop && \
    echo "Comment=All Python tools in one place" >> /usr/share/applications/pycharm.desktop && \
    echo "Exec=/opt/pycharm-2018.1/bin/pycharm.sh" >> /usr/share/applications/pycharm.desktop && \
    echo "Icon=/opt/pycharm-2018.1/bin/pycharm.png" >> /usr/share/applications/pycharm.desktop && \
    echo "Terminal=false" >> /usr/share/applications/pycharm.desktop && \
    echo "Type=Application" >> /usr/share/applications/pycharm.desktop && \
    echo "Categories=Development" >> /usr/share/applications/pycharm.desktop && \
    \
    # Atalho do AntConc
    echo "[Desktop Entry]" >> /usr/share/applications/antconc.desktop && \
    echo "Version=1.0" >> /usr/share/applications/antconc.desktop && \
    echo "Encoding=UTF-8" >> /usr/share/applications/antconc.desktop && \
    echo "Name=AntConc 3.5.7 2018" >> /usr/share/applications/antconc.desktop && \
    echo "Comment=AntConc is a freeware, multiplatform tool for carrying out corpus linguistics research and data-driven learning." >> /usr/share/applications/antconc.desktop && \
    echo "Exec=/usr/local/bin/AntConc_64bit" >> /usr/share/applications/antconc.desktop && \
    echo "Icon=/usr/share/icons/antconc_icon.png" >> /usr/share/applications/antconc.desktop && \
    echo "Terminal=false" >> /usr/share/applications/antconc.desktop && \
    echo "Type=Application" >> /usr/share/applications/antconc.desktop && \
    echo "Categories=Education;" >> /usr/share/applications/antconc.desktop && \
    \
    # Atalho do armazenamento
    echo "[Desktop Entry]" >> /usr/share/applications/armazenamento.desktop && \
    echo "Version=1.0" >> /usr/share/applications/armazenamento.desktop && \
    echo "Encoding=UTF-8" >> /usr/share/applications/armazenamento.desktop && \
    echo "Name=Utilitário de Armazenamento" >> /usr/share/applications/armazenamento.desktop && \
    echo "Comment=Gerenciador de armazenamento externo" >> /usr/share/applications/armazenamento.desktop && \
    echo "Exec=sudo -E armazenamento" >> /usr/share/applications/armazenamento.desktop && \
    echo "Icon=/usr/share/icons/Adwaita/256x256/devices/media-removable.png" >> /usr/share/applications/armazenamento.desktop && \
    echo "Terminal=false" >> /usr/share/applications/armazenamento.desktop && \
    echo "Type=Application" >> /usr/share/applications/armazenamento.desktop && \
    echo "Categories=System;" >> /usr/share/applications/armazenamento.desktop && \
    \
    # Atalho da IDE Mu
    echo "[Desktop Entry]" > /usr/share/applications/mu.desktop && \
    echo "Type=Application" >> /usr/share/applications/mu.desktop && \
    echo "Name=mu" >> /usr/share/applications/mu.desktop && \
    echo "GenericName=A Python editor for beginner programmers " >> /usr/share/applications/mu.desktop && \
    echo "Comment=A Python editor for beginner programmers" >> /usr/share/applications/mu.desktop && \
    echo "Icon=/usr/share/icons/hicolor/256x256/apps/mu.png" >> /usr/share/applications/mu.desktop && \
    echo "TryExec=mu" >> /usr/share/applications/mu.desktop && \
    echo "Exec=/usr/bin/mu" >> /usr/share/applications/mu.desktop && \
    echo "Terminal=false" >> /usr/share/applications/mu.desktop && \
    echo "Categories=Application;Development;" >> /usr/share/applications/mu.desktop && \
    echo "Keywords=Python;Editor;microbit;micro:bit;" >> /usr/share/applications/mu.desktop && \
    \
    # Atalho do Firefox
    echo '[Desktop Entry]' > /usr/share/applications/firefox.desktop && \
    echo 'Name=Mozilla Firefox' >> /usr/share/applications/firefox.desktop && \
    echo 'Name[pt_BR]=Navegador Web Mozilla Firefox' >> /usr/share/applications/firefox.desktop && \
    echo 'GenericName[pt_BR]=Navegador Web' >> /usr/share/applications/firefox.desktop && \
    echo 'Exec=/opt/firefox/firefox %u' >> /usr/share/applications/firefox.desktop && \
    echo 'Terminal=false' >> /usr/share/applications/firefox.desktop && \
    echo 'X-MultipleArgs=false' >> /usr/share/applications/firefox.desktop && \
    echo 'Type=Application' >> /usr/share/applications/firefox.desktop && \
    echo 'Icon=/opt/firefox/browser/chrome/icons/default/default128.png' >> /usr/share/applications/firefox.desktop && \
    echo 'Categories=Network;WebBrowser;' >> /usr/share/applications/firefox.desktop && \
    echo 'MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;' >> /usr/share/applications/firefox.desktop && \
    echo 'StartupWMClass=Firefox' >> /usr/share/applications/firefox.desktop && \
    echo 'StartupNotify=true' >> /usr/share/applications/firefox.desktop && \
    \
    # Script para a facil chamada do Quartus 13 ou 16 atraves do terminal
    echo '#!/bin/bash' > /usr/bin/quartus && \
    echo ' ' >> /usr/bin/quartus && \
    echo 'case ${1} in' >> /usr/bin/quartus && \
    echo '    "-16")' >> /usr/bin/quartus && \
    echo '        VERSAO="16.0"' >> /usr/bin/quartus && \
    echo '        ;;' >> /usr/bin/quartus && \
    echo '    "-h")' >> /usr/bin/quartus && \
    echo '        echo "Use: quartus [-13|-16]."' >> /usr/bin/quartus && \
    echo '        exit 1' >> /usr/bin/quartus && \
    echo '        ;;' >> /usr/bin/quartus && \
    echo '    *)' >> /usr/bin/quartus && \
    echo '        VERSAO="13.0sp1"' >> /usr/bin/quartus && \
    echo '        ;;' >> /usr/bin/quartus && \
    echo 'esac' >> /usr/bin/quartus && \
    echo ' ' >> /usr/bin/quartus && \
    echo 'cd /opt/altera/${VERSAO}/quartus/bin' >> /usr/bin/quartus && \
    echo 'exec ./quartus' >> /usr/bin/quartus && \
    chmod +x /usr/bin/quartus && \
    \
    # Script para inicio do Android Studio, talvez seja removido ja que so foi criado para resolver as permissoes no KVM
    echo '#!/bin/bash' > /usr/local/bin/android-studio && \
    echo ' ' >> /usr/local/bin/android-studio && \
    echo 'sudo chmod 1766 /dev/kvm' >> /usr/local/bin/android-studio && \
    echo '/opt/ANDROID3/android-studio/bin/studio.sh' >> /usr/local/bin/android-studio && \
    chmod 755 /usr/local/bin/android-studio && \
    \
    # Atalho do MatLAb
    echo "[Desktop Entry]" > /usr/share/applications/matlab2015a.desktop && \
    echo "Version=1.0" >> /usr/share/applications/matlab2015a.desktop && \
    echo "Encoding=UTF-8" >> /usr/share/applications/matlab2015a.desktop && \
    echo "Type=Application" >> /usr/share/applications/matlab2015a.desktop && \
    echo "Icon=/opt/matlab/R2015a/matlab_logo_preview.png" >> /usr/share/applications/matlab2015a.desktop && \
    echo "Name=Matlab 2015a" >> /usr/share/applications/matlab2015a.desktop && \
    echo "Comment=Start MATLAB 2015a - The Language of Technical Computing" >> /usr/share/applications/matlab2015a.desktop && \
    echo "Exec=/opt/matlab/R2015a/bin/matlab -desktop" >> /usr/share/applications/matlab2015a.desktop && \
    echo "Terminal=false" >> /usr/share/applications/matlab2015a.desktop && \
    echo "Categories=Development;" >> /usr/share/applications/matlab2015a.desktop && \
    \
    # Atalho do Quartus 13
    echo "[Desktop Entry]" > /usr/share/applications/quartus13.0sp1.desktop && \
    echo "Version=1.0" >> /usr/share/applications/quartus13.0sp1.desktop && \
    echo "Encoding=UTF-8" >> /usr/share/applications/quartus13.0sp1.desktop && \
    echo "Name=Quartus II Subscription Edition v13.0sp1" >> /usr/share/applications/quartus13.0sp1.desktop && \
    echo "Comment=Quartus II design software for Altera FPGA's" >> /usr/share/applications/quartus13.0sp1.desktop && \
    echo "Exec=/opt/altera/13.0sp1/quartus/bin/quartus" >> /usr/share/applications/quartus13.0sp1.desktop && \
    echo "Icon=/opt/altera/13.0sp1/quartus/adm/quartusii.png" >> /usr/share/applications/quartus13.0sp1.desktop && \
    echo "Terminal=true" >> /usr/share/applications/quartus13.0sp1.desktop && \
    echo "Type=Application" >> /usr/share/applications/quartus13.0sp1.desktop && \
    echo "Categories=Development" >> /usr/share/applications/quartus13.0sp1.desktop && \
    \
    # Atalho do Quartus 16
    echo "[Desktop Entry]" > /usr/share/applications/quartus16.0.desktop && \
    echo "Version=1.0" >> /usr/share/applications/quartus16.0.desktop && \
    echo "Encoding=UTF-8" >> /usr/share/applications/quartus16.0.desktop && \
    echo "Name=Quartus II Subscription Edition v16.0" >> /usr/share/applications/quartus16.0.desktop && \
    echo "Comment=Quartus II design software for Altera FPGA's" >> /usr/share/applications/quartus16.0.desktop && \
    echo "Exec=/opt/altera/16.0/quartus/bin/quartus" >> /usr/share/applications/quartus16.0.desktop && \
    echo "Icon=/opt/altera/13.0sp1/quartus/adm/quartusii.png" >> /usr/share/applications/quartus16.0.desktop && \
    echo "Terminal=false" >> /usr/share/applications/quartus16.0.desktop && \
    echo "Type=Application" >> /usr/share/applications/quartus16.0.desktop && \
    echo "Categories=Development" >> /usr/share/applications/quartus16.0.desktop && \
    \
    # Atalho para o Eclipse
    echo "[Desktop Entry]" > /usr/share/applications/eclipsemodificado.desktop && \
    echo "Encoding=UTF-8" >> /usr/share/applications/eclipsemodificado.desktop && \
    echo "Name=Eclipse Modificado" >> /usr/share/applications/eclipsemodificado.desktop && \
    echo "Comment=Eclipse Modificado pelo Arliones" >> /usr/share/applications/eclipsemodificado.desktop && \
    echo "Type=Application" >> /usr/share/applications/eclipsemodificado.desktop && \
    echo "Icon=/opt/eclipse/icon.xpm" >> /usr/share/applications/eclipsemodificado.desktop && \
    echo "Terminal=false" >> /usr/share/applications/eclipsemodificado.desktop && \
    echo "Categories=Development;" >> /usr/share/applications/eclipsemodificado.desktop && \
    echo "StartupNotify=true" >> /usr/share/applications/eclipsemodificado.desktop && \
    echo "Exec=/opt/eclipse/eclipse --launcher.GTK_version 2" >> /usr/share/applications/eclipsemodificado.desktop && \
    echo "Name[pt_BR]=Eclipse Modificado" >> /usr/share/applications/eclipsemodificado.desktop && \
    echo "Comment[pt_BR]=Eclipse Modificado" >> /usr/share/applications/eclipsemodificado.desktop && \
    \
    # Atalho para o Vivaldi, necessario caso o conteiner seja criado em modo nao privilegiado
    echo "[Desktop Entry]" > /usr/share/applications/vivaldi-stable.desktop && \
    echo "Version=1.0" >> /usr/share/applications/vivaldi-stable.desktop && \
    echo "Name=Vivaldi" >> /usr/share/applications/vivaldi-stable.desktop && \
    echo "# Only KDE 4 seems to use GenericName, so we reuse the KDE strings." >> /usr/share/applications/vivaldi-stable.desktop && \
    echo "# From Ubuntu's language-pack-kde-XX-base packages, version 9.04-20090413." >> /usr/share/applications/vivaldi-stable.desktop && \
    echo "GenericName=Web Browser" >> /usr/share/applications/vivaldi-stable.desktop && \
    echo "GenericName[pt]=Navegador Web" >> /usr/share/applications/vivaldi-stable.desktop && \
    echo "GenericName[pt_BR]=Navegador da Internet" >> /usr/share/applications/vivaldi-stable.desktop && \
    echo "GenericName[pt]=Navegador Web" >> /usr/share/applications/vivaldi-stable.desktop && \
    echo "GenericName[pt_BR]=Navegador da Internet" >> /usr/share/applications/vivaldi-stable.desktop && \
    echo "Exec=/usr/bin/vivaldi-stable --no-sandbox %U" >> /usr/share/applications/vivaldi-stable.desktop && \
    echo "Terminal=false" >> /usr/share/applications/vivaldi-stable.desktop && \
    echo "Icon=vivaldi" >> /usr/share/applications/vivaldi-stable.desktop && \
    echo "Type=Application" >> /usr/share/applications/vivaldi-stable.desktop && \
    echo "Categories=Network;WebBrowser;" >> /usr/share/applications/vivaldi-stable.desktop && \
    echo "MimeType=text/html;text/xml;application/xhtml_xml;image/webp;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;" >> /usr/share/applications/vivaldi-stable.desktop && \
    \
    # Atalho do Zoiper
    echo "[Desktop Entry]" >> /usr/share/applications/zoiper3-3.desktop && \
    echo "Type=Application" >> /usr/share/applications/zoiper3-3.desktop && \
    echo "Name=Zoiper Softphone" >> /usr/share/applications/zoiper3-3.desktop && \
    echo "Comment=Zoiper Softphone" >> /usr/share/applications/zoiper3-3.desktop && \
    echo "Exec=/opt/Zoiper64/zoiper" >> /usr/share/applications/zoiper3-3.desktop && \
    echo "Icon=/opt/Zoiper64/zoiper.png" >> /usr/share/applications/zoiper3-3.desktop && \
    echo "Terminal=false" >> /usr/share/applications/zoiper3-3.desktop && \
    echo "MimeType=text/x-arduino" >> /usr/share/applications/zoiper3-3.desktop && \
    echo "Categories=Network;" >> /usr/share/applications/packettracer7.desktop && \
    \
    # Atalho do NetKit
    echo "[Desktop Entry]" > /usr/share/applications/netkit.desktop && \
    echo "Encoding=UTF-8" >> /usr/share/applications/netkit.desktop && \
    echo "Name=Gnome-Netkit2" >> /usr/share/applications/netkit.desktop && \
    echo "Comment=Gnome interface to Netkit" >> /usr/share/applications/netkit.desktop && \
    echo "Type=Application" >> /usr/share/applications/netkit.desktop && \
    echo "Icon=/opt/netkit2/contrib/ifsc.png" >> /usr/share/applications/netkit.desktop && \
    echo "Terminal=false" >> /usr/share/applications/netkit.desktop && \
    echo "Categories=GNOME;Application;Education;" >> /usr/share/applications/netkit.desktop && \
    echo "StartupNotify=true" >> /usr/share/applications/netkit.desktop && \
    echo "Exec=/opt/netkit2/bin/netkit2" >> /usr/share/applications/netkit.desktop && \
    echo "Name[pt_BR]=Netkit2" >> /usr/share/applications/netkit.desktop && \
    echo "Comment[pt_BR]=Gnome interface to Netkit2" >> /usr/share/applications/netkit.desktop && \
    \
    # Atalho do Netbeans
    echo "[Desktop Entry]" >> /usr/share/applications/netbeans-8.2.desktop && \
    echo "Encoding=UTF-8" >> /usr/share/applications/netbeans-8.2.desktop && \
    echo "Name=NetBeans IDE 8.2" >> /usr/share/applications/netbeans-8.2.desktop && \
    echo "Comment=The Smarter Way to Code" >> /usr/share/applications/netbeans-8.2.desktop && \
    echo "Exec=/bin/sh '/opt/netbeans-8.2/bin/netbeans'" >> /usr/share/applications/netbeans-8.2.desktop && \
    echo "Icon=/opt/netbeans-8.2/nb/netbeans.png" >> /usr/share/applications/netbeans-8.2.desktop && \
    echo "Categories=Application;Development;Java;IDE" >> /usr/share/applications/netbeans-8.2.desktop && \
    echo "Version=1.0" >> /usr/share/applications/netbeans-8.2.desktop && \
    echo "Type=Application" >> /usr/share/applications/netbeans-8.2.desktop && \
    echo "Terminal=0" >> /usr/share/applications/netbeans-8.2.desktop && \
    \
    # Atalho do Astah
    echo "[Desktop Entry]" >> /usr/share/applications/astah.desktop && \
    echo "Encoding=UTF-8" >> /usr/share/applications/astah.desktop && \
    echo "Name=Astah Community" >> /usr/share/applications/astah.desktop && \
    echo "Comment=Astah Community" >> /usr/share/applications/astah.desktop && \
    echo "Exec=/opt/astah_community/astah" >> /usr/share/applications/astah.desktop && \
    echo "Icon=/opt/astah_community/astah-community.png" >> /usr/share/applications/astah.desktop && \
    echo "Terminal=false" >> /usr/share/applications/astah.desktop && \
    echo "Type=Application" >> /usr/share/applications/astah.desktop && \
    echo "Categories=Application;Development" >> /usr/share/applications/astah.desktop && \
    \
    # Atalho para o Modelsim, talvez seja removido ja que geralmente e usado junto com o Quartus
    echo "[Desktop Entry]" >> /usr/share/applications/modelsim.desktop && \
    echo "Version=1.0" >> /usr/share/applications/modelsim.desktop && \
    echo "Encoding=UTF-8" >> /usr/share/applications/modelsim.desktop && \
    echo "Name=ModelSim Altera Edition 10.1d" >> /usr/share/applications/modelsim.desktop && \
    echo "Comment=A simulation tool for Altera's FPGA" >> /usr/share/applications/modelsim.desktop && \
    echo "Exec=/opt/altera/13.0sp1/modelsim_ae/linuxaloem/vsim" >> /usr/share/applications/modelsim.desktop && \
    echo "Icon=/opt/altera/13.0sp1/modelsim_ae/modelsim-icon.png" >> /usr/share/applications/modelsim.desktop && \
    echo "Terminal=false" >> /usr/share/applications/modelsim.desktop && \
    echo "Type=Application" >> /usr/share/applications/modelsim.desktop && \
    echo "Categories=Development" >> /usr/share/applications/modelsim.desktop && \
    \
    # Atalho do Musixmatch, sera descontinuado caso o programa nao volte a funcionar
    echo "[Desktop Entry]" > /usr/share/applications/musixmatch.desktop && \
    echo "Name=Musixmatch" >> /usr/share/applications/musixmatch.desktop && \
    echo "Comment=Musixmatch Desktop App" >> /usr/share/applications/musixmatch.desktop && \
    echo "Exec=/opt/Musixmatch/musixmatch" >> /usr/share/applications/musixmatch.desktop && \
    echo "Terminal=false" >> /usr/share/applications/musixmatch.desktop && \
    echo "Type=Application" >> /usr/share/applications/musixmatch.desktop && \
    echo "Icon=musixmatch" >> /usr/share/applications/musixmatch.desktop && \
    echo "Categories=AudioVideo;Video;Player;TV;" >> /usr/share/applications/musixmatch.desktop && \
    \
    # Atalho para o IntelliJ
    echo "[Desktop Entry]" >> /usr/share/applications/idea-IC.desktop && \
    echo "Type=Application" >> /usr/share/applications/idea-IC.desktop && \
    echo "Categories=Development;" >> /usr/share/applications/idea-IC.desktop && \
    echo "Terminal=false" >> /usr/share/applications/idea-IC.desktop && \
    echo "Exec=/opt/idea-IC/bin/idea.sh" >> /usr/share/applications/idea-IC.desktop && \
    echo "Name=Android Studio" >> /usr/share/applications/idea-IC.desktop && \
    echo "Comment=Desenvolvimento de aplicativos para Smartphones Android" >> /usr/share/applications/idea-IC.desktop && \
    echo "Icon=/opt/idea-IC/bin/idea.png" >> /usr/share/applications/idea-IC.desktop && \
    echo "Name[pt_BR]=Idea-IC" >> /usr/share/applications/idea-IC.desktop && \
    \
    # Atalho para o CMaps
    echo "[Desktop Entry]" >> /usr/share/applications/cmap.desktop && \
    echo "Version=1.0" >> /usr/share/applications/cmap.desktop && \
    echo "Encoding=UTF-8" >> /usr/share/applications/cmap.desktop && \
    echo "Name=Cmap Tools" >> /usr/share/applications/cmap.desktop && \
    echo "Comment=Cmap Tools" >> /usr/share/applications/cmap.desktop && \
    echo "Exec=/opt/IHMCCmapTools/bin/CmapTools" >> /usr/share/applications/cmap.desktop && \
    echo "Icon=/opt/IHMCCmapTools/cmap-logo.png" >> /usr/share/applications/cmap.desktop && \
    echo "Terminal=false" >> /usr/share/applications/cmap.desktop && \
    echo "Type=Application" >> /usr/share/applications/cmap.desktop && \
    echo "Categories=Development" >> /usr/share/applications/cmap.desktop && \
    \
    # Atalho para o Android Studio
    echo "#!/usr/bin/env xdg-open" >> /usr/share/applications/android-studio.desktop && \
    echo "[Desktop Entry]" >> /usr/share/applications/android-studio.desktop && \
    echo "Type=Application" >> /usr/share/applications/android-studio.desktop && \
    echo "Categories=Development;" >> /usr/share/applications/android-studio.desktop && \
    echo "Terminal=false" >> /usr/share/applications/android-studio.desktop && \
    echo "Exec=/usr/local/bin/android-studio" >> /usr/share/applications/android-studio.desktop && \
    echo "Name=Android Studio" >> /usr/share/applications/android-studio.desktop && \
    echo "Comment=Desenvolvimento de aplicativos para Smartphones Android" >> /usr/share/applications/android-studio.desktop && \
    echo "Icon=/opt/ANDROID3/android-studio/bin/studio.png" >> /usr/share/applications/android-studio.desktop && \
    \
    # Atalho para a pasta /Trabalhos-compartilhados
    echo "[Desktop Entry]" >> /usr/share/applications/trabalhos-compartilhados.desktop && \
    echo "Version=1.0" >> /usr/share/applications/trabalhos-compartilhados.desktop && \
    echo "Encoding=UTF-8" >> /usr/share/applications/trabalhos-compartilhados.desktop && \
    echo "Name=TRABALHOS COMPARTILHADOS" >> /usr/share/applications/trabalhos-compartilhados.desktop && \
    echo "Comment=Salve seus trabalhos aqui" >> /usr/share/applications/trabalhos-compartilhados.desktop && \
    echo "Exec=caja /Trabalhos-compartilhados" >> /usr/share/applications/trabalhos-compartilhados.desktop && \
    echo "Icon=/usr/share/icons/Adwaita/256x256/devices/drive-harddisk.png" >> /usr/share/applications/trabalhos-compartilhados.desktop && \
    echo "Terminal=true" >> /usr/share/applications/trabalhos-compartilhados.desktop && \
    echo "Type=Application" >> /usr/share/applications/trabalhos-compartilhados.desktop && \
    echo "Categories=System" >> /usr/share/applications/trabalhos-compartilhados.desktop && \
    \
    # Atalho para pasta /Trabalhos
    echo "[Desktop Entry]" >> /usr/share/applications/trabalhos.desktop && \
    echo "Version=1.0" >> /usr/share/applications/trabalhos.desktop && \
    echo "Encoding=UTF-8" >> /usr/share/applications/trabalhos.desktop && \
    echo "Name=SALVE SEUS TRABALHOS AQUI" >> /usr/share/applications/trabalhos.desktop && \
    echo "Comment=Salve seus trabalhos aqui" >> /usr/share/applications/trabalhos.desktop && \
    echo "Exec=caja /Trabalhos" >> /usr/share/applications/trabalhos.desktop && \
    echo "Icon=/usr/share/icons/Adwaita/256x256/devices/drive-harddisk.png" >> /usr/share/applications/trabalhos.desktop && \
    echo "Terminal=true" >> /usr/share/applications/trabalhos.desktop && \
    echo "Type=Application" >> /usr/share/applications/trabalhos.desktop && \
    echo "Categories=System" >> /usr/share/applications/trabalhos.desktop && \
    \
    # Adicionando algumas decalaracoes de variaveis
    echo "export LM_LICENSE_FILE=1800@vm-lan2.sj.ifsc.edu.br" >> /etc/bash.bashrc && \
    echo "export MGLS_LICENSE_FILE=1800@vm-lan2.sj.ifsc.edu.br" >> /etc/bash.bashrc && \
    echo "export LD_LIBRARY_PATH=/opt/altera/13.0sp1/lib32" >> /etc/bash.bashrc && \
    echo "export PATH=$PATH:/etc/omnetpp/bin" >> /etc/bash.bashrc && \
    echo 'IP=`echo $SSH_CONNECTION | cut -f1 -d " "`' >> /etc/bash.bashrc && \
    echo 'echo "O endereço IP desta máquina é $IP"' >> /etc/bash.bashrc && \
    \
    # Variavel do Netkit, definindo o idioma 
    echo 'export NETKIT2_HOME=/opt/netkit2' >> /etc/profile && \
    echo 'export PATH=$NETKIT2_HOME/bin:$PATH' >> /etc/profile && \
    echo 'export LANG=pt_BR.UTF-8' >> /etc/profile && \
    \
    # Regras no arquivo sudoers
    echo 'ALL   ALL=(root) NOPASSWD: SETENV: /opt/netkit2/bin/tap.py' >> /etc/sudoers && \
    echo 'ALL   ALL=(root) NOPASSWD: /usr/bin/traceroute' >> /etc/sudoers && \
    echo 'ALL   ALL=(root) NOPASSWD: SETENV: /usr/local/bin/armazenamento' >> /etc/sudoers && \
    echo 'ALL   ALL=(root) NOPASSWD: /usr/sbin/tcpdump' >> /etc/sudoers && \
    echo 'ALL   ALL=(root) NOPASSWD: /usr/bin/wireshark' >> /etc/sudoers && \
    echo 'ALL   ALL=(root) NOPASSWD: /bin/chmod 1766 /dev/kvm' >> /etc/sudoers && \
    echo 'ALL   ALL=(root) NOPASSWD: SETENV: /usr/local/bin/aviso' >> /etc/sudoers && \
    echo 'ALL   ALL=(root) NOPASSWD: /bin/chmod 1777 /dev/ttyACM*' >> /etc/sudoers && \
    \
    # Script que provavelmente sera descontinuado
    echo "#!/bin/bash" >> /etc/iniciar && \
    echo "" >> /etc/iniciar && \
    echo "rsyslogd" >> /etc/iniciar && \
    echo "/usr/sbin/sshd -D" >> /etc/iniciar && \
    \
    # Ajustes no SSH
    echo "PermitRootLogin prohibit-password" > /etc/ssh/sshd_config && \
    echo "PasswordAuthentication no" >> /etc/ssh/sshd_config && \
    echo "ChallengeResponseAuthentication no" >> /etc/ssh/sshd_config && \
    echo "X11Forwarding yes" >> /etc/ssh/sshd_config && \
    echo "X11UseLocalhost no" >> /etc/ssh/sshd_config && \
    echo "PrintMotd no" >> /etc/ssh/sshd_config && \
    echo "AcceptEnv LANG LC_*" >> /etc/ssh/sshd_config && \
    echo "Subsystem	sftp	/usr/lib/openssh/sftp-server" >> /etc/ssh/sshd_config && \
    \
    # Ajustes no libvirt e no X2Go. No caso do X2Go, sem esse ajuste, algumas aplicacoes nao funcionarao
    sed -i '85s/.*/unix_sock_group = "aluno"/' /etc/libvirt/libvirtd.conf && \
    sed -i '102s/.*/unix_sock_rw_perms = "0770"/' /etc/libvirt/libvirtd.conf && \
    sed -i '35s/.*/#X2GO_NXAGENT_DEFAULT_OPTIONS+=" -extension BIG-REQUESTS"/' /etc/x2go/x2goagent.options && \
    \
    # Ajustes no fuso para BRT
    echo "America/Sao_Paulo" > /etc/timezone && \
    rm -r /etc/localtime && \
    ln -snf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    \
    # Ajustes na localizaco
    echo "pt_BR.UTF-8 UTF-8" > /etc/locale.gen && \
    echo 'LANG="pt_BR.UTF-8"' > /etc/default/locale && \
    dpkg-reconfigure -f noninteractive locales && \
    update-locale LANG=pt_BR.UTF-8 && \
    \
    # Criar pasta .ssh na pasta pessoal do root para a chave publica autorizada
    mkdir /root/.ssh && \
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDtzd/Z0D9Wm0J9rjAnT6QMahtU6rVd8QpSt3FQZgVZqF32og0xKOzdwHHd8CZ+clPLP9gDnJzEAqlEk9jshwJcr0jJ2Q/1M9nn1vkVFcoDJAXxvJSJl8YE9irnm9AtmbAErqM1cDgy31KSf05kisx6mLVL417s85eJ+0IPP9jbBKv2XP+5eu8VELsXHA62RmQYTIxZS6c1vUhYYjCRoWV6GP+hstUaTgv9zeTLJBVK7ZkEFLfRofxTkD4DfWUtQRS//YeQnzBZVpY45MxxZnm3zNyXoZSHC0Nc5Fht8X6y+fMAGrwqOKmyKjdxgqCGvhJHGvkLNhkjBIuIRqnRT7oY/Hov9jMvHekDUw7TSsPVJu79LHOJUDurJDJSSBUrVDUN+bAdDmrDQrAeyrDg4FGnR3hN9pQ0do+iMCSnrgxeiH0qbQp8hvsdl0higkdqgoCl9Ei6U/L3zCnn68zlpn3/RYqttZWD1r4IYdadLrdu6azxzEgja6eXlniNoWu1smzaBEkW9IG8TPoIidaltO3tZsuaGKhZyBwubPxKve4x8+kFvukz3VHo+RnTlJIUuoC1F+/D4UxX8yZMv/in7HT8S7Cq4f+f8VDKTcVKfonIgStsOPYROa+ouyHWBFiKYWJRN2uLbvibwYx1FxaQWOfjbxOGlmjZYCFLbkz0E0Ihjw== joaopedro@sj-lin-labalu-serv-37248" > /root/.ssh/authorized_keys && \
    \
    # Fazendo uma limpeza geral, note que todas a aplicacoes que foram instaladas em /opt sao removidas e por isso devem ser obtidas externamente
    rm -rf /opt/* && \
    apt update && \
    apt clean && \
    apt clean cache && \
    unset DEBIAN_FRONTEND && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/* /root/.bash_history && \
    chmod 1777 /tmp && \
    mkdir /var/run/sshd

ENTRYPOINT  service libvirtd start && rm -rf /var/run/rsyslogd.pid && rsyslogd ; chmod 1766 /dev/kvm ; echo "0 2147483647" > /proc/sys/net/ipv4/ping_group_range ; /usr/sbin/sshd -D
