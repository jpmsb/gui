FROM debian:stretch

MAINTAINER João Pedro Menegali Salvan Bitencourt (joao.ms@aluno.ifsc.edu.br)

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && \
    apt -y -q upgrade && \
    dpkg --add-architecture i386 && \
    apt update && apt -y -q install curl dialog gnupg1 apt-utils htop nload nmap arp-scan wget tar unzip lib32z1 lib32ncurses5 nano vim bzip2 libbz2-1.0 locales vlc wireshark gdb tcpdump apt-transport-https traceroute speedtest-cli telnet iperf whois libc6-i386 && \
    apt-key adv --recv-keys --keyserver keys.gnupg.net E1F958385BFE2B6E && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410 && \
    wget -O - http://repo.vivaldi.com/stable/linux_signing_key.pub | apt-key add - && \
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    wget -q -O - https://deb.opera.com/archive.key | apt-key add - && \
    wget -q -O - http://archive.raspberrypi.org/debian/raspberrypi.gpg.key | apt-key add - && \
    echo "deb https://deb.opera.com/opera-stable/ stable non-free" > /etc/apt/sources.list.d/opera.list && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
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
    apt -y -q install x2go-keyring x2goserver x2goserver-xsession mate-desktop-environment qasmixer qashctl qasconfig pavucontrol mate-themes libglu1-mesa lib32z1 lib32ncurses5 libfreetype6:i386 libsm6:i386 libxrender1:i386 libfontconfig1:i386 libxext6:i386 okular apt-xapian-index synaptic libreoffice libreoffice-l10n-pt-br fluidsynth vlc-plugin-fluidsynth qsynth fluid-soundfont-gm audacity gdebi-core libappindicator1 libdbusmenu-glib4 libdbusmenu-gtk4 libindicator7 x2goclient x2gousbmount x2goserver-fmbindings xournal kolourpaint4 oracle-java8-installer oracle-java8-set-default spotify-client fritzing fritzing-data fritzing-parts kicad ipython ipython3 glade python-glade2 geogebra latexila dia inkscape kdenlive gimp kile arduino pinta gajim gajim-omemo gajim-triggers gajim-httpupload gajim-urlimagepreview pulseaudio-equalizer pitivi gnuradio gqrx-sdr virt-manager libvirt0 playonlinux wine winetricks libxft2:i386 git clementine r-base r-base-dev less cmake libpng16-16 libpng16-16:i386 vivaldi-stable unrar cutecom graphviz python-vte bridge-utils uml-utilities ipython3-qtconsole scratch squeak-vm squeak-plugins-scratch geany mcu8051ide qt4-designer spyder3 kalzium logisim grass tracker wxmaxima prerex vprerex rsyslog pcb maxima cantor google-chrome-stable opera-stable googleearth-package hexchat hexchat-otr hexchat-perl hexchat-plugins hexchat-python3 qgis qgis-common qgis-providers-common qgis-server ipython-qtconsole distcc nemiver mysql-workbench && \
    apt -y -q install -t stretch-backports octave liboctave-dev && \
    cp /usr/lib/i386-linux-gnu/libpng16.so.16 /lib/i386-linux-gnu/libpng12.so.0 && \
    cp /usr/lib/x86_64-linux-gnu/libpng16.so.16 /lib/x86_64-linux-gnu/libpng12.so.0 && \
    apt -y -q purge wireshark wireshark-common && \
    apt -y -q install -t jessie libssl1.0.0 wireshark wireshark-common eagle && \ 
    apt -y -q install -t wheezy libpng12-0 libpng12-0:i386 && \
    ldconfig && \
    echo "deb http://ftp.br.debian.org/debian stretch main contrib non-free" > /etc/apt/sources.list oracle-java8-set-default && \
    echo "deb http://ftp.br.debian.org/debian stretch-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://security.debian.org stretch/updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list && \
    echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list && \
    echo "deb http://archive.raspberrypi.org/debian/ stretch main ui" > /etc/apt/sources.list.d/raspi.list && \
    apt update && \
    wget https://github.com/KELiON/cerebro/releases/download/v0.3.1/cerebro_0.3.1_amd64.deb && \
    dpkg -i cerebro_0.3.1_amd64.deb && \
    rm -r cerebro_0.3.1_amd64.deb && \
    wget 10.10.10.112/musixmatch_0.19.4_amd64.deb && \
    bash -c 'echo -e "y\n" |gdebi musixmatch_0.19.4_amd64.deb' && \
    rm musixmatch_0.19.4_amd64.deb && \
    wget 10.10.10.112/google-earth-stable_current_amd64.deb && \
    dpkg -i google-earth-stable_current_amd64.deb && \
    rm google-earth-stable_current_amd64.deb && \
    wget https://download1.rstudio.org/rstudio-xenial-1.1.453-amd64.deb && \
    dpkg -i rstudio-xenial-1.1.453-amd64.deb && \
    rm -r rstudio-xenial-1.1.453-amd64.deb && \
    wget https://code-industry.net/public/master-pdf-editor-5.0.23_qt5.amd64.deb && \
    bash -c 'echo -e "y\n" |gdebi master-pdf-editor-5.0.23_qt5.amd64.deb' && \
    rm -r master-pdf-editor-5.0.23_qt5.amd64.deb && \
    wget 10.10.10.112/armazenamento-mate -O /usr/local/bin/armazenamento && \
    chmod 700 /usr/local/bin/armazenamento && \
    wget 10.10.10.112/Ftool.exe -O /usr/local/bin/Ftool.exe && \
    wget 10.10.10.112/ftoolicon.png -O /usr/share/icons/ftoolicon.png && \
    wget 10.10.10.112/ftool.desktop -O /usr/share/applications/ftool.desktop && \
    apt -y -q install mu && \
    echo "# deb http://archive.raspberrypi.org/debian/ stretch main ui" > /etc/apt/sources.list.d/raspi.list && \
    apt update && \
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
    echo '#!/bin/bash' > /usr/local/bin/android-studio && \
    echo ' ' >> /usr/local/bin/android-studio && \
    echo 'sudo chmod 1766 /dev/kvm' >> /usr/local/bin/android-studio && \
    echo '/opt/ANDROID3/android-studio/bin/studio.sh' >> /usr/local/bin/android-studio && \
    chmod 755 /usr/local/bin/android-studio && \
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
    echo "Icon=/opt/Zoiper64/zoiper.png" >> /usr/share/applications/zoiper3-3.desktop && \
    echo "Terminal=false" >> /usr/share/applications/zoiper3-3.desktop && \
    echo "MimeType=text/x-arduino" >> /usr/share/applications/zoiper3-3.desktop && \
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
    echo "[Desktop Entry]" >> /usr/share/applications/astah.desktop && \
    echo "Encoding=UTF-8" >> /usr/share/applications/astah.desktop && \
    echo "Name=Astah Community" >> /usr/share/applications/astah.desktop && \
    echo "Comment=Astah Community" >> /usr/share/applications/astah.desktop && \
    echo "Exec=/opt/astah_community/astah" >> /usr/share/applications/astah.desktop && \
    echo "Icon=/opt/astah_community/astah-community.png" >> /usr/share/applications/astah.desktop && \
    echo "Terminal=false" >> /usr/share/applications/astah.desktop && \
    echo "Type=Application" >> /usr/share/applications/astah.desktop && \
    echo "Categories=Application;Development" >> /usr/share/applications/astah.desktop && \
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
    echo "[Desktop Entry]" > /usr/share/applications/musixmatch.desktop && \
    echo "Name=Musixmatch" >> /usr/share/applications/musixmatch.desktop && \
    echo "Comment=Musixmatch Desktop App" >> /usr/share/applications/musixmatch.desktop && \
    echo "Exec=/opt/Musixmatch/musixmatch" >> /usr/share/applications/musixmatch.desktop && \
    echo "Terminal=false" >> /usr/share/applications/musixmatch.desktop && \
    echo "Type=Application" >> /usr/share/applications/musixmatch.desktop && \
    echo "Icon=musixmatch" >> /usr/share/applications/musixmatch.desktop && \
    echo "Categories=AudioVideo;Video;Player;TV;" >> /usr/share/applications/musixmatch.desktop && \
    echo "[Desktop Entry]" >> /usr/share/applications/idea-IC.desktop && \
    echo "Type=Application" >> /usr/share/applications/idea-IC.desktop && \
    echo "Categories=Development;" >> /usr/share/applications/idea-IC.desktop && \
    echo "Terminal=false" >> /usr/share/applications/idea-IC.desktop && \
    echo "Exec=/opt/idea-IC/bin/idea.sh" >> /usr/share/applications/idea-IC.desktop && \
    echo "Name=Android Studio" >> /usr/share/applications/idea-IC.desktop && \
    echo "Comment=Desenvolvimento de aplicativos para Smartphones Android" >> /usr/share/applications/idea-IC.desktop && \
    echo "Icon=/opt/idea-IC/bin/idea.png" >> /usr/share/applications/idea-IC.desktop && \
    echo "Name[pt_BR]=Idea-IC" >> /usr/share/applications/idea-IC.desktop && \
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
    echo "#!/usr/bin/env xdg-open" >> /usr/share/applications/android-studio.desktop && \
    echo "[Desktop Entry]" >> /usr/share/applications/android-studio.desktop && \
    echo "Type=Application" >> /usr/share/applications/android-studio.desktop && \
    echo "Categories=Development;" >> /usr/share/applications/android-studio.desktop && \
    echo "Terminal=false" >> /usr/share/applications/android-studio.desktop && \
    echo "Exec=/usr/local/bin/android-studio" >> /usr/share/applications/android-studio.desktop && \
    echo "Name=Android Studio" >> /usr/share/applications/android-studio.desktop && \
    echo "Comment=Desenvolvimento de aplicativos para Smartphones Android" >> /usr/share/applications/android-studio.desktop && \
    echo "Icon=/opt/ANDROID3/android-studio/bin/studio.png" >> /usr/share/applications/android-studio.desktop && \
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
    echo "export LM_LICENSE_FILE=1800@vm-lan2.sj.ifsc.edu.br" >> /etc/bash.bashrc && \
    echo "export MGLS_LICENSE_FILE=1800@vm-lan2.sj.ifsc.edu.br" >> /etc/bash.bashrc && \
    echo "export LD_LIBRARY_PATH=/opt/altera/13.0sp1/lib32" >> /etc/bash.bashrc && \
    echo "export PATH=$PATH:/etc/omnetpp/bin" >> /etc/bash.bashrc && \
    echo 'IP=`echo $SSH_CONNECTION | cut -f1 -d " "`' >> /etc/bash.bashrc && \
    echo 'echo "O endereço IP desta máquina é $IP"' >> /etc/bash.bashrc && \
    echo "America/Sao_Paulo" > /etc/timezone && \
    echo 'export NETKIT2_HOME=/opt/netkit2' >> /etc/profile && \
    echo 'export PATH=$NETKIT2_HOME/bin:$PATH' >> /etc/profile && \
    echo 'export LANG=pt_BR.UTF-8' >> /etc/profile && \
    echo 'ALL   ALL=(root) NOPASSWD: SETENV: /opt/netkit2/bin/tap.py' >> /etc/sudoers && \
    echo 'ALL   ALL=(root) NOPASSWD: /usr/bin/traceroute' >> /etc/sudoers && \
    echo 'ALL   ALL=(root) NOPASSWD: SETENV: /usr/local/bin/armazenamento' >> /etc/sudoers && \
    echo 'ALL   ALL=(root) NOPASSWD: /usr/sbin/tcpdump' >> /etc/sudoers && \
    echo 'ALL   ALL=(root) NOPASSWD: /usr/bin/wireshark' >> /etc/sudoers && \
    echo 'ALL   ALL=(root) NOPASSWD: /bin/chmod 1766 /dev/kvm' >> /etc/sudoers && \
    echo "#!/bin/bash" >> /etc/iniciar && \
    echo "" >> /etc/iniciar && \
    echo "rsyslogd" >> /etc/iniciar && \
    echo "/usr/sbin/sshd -D" >> /etc/iniciar && \
    echo "PermitRootLogin prohibit-password" > /etc/ssh/sshd_config && \
    echo "PasswordAuthentication no" >> /etc/ssh/sshd_config && \
    echo "ChallengeResponseAuthentication no" >> /etc/ssh/sshd_config && \
    echo "X11Forwarding yes" >> /etc/ssh/sshd_config && \
    echo "PrintMotd no" >> /etc/ssh/sshd_config && \
    echo "AcceptEnv LANG LC_*" >> /etc/ssh/sshd_config && \
    echo "Subsystem	sftp	/usr/lib/openssh/sftp-server" >> /etc/ssh/sshd_config && \
    sed -i '85s/.*/unix_sock_group = "libvirt"/' /etc/libvirt/libvirtd.conf && \
    sed -i '102s/.*/unix_sock_rw_perms = "0770"/' /etc/libvirt/libvirtd.conf && \
    rm -r /etc/localtime && \
    ln -snf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    echo "pt_BR.UTF-8 UTF-8" > /etc/locale.gen && \
    echo 'LANG="pt_BR.UTF-8"' > /etc/default/locale && \
    dpkg-reconfigure -f noninteractive locales && \
    update-locale LANG=pt_BR.UTF-8 && \
    mkdir /root/.ssh && \
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDtzd/Z0D9Wm0J9rjAnT6QMahtU6rVd8QpSt3FQZgVZqF32og0xKOzdwHHd8CZ+clPLP9gDnJzEAqlEk9jshwJcr0jJ2Q/1M9nn1vkVFcoDJAXxvJSJl8YE9irnm9AtmbAErqM1cDgy31KSf05kisx6mLVL417s85eJ+0IPP9jbBKv2XP+5eu8VELsXHA62RmQYTIxZS6c1vUhYYjCRoWV6GP+hstUaTgv9zeTLJBVK7ZkEFLfRofxTkD4DfWUtQRS//YeQnzBZVpY45MxxZnm3zNyXoZSHC0Nc5Fht8X6y+fMAGrwqOKmyKjdxgqCGvhJHGvkLNhkjBIuIRqnRT7oY/Hov9jMvHekDUw7TSsPVJu79LHOJUDurJDJSSBUrVDUN+bAdDmrDQrAeyrDg4FGnR3hN9pQ0do+iMCSnrgxeiH0qbQp8hvsdl0higkdqgoCl9Ei6U/L3zCnn68zlpn3/RYqttZWD1r4IYdadLrdu6azxzEgja6eXlniNoWu1smzaBEkW9IG8TPoIidaltO3tZsuaGKhZyBwubPxKve4x8+kFvukz3VHo+RnTlJIUuoC1F+/D4UxX8yZMv/in7HT8S7Cq4f+f8VDKTcVKfonIgStsOPYROa+ouyHWBFiKYWJRN2uLbvibwYx1FxaQWOfjbxOGlmjZYCFLbkz0E0Ihjw== joaopedro@sj-lin-labalu-serv-37248" > /root/.ssh/authorized_keys && \
    apt update && \
    apt clean && \
    apt clean cache && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/* /root/.bash_history && \
    mkdir /var/run/sshd

ENTRYPOINT rm -rf /var/run/rsyslogd.pid && rsyslogd && service libvirtd start && /usr/sbin/sshd -D
