## 🚀 Documentação 2 - Instação MySql 8 - Passo a Passo / Documentação.  <img alt="asterisk" src="img/mysql.png">

Bora para mais uma instalação chata porém esse é rapido e bem fácil, até começar a configurar as coisa..

```bash
yum update all
 ```

Caso tenha alguma atualização para fazer, porém se você fez o do manual do asterisk ta livre de dar updade no sistema.

Então vamos baixar o repositórios do mysql. 

```bash
wget https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
 ```

Assim que concluir o donwload do repo da mysql você terá uma mensagem que seu arquivo .rpm foi salva


Apos concluir vamos preprar o repositório para darmos continuidade na instação do mysql

```bash
rpm -Uvh mysql80-community-release-el7-3.noarch.rpm
 ```