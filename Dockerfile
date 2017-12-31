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
    wget -O - http://repo.vivaldi.com/stable/linux_signing_key.pub | apt-key add - && \
    echo "deb http://repo.vivaldi.com/stable/deb/ stable main" > /etc/apt/sources.list.d/vivaldi.list && \
    echo "deb http://packages.x2go.org/debian stretch main" > /etc/apt/sources.list.d/x2go.list && \
    echo "deb-src http://packages.x2go.org/debian stretch main" >> /etc/apt/sources.list.d/x2go.list && \
    echo "deb http://ftp.br.debian.org/debian stretch main contrib non-free" > /etc/apt/sources.list && \
    echo "deb http://ftp.br.debian.org/debian stretch-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://security.debian.org stretch/updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list && \
    echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list && \
    echo "deb http://ftp.br.debian.org/debian stretch-backports main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://ftp.br.debian.org/debian/ jessie main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://ftp.br.debian.org/debian/ wheezy main" >> /etc/apt/sources.list && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt update && \
    apt -y -q install x2go-keyring x2goserver x2goserver-xsession mate-desktop-environment qasmixer qashctl qasconfig pavucontrol mate-themes libglu1-mesa lib32z1 lib32ncurses5 libfreetype6:i386 libsm6:i386 libxrender1:i386 libfontconfig1:i386 libxext6:i386 okular apt-xapian-index synaptic libreoffice libreoffice-l10n-pt-br fluidsynth vlc-plugin-fluidsynth qsynth fluid-soundfont-gm audacity gdebi-core libappindicator1 libdbusmenu-glib4 libdbusmenu-gtk4 libindicator7 x2goclient x2gousbmount x2goserver-fmbindings xournal kolourpaint4 oracle-java8-installer oracle-java8-set-default spotify-client fritzing kicad ipython ipython3 glade python-glade2 geogebra latexila dia inkscape kdenlive gimp kile arduino pinta gajim gajim-omemo gajim-triggers gajim-httpupload gajim-urlimagepreview pulseaudio-equalizer pitivi gnuradio gqrx-sdr virt-manager libvirt0 playonlinux wine winetricks libxft2:i386 git clementine r-base r-base-dev less cmake libpng16-16 libpng16-16:i386 vivaldi-stable unrar cutecom && \
    apt -y -q install -t stretch-backports octave liboctave-dev && \
    cp /usr/lib/i386-linux-gnu/libpng16.so.16 /lib/i386-linux-gnu/libpng12.so.0 && \
    cp /usr/lib/x86_64-linux-gnu/libpng16.so.16 /lib/x86_64-linux-gnu/libpng12.so.0 && \
    apt -y -q install -t jessie libssl1.0.0 && \ 
    apt -y -q install -t wheezy libpng12-0 libpng12-0:i386 && \
    ldconfig && \
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
    echo "[Desktop Entry]" >> /usr/share/applications/zoiper3-3.desktop && \
    echo "Type=Application" >> /usr/share/applications/zoiper3-3.desktop && \
    echo "Name=Zoiper Softphone" >> /usr/share/applications/zoiper3-3.desktop && \
    echo "Comment=Zoiper Softphone" >> /usr/share/applications/zoiper3-3.desktop && \
    echo "Exec=/opt/Zoiper64/zoiper" >> /usr/share/applications/zoiper3-3.desktop && \
    echo "Icon=/usr/share/pixmaps/zoiper.png" >> /usr/share/applications/zoiper3-3.desktop && \
    echo "Terminal=false" >> /usr/share/applications/zoiper3-3.desktop && \
    echo "MimeType=text/x-arduino" >> /usr/share/applications/zoiper3-3.desktop && \
    echo "export LM_LICENSE_FILE=1800@vm-lan2.sj.ifsc.edu.br" >> /etc/bash.bashrc && \
    echo "export MGLS_LICENSE_FILE=1800@vm-lan2.sj.ifsc.edu.br" >> /etc/bash.bashrc && \
    echo "export LD_LIBRARY_PATH=/opt/altera/13.0sp1/lib32" >> /etc/bash.bashrc && \
    echo "export PATH=$PATH:/etc/omnetpp/bin" >> /etc/bash.bashrc && \
    echo 'IP=`echo $SSH_CONNECTION | cut -f1 -d " "`' >> /etc/bash.bashrc && \
    echo 'echo "O endereço IP desta máquina é $IP"' >> /etc/bash.bashrc && \
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
