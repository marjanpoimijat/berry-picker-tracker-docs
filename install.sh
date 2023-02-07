#!/bin/bash

# 
# This script is used for automating the installation process of both the frontend and the backend
# of the Berry Picker Tracker application. It was created to help new developers get to work as
# fast as possible. Check the documentation for requirements before running the script.
# 
# https://github.com/marjanpoimijat/berry-picker-tracker-docs
#



# --------------- Functions and constants ---------------

ORGANIZATION="marjanpoimijat"
NOTICE="\033[0;33m"
LINK="\033[1;34m"
NC="\033[0m"
PREFIX="${NOTICE}[!]${NC} "
QUESTION="${NOTICE}[?]${NC} "

function print_link {
    printf "${PREFIX}${LINK}$1\n"
}

function print_question {
    printf "${QUESTION}$1"
}

function print_status {
    printf "${PREFIX}$1\n"
}



# --------------- Backend installation ---------------

print_status "Cloning the backend source code..."
git clone "https://github.com/${ORGANIZATION}/berry-picker-tracker-server.git"
cd berry-picker-tracker-server
chmod +x ./run.sh
print_status "Backend source code cloned"

print_status "Installing dependencies..."
python3 -m venv .venv
source ./.venv/bin/activate
pip3 install -r requirements.txt
pre-commit install
pre-commit autoupdate
print_status "Dependencies installed"

touch .env
print_status "Creating the .env file"
print_status "Visit the National Land Survey of Finland to aqcuire an API key"
print_link "https://www.maanmittauslaitos.fi/rajapinnat/api-avaimen-ohje"
print_question "Enter NLS API key: "
read API_KEY
echo "NLS_API_KEY=${API_KEY}" >> .env

print_status "Set up PostgreSQL locally and enter your psql username and password here"
print_status "See the documentation for more information"
print_link "https://github.com/${ORGANIZATION}/berry-picker-tracker-docs/blob/main/db_locally_instructions.md"
print_question "Enter PostgreSQL username: "
read USERNAME
print_question "Enter PostgreSQL password: "
read PASSWORD
echo "DATABASE_URI=postgresql://${USERNAME}:${PASSWORD}/bpt" >> .env
echo "TEST_DATABASE_URI=sqlite:///test.db" >> .env
echo "LEGEND_URI=https://www.maanmittauslaitos.fi/sites/maanmittauslaitos.fi/files/attachments/2020/01/karttamerkkien_selitys.pdf" >> .env

cd ..
print_status ""
print_status "Backend installed successfully!"



# --------------- Frontend installation ---------------

print_status "Cloning the frontend source code..."
git clone "https://github.com/${ORGANIZATION}/berry-picker-tracker.git"
cd berry-picker-tracker
chmod +x ./run.sh
print_status "Frontend source code cloned"

print_status "Installing frontend dependencies..."
npm install
print_status "Dependencies installed!"

touch .env
print_status "Creating the .env file"
print_question "Do you want to run the application locally with an emulator? (y/n): "
read choice

while true; do
    if [[ "$choice" = "y" ]]; then
        echo "URI=http://10.0.2.2:8000" >> .env
        print_status "Backend URI set to the emulator address"
        break
    elif [[ "$choice" = "n" ]]; then
        echo "URI=<production address here>" >> .env
        print_status "Backend URI set to the production address"
        break
    else
        print_question "Invalid input. Please enter either 'y' or 'n': "
        read choice
    fi
done

print_status "Frontend installed successfully!"
print_status ""



# --------------- Instructions ---------------

print_status "To start the backend, enter the virtual environment, start the database"
print_status "and run $ uvicorn --app-dir=src main:app --reload or $ ./run.sh"
print_status ""
print_status "To start the frontend, run $ npm start or $ ./run.sh"
print_status "Please refer to the documentation if you have any questions"
print_link "https://github.com/${ORGANIZATION}/berry-picker-tracker-docs"
