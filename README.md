Arsenal - Instalador Interativo de Ferramentas de Pentest

O que é?
Arsenal é um script em Bash que automatiza a instalação de ferramentas populares de pentest, rede e forense digital. Ele oferece uma interface interativa com duas opções:

Instalação Manual: escolha quais programas deseja instalar.

Instalação Automática: instala todos os pacotes de uma vez.

Ideal para montar rapidamente um ambiente de segurança ofensiva ou laboratórios de CTFs.

-Como usar
Clone este repositório:

git clone https://github.com/feaguilera/arsenal/blob/main/arsenal.sh
cd arsenal
Dê permissão de execução ao script:

bash
Copiar
Editar
chmod +x instalador.sh
Execute o script:

./instalador.sh
Na primeira execução, o script realizará uma preparação automática do sistema (apt update, dependências básicas). Isso ocorre apenas uma vez.

-Ferramentas incluídas
O script instala os seguintes programas:


netcat-openbsd, 
ncat, 
nmap, 
wireshark, 
tcpdump,
hashcat, 
ffuf, 
gobuster, 
hydra, 
zaproxy, 
proxychains,
sqlmap, 
radare2, 
metasploit-framework, 
python2.7, 
python3,
spiderfoot, 
theharvester, 
remmina, 
rdesktop, 
crackmapexec,
exiftool, 
curl, 
seclists, 
testssl.sh, 
git, 
vim, 
tmux

-Requisitos
Distribuição baseada em Debian/Ubuntu.

Acesso sudo para instalação de pacotes via apt.

- Estilo Visual
Interface em modo terminal, com cores inspiradas no visual do Matrix.

Feedback visual após cada instalação.

Layout limpo e organizado para uso diário ou em laboratórios.

- Créditos
Desenvolvido por Felipe Aguilera Bertolini

![image](https://github.com/user-attachments/assets/1781f554-a71f-47e2-a9eb-e3f09652239e)

![2](https://github.com/user-attachments/assets/7e7be9aa-68ad-4eb6-985b-144c6365d3cf)

