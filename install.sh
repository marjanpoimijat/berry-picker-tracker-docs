#!/bin/bash

clear

NOTICE="\033[0;33m"
LINK="\033[1;34m"
NC="\033[0m"
PREFIX="${NOTICE}[!]${NC} "

printf "${PREFIX}Cloning the backend source code...\n"
git clone https://github.com/marjanpoimijat/berry-picker-tracker-server.git
cd berry-picker-tracker-server
printf "${PREFIX}Backend source code cloned\n"

printf "${PREFIX}Installing dependencies...\n"
python3 -m venv .venv
source ./.venv/bin/activate
pip3 install -r requirements.txt
pre-commit install
pre-commit autoupdate
printf "${PREFIX}Dependencies installed\n"

touch .env
printf "${PREFIX}Creating the .env file\n"
printf "${PREFIX}Visit the National Land Survey of Finland to aqcuire an API key\n"
printf "${PREFIX}${LINK}https://www.maanmittauslaitos.fi/rajapinnat/api-avaimen-ohje\n"
printf "${PREFIX}Enter NLS API key: "
read API_KEY
echo "NLS_API_KEY=${API_KEY}" >> .env

printf "${PREFIX}Set up PostgreSQL locally and enter your psql username and password here\n"
printf "${PREFIX}See the documentation for more information\n"
printf "${PREFIX}${LINK}https://github.com/marjanpoimijat/berry-picker-tracker-docs/blob/main/db_locally_instructions.md\n"
printf "${PREFIX}Enter PostgreSQL username: "
read USERNAME
printf "${PREFIX}Enter PostgreSQL password: "
read PASSWORD
echo "DATABASE_URI=postgresql://${USERNAME}:${PASSWORD}/bpt" >> .env
echo "TEST_DATABASE_URI=sqlite:///test.db" >> .env
echo "LEGEND_URI=https://www.maanmittauslaitos.fi/sites/maanmittauslaitos.fi/files/attachments/2020/01/karttamerkkien_selitys.pdf" >> .env

