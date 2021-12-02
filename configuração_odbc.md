
/etc/odbc.ini
[asterisk-remoto]
Description=MariaDB-client
Driver=MariaDB
SERVER=[HOSTLOCAL - EXTERNO]
USER=[USUARIO]
PASSWORD=[PASSWORD]
DATABASE=[DATABASE]
PORT=3306

/etc/asterisk/res_odbc.conf
[asterisk-remoto]
enabled => yes
dsn => [NOME CONECTOR - COLOCADO NO ODBC]
username => [USUARIO]
password => [PASSWORD]
pre-connect => yes

/etc/asterisk/cdr_adaptive_odbc.conf
[asterisk-remoto]
connection=[NOME CONECTOR]
table=[TABELA CRIADA]
 