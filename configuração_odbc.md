
## /etc/odbcinst.ini
[PostgreSQL]<br>
Description     = ODBC for PostgreSQL<br>
Driver          = /usr/lib/psqlodbcw.so<br>
Setup           = /usr/lib/libodbcpsqlS.so<br>
Driver64        = /usr/lib64/psqlodbcw.so<br>
Setup64         = /usr/lib64/libodbcpsqlS.so<br>
FileUsage       = 1<br>


[MySQL]<br>
Description     = ODBC for MySQL<br>
Driver          = /usr/lib/libmyodbc5.so<br>
Setup           = /usr/lib/libodbcmyS.so<br>
Driver64        = /usr/lib64/libmyodbc5.so<br>
Setup64         = /usr/lib64/libodbcmyS.so<br>
FileUsage       = 1<br>


[MariaDB]<br>
Description=MariaDB<br>
Driver=/usr/local/lib/libmaodbc.so<br>
Driver64=/usr/lib64/libmaodbc.so<br>



## /etc/odbc.ini<br>
[asterisk-remoto]<br>
Description=MariaDB-client<br>
Driver=MariaDB<br>
SERVER=[HOSTLOCAL - EXTERNO]<br>
USER=[USUARIO]<br>
PASSWORD=[PASSWORD]<br>
DATABASE=[DATABASE]<br>
PORT=3306

## /etc/asterisk/res_odbc.conf<br>
[asterisk-remoto]<br>
enabled => yes<br>
dsn => [NOME CONECTOR - COLOCADO NO ODBC]<br>
username => [USUARIO]<br>
password => [PASSWORD]<br>
pre-connect => yes
<br>

## /etc/asterisk/cdr_adaptive_odbc.conf<br>
[asterisk-remoto]<br>
connection=[NOME CONECTOR]<br>
table=[TABELA CRIADA]
 