#!/bin/bash

# Arquivo de controle para execução única
FLAG_FILE="$HOME/.arsenal_installed"

# Cores estilo "Matrix"
GREEN='\033[1;32m'    # Verde claro brilhante (neon)
DARK_GREEN='\033[0;32m' # Verde escuro (Matrix base)
NC='\033[0m'          # Reset (sem cor)

# Lista de programas
PROGRAMS=(
"netcat-openbsd"
"ncat"
"nmap"
"wireshark"
"tcpdump"
"hashcat"
"ffuf"
"gobuster"
"hydra"
"zaproxy"
"proxychains"
"sqlmap"
"radare2"
"metasploit-framework"
"python2.7"
"python3"
"spiderfoot"
"theharvester"
"remmina"
"rdesktop"
"crackmapexec"
"exiftool"
"curl"
"seclists"
"testssl.sh"
"git"
"vim"
"tmux"
)

# Função de cabeçalho
show_header() {
    clear
    echo -e "${GREEN}=================================="
    echo -e "           A R S E N A L          "
    echo -e "==================================${NC}"
}

# Instala um único programa
install_program() {
    local prog="$1"
    echo -e "\n${DARK_GREEN}🔧 Instalando: $prog..."
    if sudo apt-get install -y "$prog" > /dev/null 2>&1; then
        echo -e "${GREEN}✅ $prog instalado com sucesso!${NC}"
    else
        echo -e "❌ Falha ao instalar $prog${NC}"
    fi
    echo -e "${DARK_GREEN}Pressione ENTER para voltar ao menu...${NC}"
    read
}

# Instalação manual
manual_install() {
    while true; do
        show_header
        echo -e "${DARK_GREEN}📦 Instalação Manual"
        echo "Selecione um programa para instalar:${NC}"
        select prog in "${PROGRAMS[@]}" "Voltar ao Menu Principal"; do
            if [[ "$prog" == "Voltar ao Menu Principal" ]]; then
                return
            elif [[ -n "$prog" ]]; then
                install_program "$prog"
                break
            else
                echo -e "${DARK_GREEN}Opção inválida.${NC}"
            fi
        done
    done
}

# Instalação automática
automatic_install() {
    show_header
    echo -e "${DARK_GREEN}🚀 Instalando todos os programas automaticamente...${NC}"
    echo
    for prog in "${PROGRAMS[@]}"; do
        echo -e "${DARK_GREEN}🔄 Instalando: $prog...${NC}"
        if sudo apt-get install -y "$prog" > /dev/null 2>&1; then
            echo -e "${GREEN}✅ $prog instalado com sucesso!${NC}"
        else
            echo -e "❌ Falha ao instalar $prog${NC}"
        fi
    done
    echo
    echo -e "${GREEN}✅ Todos os programas foram processados!${NC}"
    echo -e "${DARK_GREEN}Pressione ENTER para voltar ao menu...${NC}"
    read
}

# Primeira inicialização: setup básico
first_time_setup() {
    if [ ! -f "$FLAG_FILE" ]; then
        show_header
        echo -e "${GREEN}🔧 Preparando o sistema para primeira execução...${NC}"
        sudo apt update && sudo apt install -y dialog software-properties-common
        touch "$FLAG_FILE"
        echo -e "${GREEN}✅ Setup inicial concluído com sucesso!${NC}"
        sleep 2
    fi
}

# Menu principal
main_menu() {
    while true; do
        show_header
        echo -e "${DARK_GREEN}Escolha uma opção:"
        echo "1) Gostaria de instalar manualmente?"
        echo "2) Instalar automaticamente todos"
        echo -e "3) Sair${NC}"
        read -p "Digite sua opção [1-3]: " choice
        case $choice in
            1) manual_install ;;
            2) automatic_install ;;
            3) echo -e "${GREEN}Saindo...${NC}"; exit 0 ;;
            *) echo -e "${DARK_GREEN}Opção inválida. Pressione ENTER para tentar novamente...${NC}"; read ;;
        esac
    done
}

# Executa setup se necessário
first_time_setup

# Inicia menu
main_menu
