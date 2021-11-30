#!/bin/bash
clear
#!/bin/bash
clear
# Script de Instalação customizada do Asterisk 18 no CentOS7
# Autor: Leandro Giampauli

asd() {
cat <<"EOT"
 _____                       _   _
/  ___|                     | \ | |
\ `--. _   _ _ __   ___ _ __|  \| | _____   ____ _
 `--. \ | | | '_ \ / _ \ '__| . ` |/ _ \ \ / / _` |
/\__/ / |_| | |_) |  __/ |  | |\  | (_) \ V / (_| |
\____/ \__,_| .__/ \___|_|  \_| \_/\___/ \_/ \__,_|
            | |
            |_|
EOT
}
asd

# Script de Instalação customizada do Asterisk 18 no CentOS7
# Autor: Leandro Giampauli 
echo "                                                           "
echo "======================================================================================="
echo "# Script de Instalação customizada Asterisk 18 no CentOS7"
echo "# Autor: Leandro Giampauli"
echo "# Atualização e das dependencias e Update do Linux"
echo "# Desabilitando SELINUX"
echo "# Desabilitando IPV6"
echo "# Instalando Ferramentas Uteis"
echo "# Instalação do SNGREP"
echo "# Instalação do PJSIP"
echo "# Instalação do  Asterisk 18"
echo "======================================================================================="
sleep 10

echo ""
yum update -y
yum install epel-release -y
yum install cowsay -y
echo ""
clear


#============================================================================================
#DESABILITANDO SELINUX"
#============================================================================================

echo ""
cowsay -f tux "DESABILITANDO SELINUX"
echo ""
sleep 5
sed -i 's/\(^SELINUX=\).*/\SELINUX=disabled/' /etc/sysconfig/selinux
sed -i 's/\(^SELINUX=\).*/\SELINUX=disabled/' /etc/selinux/config
setenforce 0
clear

#============================================================================================
#DESABILITANDO IPV6
#============================================================================================

echo ""
cowsay -f tux "DESABILITANDO IPV6"
echo ""
echo "net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
echo ""
cowsay "ATUALIZANDO O SISTEMA OPERACIONAL"
echo ""
sleep 5
yum -y update
clear

#============================================================================================
# INSTALANDO FERRAMENTAS UTEIS.
#============================================================================================

echo ""
cowsay -f tux  "INSTALANDO FERRAMENTAS UTEIS..."
echo ""
sleep 5
yum install -y wget mtr vim mlocate nmap telnet tcpdump mc nano lynx rsync screen htop subversion deltarpm net-tools ntsysv minicom net-tools vim wget
yum -y groupinstall core base "Development Tools"
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --reload
yum remove -y php*
yum install -y php56w php56w-pdo php56w-mysql php56w-mbstring php56w-pear php56w-process php56w-xml php56w-opcache php56w-ldap php56w-intl php56w-soap
yum install vim epel-release gcc gcc-c++ wget make bzip2 patch subversion json-c json-c-devel unixODBC unixODBC-devel mysql-connector-odbc libtool-ltdl libtool-ltdl-devel jansson-devel libsrtp-devel openssl openssl-devel dmidecode ncurses-devel libxml2-devel newt-devel kernel-devel sqlite-devel libuuid-devel gtk2-devel binutils-devel libedit libedit-devel svn
yum install -y unixODBC unixODBC-devel mysql-connector-odbc libtool-ltdl libtool-ltdl-devel


systemctl enable mariadb.service
systemctl start mariadb
clear
yum clean all
yum makecache
yum update -y


#===========================================================================================
echo "Instação Completa"
#===========================================================================================
sleep 5

clear
#============================================================================================
# Instalação do SNGREP
#============================================================================================

echo ""
cowsay -f tux "INSTALANDO SNGREP"
echo ""
sleep 5
echo '[irontec]
name=Irontec RPMs repository
baseurl=http://packages.irontec.com/centos/$releasever/$basearch/
gpgcheck=0
' > /etc/yum.repos.d/irontec.repo
rpm --import http://packages.irontec.com/public.key
yum install sngrep -y


#===========================================================================================
echo "Instação Completa"
#===========================================================================================
sleep 5
clear

#============================================================================================
# Instalação do PSSIP
#============================================================================================

echo ""
cowsay -f tux  "Instalação do PSSIP"
echo ""

cd /usr/src/
wget https://github.com/pjsip/pjproject/archive/2.10.tar.gz
tar zxvf 2.10.tar.gz
rm -f 2.10.tar.gz
cd pjproject-*
./configure CFLAGS="-DNDEBUG -DPJ_HAS_IPV6=1" --prefix=/usr --libdir=/usr/lib64 --enable-shared --disable-video --disable-sound --disable-opencore-amr
make dep
make
make install
ldconfig

#===========================================================================================
echo "Instalação Completa"
#===========================================================================================
sleep 5
clear

#============================================================================================
echo Instalação do Asterisk 18
#============================================================================================

cd /usr/src/
wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-18-current.tar.gz
tar xvfz asterisk-18-current.tar.gz
rm -f asterisk-18-current.tar.gz
cd /usr/src/asterisk-*
contrib/scripts/install_prereq install
./configure --libdir=/usr/lib64 --with-jansson-bundled
make menuselect.makeopts
 menuselect/menuselect --enable chan_ooh323 --enable format_mp3 --enable CORE-SOUNDS-JA-WAV --enable CORE-SOUNDS-JA-ULAW --enable CORE-SOUNDS-JA-ALAW --enable CORE-SOUNDS-JA-GSM --enable CORE-SOUNDS-JA-G729 --enable CORE-SOUNDS-JA-G722 --enable CORE-SOUNDS-JA-SLN16 --enable CORE-SOUNDS-JA-SIREN7 --enable CORE-SOUNDS-JA-SIREN14 --enable app_macro --disable BUILD_NATIVE
contrib/scripts/get_mp3_source.sh
make
make install
make samples
make config
ldconfig
sleep 1

echo  "Colocando Asterisk, na incialização"...

sudo systemctl enable asterisk
sudo systemctl enable asterisk



#===========================================================================================
echo "Instalação Completa"
#===========================================================================================
sleep 5
clear








echo -e "\033[40;31m======================================================================================================================================== \033[1m"
echo -e "\033[40;31m Instação do Asterisk 18 Realizada com Sucesso \033[1m"
echo -e "\033[40;31m======================================================================================================================================== \033[1m"
echo -e "\033[40;31mSEU SISTEMA IRA REINICIAR EM 15s (PRESSIONE CTRL+C PARA RENICIAR MANUALMENTE) \033[1m"
echo -e "\033[40;31m======================================================================================================================================== \033[0m"
sleep 15
reboot

