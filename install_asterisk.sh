teste gii

#!/bin/bash
clear
#!/bin/bash
clear
# Script de Instalação customizada do Asterisk 18 no CentOS7
# Autor: Leandro Giampauli

asd() {
cat <<"EOT"

___  ___        _  _    _ ______  _         _  _           _ 
|  \/  |       | || |  (_)|  _  \(_)       (_)| |         | |
| .  . | _   _ | || |_  _ | | | | _   __ _  _ | |_   __ _ | |
| |\/| || | | || || __|| || | | || | / _` || || __| / _` || |
| |  | || |_| || || |_ | || |/ / | || (_| || || |_ | (_| || |
\_|  |_/ \__,_||_| \__||_||___/  |_| \__, ||_| \__| \__,_||_|
                                      __/ |                  
                                     |___/                   
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
echo "# Instalação do MariaDB Ver. 10.3"
echo "# Instalação OBDC MariaDB"
echo "# Instalação do CSF"
echo "# Instalação do PJSIP"
echo "# Instalação do  Asterisk 18"
echo "# INSTALANDO TRATAMENTO HANGUPCAUSE"
echo "# INSTALANDO AUDIO EM PORTUGUÊS BRASIL"


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
sleep 2

sed -i 's/\(^SELINUX=\).*/\SELINUX=disabled/' /etc/sysconfig/selinux
sed -i 's/\(^SELINUX=\).*/\SELINUX=disabled/' /etc/selinux/config
setenforce 0


echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m SELINUX DESABILITADO COM SUCESSO \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"

sleep 5
clear


#============================================================================================
#DESABILITANDO IPV6
#============================================================================================
echo ""
cowsay -f tux "DESABILITANDO IPV6"
echo ""
sleep 5

echo "net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
echo ""
cowsay "ATUALIZANDO O SISTEMA OPERACIONAL"
echo ""
yum -y update
sleep 1
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m IPV6 DESABILITADO COM SUCESSO \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"
sleep 5
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
yum install -y vim epel-release gcc gcc-c++ wget make bzip2 patch subversion json-c json-c-devel unixODBC unixODBC-devel mysql-connector-odbc libtool-ltdl libtool-ltdl-devel jansson-devel libsrtp-devel openssl openssl-devel dmidecode ncurses-devel libxml2-devel newt-devel kernel-devel sqlite-devel libuuid-devel gtk2-devel binutils-devel libedit libedit-devel svn
yum install -y unixODBC unixODBC-devel mysql-connector-odbc libtool-ltdl libtool-ltdl-devel
yum install -y vim perl-libwww-perl.noarch perl-Time-HiRes
yum install -y alpine-sdk cmake unixodbc-dev openssl-dev
yum clean all
yum makecache
yum update -y
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m Instalação Completa \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"
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
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m Instalação Completa \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"
sleep 5
clear



#============================================================================================
# Instalação do MariaDB Ver. 10.3
#============================================================================================
echo ""
cowsay -f tux "Instalação do MariaDB Ver. 10.3"
echo ""
sleep 5

echo '[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.3/centos73-amd64/
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1' > /etc/yum.repos.d/mariadb.repo

yum install -y MariaDB-server MariaDB-client
systemctl enable mariadb.service
systemctl start mariadb

echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m Instalação Completa \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"
sleep 5
clear

#============================================================================================
# Instalação OBDC MariaDB
#============================================================================================
echo ""
cowsay -f tux "Instalação OBDC MariaDB"
echo ""
sleep 5

cd /usr/src
mkdir odbc_package
cd odbc_package/
wget https://downloads.mariadb.com/Connectors/odbc/connector-odbc-3.1.7/mariadb-connector-odbc-3.1.7-ga-rhel7-x86_64.tar.gz
tar -xvzf mariadb-connector-odbc-3.1.7-ga-rhel7-x86_64.tar.gz
sudo install lib64/libmaodbc.so /usr/lib64/
sudo install -d /usr/lib64/mariadb/
sudo install -d /usr/lib64/mariadb/plugin/
sudo install lib64/mariadb/plugin/auth_gssapi_client.so /usr/lib64/mariadb/plugin/
sudo install lib64/mariadb/plugin/caching_sha2_password.so /usr/lib64/mariadb/plugin/
sudo install lib64/mariadb/plugin/client_ed25519.so /usr/lib64/mariadb/plugin/
sudo install lib64/mariadb/plugin/dialog.so /usr/lib64/mariadb/plugin/
sudo install lib64/mariadb/plugin/mysql_clear_password.so /usr/lib64/mariadb/plugin/
sudo install lib64/mariadb/plugin/sha256_password.so /usr/lib64/mariadb/plugin/

echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m Instalação Completa \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"
sleep 5
clear


#============================================================================================
# Instalação do CSF
#============================================================================================
echo ""
cowsay -f tux "Instalação do CSF"
echo ""
sleep 5

cd /usr/src/
wget https://download.configserver.com/csf.tgz
tar -xzf csf.tgz
cd csf
sh install.sh
clear

sleep 2
echo ""
cowsay -f tux "Teste do CSF"
echo ""

cd /usr/local/csf/bin/
perl csftest.pl
sleep 2
clear

echo ""
cowsay -f tux "Desabilitado Firewall Padrão Linux"
echo ""
sleep 1


systemctl stop firewalld
systemctl disable firewalld
sleep 2
clear

echo ""
cowsay -f tux "Startando Serviço CSF"
echo ""
sleep 5


systemctl start csf
systemctl start lfd
sleep 2
clear

echo ""
cowsay -f tux "Startando Serviço CSF"
echo ""
sleep 3

systemctl enable csf
systemctl enable lfd

echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m Instalação Completa \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"
sleep 5
clear


#============================================================================================
# Instalação do PJSIP
#============================================================================================
echo ""
cowsay -f tux  "Instalação do PJSIP"
echo ""
sleep 5

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

echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m Instalação Completa \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"
sleep 5
clear



#============================================================================================
# Instalação do Asterisk 18
#============================================================================================
echo ""
cowsay -f tux  "Instalação do Asterisk 18"
echo ""
sleep 5


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
sleep 1

sudo systemctl enable asterisk
sudo systemctl enable asterisk

echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m Instalação Completa \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"
sleep 5
clear


#============================================================================================
#INSTALANDO TRATAMENTO HANGUPCAUSE
#============================================================================================

echo ""
cowsay "INSTALANDO TRATAMENTO HANGUPCAUSE"
echo ""
sleep 5
sed -i '/extensions_tratamento_hangupcause.conf/d' /etc/asterisk/extensions_override_freepbx.conf
echo "#include /etc/asterisk/extensions_tratamento_hangupcause.conf" >> /etc/asterisk/extensions_override_freepbx.conf
rsync --progress -r /usr/src/IssabelBR/etc/asterisk/ /etc/asterisk/
chown asterisk.asterisk /etc/asterisk/extensions_tratamento_hangupcause.conf
echo ""
rm -Rf /usr/src/IssabelBR
clear

echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m Instalação Completa \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"
sleep 5
clear


#============================================================================================
#INSTALANDO AUDIO EM PORTUGUÊS BRASIL
#============================================================================================
echo ""
svn co https://github.com/ibinetwork/IssabelBR/trunk/ /usr/src/IssabelBR
echo ""
cowsay "INSTALANDO AUDIO EM PORTUGUÊS BRASIL"
echo ""
sleep 5

rsync --progress -r -u /usr/src/IssabelBR/audio/ /var/lib/asterisk/sounds/
sed -i '/language=pt_BR/d' /etc/asterisk/sip_general_custom.conf
echo "language=pt_BR" >> /etc/asterisk/sip_general_custom.conf
sed -i '/language=pt_BR/d' /etc/asterisk/iax_general_custom.conf
echo "language=pt_BR" >> /etc/asterisk/iax_general_custom.conf
sed -i '/defaultlanguage=pt_BR/d' /etc/asterisk/asterisk.conf
echo "defaultlanguage=pt_BR" >> /etc/asterisk/asterisk.conf
clear

echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m Instalação Completa \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"
sleep 5
clear


















echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m Instalação do Asterisk 18 Realizada com Sucesso \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32mSEU SISTEMA IRA REINICIAR EM 15s (PRESSIONE CTRL+C PARA RENICIAR MANUALMENTE) \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"
echo -e "\033[40;32m Sera Reniciado em 15. \033[1m"
sleep 1
clear
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m Instalação do Asterisk 18 Realizada com Sucesso \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32mSEU SISTEMA IRA REINICIAR EM 15s (PRESSIONE CTRL+C PARA RENICIAR MANUALMENTE) \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"
echo -e "\033[40;32m Sera Reniciado em 14. \033[1m"
sleep 1
clear
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m Instalação do Asterisk 18 Realizada com Sucesso \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32mSEU SISTEMA IRA REINICIAR EM 15s (PRESSIONE CTRL+C PARA RENICIAR MANUALMENTE) \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"
echo -e "\033[40;32m Sera Reniciado em 13. \033[1m"
sleep 1
clear
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m Instalação do Asterisk 18 Realizada com Sucesso \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32mSEU SISTEMA IRA REINICIAR EM 15s (PRESSIONE CTRL+C PARA RENICIAR MANUALMENTE) \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"
echo -e "\033[40;32m Sera Reniciado em 12. \033[1m"
sleep 1
clear
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m Instalação do Asterisk 18 Realizada com Sucesso \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32mSEU SISTEMA IRA REINICIAR EM 15s (PRESSIONE CTRL+C PARA RENICIAR MANUALMENTE) \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"
echo -e "\033[40;32m Sera Reniciado em 11. \033[1m"
sleep 1
clear
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m Instalação do Asterisk 18 Realizada com Sucesso \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32mSEU SISTEMA IRA REINICIAR EM 15s (PRESSIONE CTRL+C PARA RENICIAR MANUALMENTE) \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"
echo -e "\033[40;32m Sera Reniciado em 10. \033[1m"
sleep 1
clear
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m Instalação do Asterisk 18 Realizada com Sucesso \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32mSEU SISTEMA IRA REINICIAR EM 15s (PRESSIONE CTRL+C PARA RENICIAR MANUALMENTE) \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"
echo -e "\033[40;32m Sera Reniciado em 9. \033[1m"
sleep 1
clear
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m Instalação do Asterisk 18 Realizada com Sucesso \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32mSEU SISTEMA IRA REINICIAR EM 15s (PRESSIONE CTRL+C PARA RENICIAR MANUALMENTE) \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"
echo -e "\033[40;32m Sera Reniciado em 8. \033[1m"
sleep 1
clear
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m Instalação do Asterisk 18 Realizada com Sucesso \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32mSEU SISTEMA IRA REINICIAR EM 15s (PRESSIONE CTRL+C PARA RENICIAR MANUALMENTE) \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"
echo -e "\033[40;32m Sera Reniciado em 7. \033[1m"
sleep 1
clear
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m Instalação do Asterisk 18 Realizada com Sucesso \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32mSEU SISTEMA IRA REINICIAR EM 15s (PRESSIONE CTRL+C PARA RENICIAR MANUALMENTE) \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"
echo -e "\033[40;32m Sera Reniciado em 6. \033[1m"
sleep 1
clear
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m Instalação do Asterisk 18 Realizada com Sucesso \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32mSEU SISTEMA IRA REINICIAR EM 15s (PRESSIONE CTRL+C PARA RENICIAR MANUALMENTE) \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"
echo -e "\033[40;32m Sera Reniciado em 5. \033[1m"
sleep 1
clear
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m Instalação do Asterisk 18 Realizada com Sucesso \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32mSEU SISTEMA IRA REINICIAR EM 15s (PRESSIONE CTRL+C PARA RENICIAR MANUALMENTE) \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"
echo -e "\033[40;32m Sera Reniciado em 4. \033[1m"
sleep 1
clear
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m Instalação do Asterisk 18 Realizada com Sucesso \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32mSEU SISTEMA IRA REINICIAR EM 15s (PRESSIONE CTRL+C PARA RENICIAR MANUALMENTE) \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"
echo -e "\033[40;32m Sera Reniciado em 3. \033[1m"
sleep 1
clear
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m Instalação do Asterisk 18 Realizada com Sucesso \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32mSEU SISTEMA IRA REINICIAR EM 15s (PRESSIONE CTRL+C PARA RENICIAR MANUALMENTE) \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"
echo -e "\033[40;32m Sera Reniciado em 2. \033[1m"
sleep 1
clear
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32m Instalação do Asterisk 18 Realizada com Sucesso \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[1m"
echo -e "\033[40;32mSEU SISTEMA IRA REINICIAR EM 15s (PRESSIONE CTRL+C PARA RENICIAR MANUALMENTE) \033[1m"
echo -e "\033[40;32m======================================================================================================================================== \033[0m"
cowsay -f satanic Sera Reniciado em 1.
sleep 1
clear
reboot
done



