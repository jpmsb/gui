FROM debian:stretch

MAINTAINER João Pedro Menegali Salvan Bitencourt (joao.ms@aluno.ifsc.edu.br)

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && \
    apt -y -q upgrade && \
    dpkg --add-architecture i386 && \
    apt update && apt -y -q install curl dialog gnupg1 apt-utils htop nload nmap arp-scan wget tar unzip lib32z1 lib32ncurses5 nano vim bzip2 libbz2-1.0 dialog apt-utils locales vlc && \
    curl 'https://pgp.mit.edu/pks/lookup?op=get&search=0xE1F958385BFE2B6E' | apt-key add - && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410 && \
    echo "deb http://packages.x2go.org/debian stretch main" > /etc/apt/sources.list.d/x2go.list && \
    echo "deb-src http://packages.x2go.org/debian stretch main" >> /etc/apt/sources.list.d/x2go.list && \
    echo "deb http://ftp.br.debian.org/debian stretch main contrib non-free" > /etc/apt/sources.list && \
    echo "deb http://ftp.br.debian.org/debian stretch-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://security.debian.org stretch/updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list && \
    echo "deb http://ftp.br.debian.org/debian/ jessie main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list && \
    echo "deb http://ftp.br.debian.org/debian stretch-backports main contrib non-free" >> /etc/apt/sources.list && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt update && \
    apt -y -q install x2go-keyring x2goserver x2goserver-xsession mate-desktop-environment qasmixer qashctl qasconfig pavucontrol  mate-themes libglu1-mesa lib32z1 lib32ncurses5 libfreetype6:i386 libsm6:i386 libxrender1:i386 libfontconfig1:i386 libxext6:i386 okular apt-xapian-index synaptic libreoffice fluidsynth vlc-plugin-fluidsynth qsynth fluid-soundfont-gm audacity gdebi-core libappindicator1 libdbusmenu-glib4 libdbusmenu-gtk4 libindicator7 x2goclient x2gousbmount x2goserver-fmbindings xournal kolourpaint4  oracle-java8-installer oracle-java8-set-default spotify-client fritzing kicad ipython ipython3 glade python-glade2 geogebra latexila dia inkscape kdenlive gimp kile arduino pinta gajim gajim-omemo gajim-triggers gajim-httpupload gajim-urlimagepreview pulseaudio-equalizer pitivi gnuradio gqrx-sdr virt-manager libvirt0 playonlinux wine winetricks libxft2:i386 git clementine r-base r-base-dev less cmake && \
    apt -y -q install -t stretch-backports octave liboctave-dev && \
    apt -y -q install -t jessie libpng12-0:i386 libpng12-0 && \
    echo "deb http://ftp.br.debian.org/debian stretch main contrib non-free" > /etc/apt/sources.list oracle-java8-set-default && \
    echo "deb http://ftp.br.debian.org/debian stretch-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://security.debian.org stretch/updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list && \
    echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list && \
    apt update && \
    wget https://github.com/KELiON/cerebro/releases/download/v0.3.1/cerebro_0.3.1_amd64.deb && \
    dpkg -i cerebro_0.3.1_amd64.deb && \
    rm -r cerebro_0.3.1_amd64.deb && \
    echo '[Desktop Entry]' > /usr/share/applications/firefox.desktop && \
    echo 'Name=Mozilla Firefox' >> /usr/share/applications/firefox.desktop && \
    echo 'Name[pt_BR]=Navegador Web Mozilla Firefox' >> /usr/share/applications/firefox.desktop && \
    echo 'GenericName[pt_BR]=Navegador Web' >> /usr/share/applications/firefox.desktop && \
    echo 'Exec=/opt/firefox/firefox %u' >> /usr/share/applications/firefox.desktop && \
    echo 'Terminal=false' >> /usr/share/applications/firefox.desktop && \
    echo 'X-MultipleArgs=false' >> /usr/share/applications/firefox.desktop && \
    echo 'Type=Application' >> /usr/share/applications/firefox.desktop && \
    echo 'Icon=/opt/firefox/browser/icons/mozicon128.png' >> /usr/share/applications/firefox.desktop && \
    echo 'Categories=Network;WebBrowser;' >> /usr/share/applications/firefox.desktop && \
    echo 'MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;' >> /usr/share/applications/firefox.desktop && \
    echo 'StartupWMClass=Firefox' >> /usr/share/applications/firefox.desktop && \
    echo 'StartupNotify=true' >> /usr/share/applications/firefox.desktop && \
    echo -e '#!/bin/bash\n\ncase ${1} in\n    "-16")\n        VERSAO="16.0"\n        ;;\n    "-h")\n        echo "Use: quartus [-13|-16]."\n        exit 1\n        ;;\n    *)\n        VERSAO="13.0sp1"\n        ;;\nesac\n\ncd /opt/altera/${VERSAO}/quartus/bin\nexec ./quartus' > /usr/bin/quartus && \
    chmod +x /usr/bin/quartus && \
    echo "[Desktop Entry]" > /usr/share/applications/matlab2015a.desktop && \
    echo "Version=1.0" >> /usr/share/applications/matlab2015a.desktop && \
    echo "Encoding=UTF-8" >> /usr/share/applications/matlab2015a.desktop && \
    echo "Type=Application" >> /usr/share/applications/matlab2015a.desktop && \
    echo "Icon=/opt/matlab/matlab_logo_preview.png" >> /usr/share/applications/matlab2015a.desktop && \
    echo "Name=Matlab 2015a" >> /usr/share/applications/matlab2015a.desktop && \
    echo "Comment=Start MATLAB 2015a - The Language of Technical Computing" >> /usr/share/applications/matlab2015a.desktop && \
    echo "Exec=/opt/matlab/R2015a/bin/matlab -desktop" >> /usr/share/applications/matlab2015a.desktop && \
    echo "Terminal=false" >> /usr/share/applications/matlab2015a.desktop && \
    echo "Categories=Development;" >> /usr/share/applications/matlab2015a.desktop && \
    echo "[Desktop Entry]" > /usr/share/applications/quartus13.0sp1.desktop && \
    echo "Version=1.0" >> /usr/share/applications/quartus13.0sp1.desktop && \
    echo "Encoding=UTF-8" >> /usr/share/applications/quartus13.0sp1.desktop && \
    echo "Name=Quartus II Subscription Edition v13.0sp1" >> /usr/share/applications/quartus13.0sp1.desktop && \
    echo "Comment=Quartus II design software for Altera FPGA's" >> /usr/share/applications/quartus13.0sp1.desktop && \
    echo "Exec=/opt/altera/13.0sp1/quartus/bin/quartus" >> /usr/share/applications/quartus13.0sp1.desktop && \
    echo "Icon=/opt/altera/13.0sp1/quartus/adm/quartusii.png" >> /usr/share/applications/quartus13.0sp1.desktop && \
    echo "Terminal=false" >> /usr/share/applications/quartus13.0sp1.desktop && \
    echo "Type=Application" >> /usr/share/applications/quartus13.0sp1.desktop && \
    echo "Categories=Development" >> /usr/share/applications/quartus13.0sp1.desktop && \
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
    echo "export LM_LICENSE_FILE=1800@vm-lan2.sj.ifsc.edu.br" >> /etc/bash.bashrc && \
    echo "export MGLS_LICENSE_FILE=1800@vm-lan2.sj.ifsc.edu.br" >> /etc/bash.bashrc && \
    echo "export LD_LIBRARY_PATH=/opt/altera/13.0sp1/lib32" >> /etc/bash.bashrc && \
    echo "export PATH=$PATH:/etc/omnetpp/bin" >> /etc/bash.bashrc && \
    echo 'IP=`echo $SSH_CONNECTION | cut -f1 -d " "`' >> /etc/bash.bashrc && \
    echo 'O endereço IP desta máquina é $IP' >> /etc/bash.bashrc && \
    echo "America/Sao_Paulo" > /etc/timezone && \
    rm -r /etc/localtime && \
    ln -snf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    echo "pt_BR.UTF-8 UTF-8" > /etc/locale.gen && \
    echo 'LANG="pt_BR.UTF-8"' > /etc/default/locale && \
    dpkg-reconfigure -f noninteractive locales && \
    update-locale LANG=pt_BR.UTF-8 && \
    apt update && \
    apt clean && \
    apt clean cache && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/* /root/.bash_history && \
    mkdir /var/run/sshd

CMD ["/usr/sbin/sshd", "-D"]
