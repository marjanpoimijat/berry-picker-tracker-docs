# Installation

## Requirements

Make sure your system meets the following requirements. [Cubbli Linux](https://wiki.helsinki.fi/display/it4sci/Cubbli+Linux) is recommended for all developers but other Ubuntu-based distributions should be fine. Getting everything to work on a Windows device or a Macbook might be difficult.

Software requirements:

- `node:^16.17.0`
- `npm:^8.19.0`
- `python:^3.10.2`
- `pip3`
- `git`
- `PostgreSQL`
- `Android SDK`
- [`Android Studio`](https://developer.android.com/studio/install#linux)

## Script

A shell script has been written to make the installation process as easy as possible. The script is named [install.sh](docs/scripts/install.sh) and can be found in this repository. Run the script and follow the instructions. The script should take care of everything else automatically, but it will ask you to enter some credentials to be stored as environment variables.

```bash
# Move to a directory where you wish to install the application
# The following is just an example, feel free to come up with your own
$ cd git

# Get the script
$ wget https://raw.githubusercontent.com/marjanpoimijat/berry-picker-tracker-docs/main/docs/scripts/install.sh

# Make it executable
$ chmod +x install.sh

# Run the script
$ ./install.sh
```


## Manual installation

## Frontend

Clone the [repository](https://github.com/marjanpoimijat/berry-picker-tracker).

Install dependencies:

```bash
$ npm install
```

Create a .env-file to the project root with following:

```bash
URI=<server-address>
```

e.g. `URI="https://ohtup-staging.cs.helsinki.fi/bpt-stage"` / `URI="http://10.0.2.2:8008"` (address for Android emulator)

### Requirements

- `node:^16.17.0`
- `npm:^8.19.0`

The recommended way to set up node and npm is by using [nvm](https://github.com/nvm-sh/nvm).

### Usage

#### Running

Use the following command to start the application:

```bash
$ npm start
```

### Instructions for Berry-Picker-Tracker Mobile App for IOS/Android

#### Prerequisites:

- [Berry-picker-tracker frontend](https://github.com/marjanpoimijat/berry-picker-tracker) repository working on your computer.

#### Instructions:

1. Install **Expo Go** app from the Apple **App Store** or Android **Play Store**. Expo Go is a smartphone application for running mobile apps that are in development on a mobile device.
2. Launch **Expo Go** app on your IOS/Android device.
3. Login or Create an Expo account.
4. Connect your IOS/Android device to your computer using usb-cable.
5. Make sure that your IOS/Android device and your computer are connected to the same network.
6. On your computer in the Berry-picker-tracker frontend repository run the command:

```bash
$ npm start
```

6. A QR code should be displayed. Open the default camera app on your IOS/Android device and scan the QR code.
7. On your IOS device Expo Go should open and promt you to choose between **Development Build** or **Expo Go**. Choose **Expo Go**.

Congratulations! The Berry Picker Tracker mobile application should now be launched on your iOS/Android device.

### Running the app in an Android emulator on Cubbli/Ubuntu

1. Install the Android SDK.

```bash
# Install Android SDK
$ sudo apt install android-sdk

# Add the path to the sdk to .bashrc
# Make sure the path is correct
$ echo 'export ANDROID_HOME="$HOME/Android/Sdk"' >> .bashrc
```

2. Download and install Android Studio by following [the instructions](https://developer.android.com/studio/install#linux).

3. Set up an emulator by following [the instructions](https://docs.expo.dev/workflow/android-studio-emulator).

   - Pixel 6 Pro was used as the device
   - Android 13.0 (API 33) was used as the operating system

4. Keep Android Studio and the emulator open while running the frontend.

## Backend

Clone the [repository](https://github.com/marjanpoimijat/berry-picker-tracker-server).

```bash
python3 -m venv .venv && \            # Create a virtual environment in `./.venv`
source ./.venv/bin/activate && \      # Activate the virtual environment
pip3 install -r requirements.txt && \ # Install dependencies — see `./requirements.txt` for more info
pre-commit install && \               # Install the pre-commit hook
pre-commit autoupdate && \            # Update the pre-commit hooks
touch .env                            # For environmental variables
```

### Development Using Docker

1. Install [Docker](https://docs.docker.com/get-docker)
2. add your API key to the enviroment section in the docker compose as NLS_API_KEY
3. use `docker compose up -d --build` to build and launch the containers
4. use `docker exec berry-picker-tracker-server-web-1 pytest ./tests/` to run tests
5. use `docker logs -f berry-picker-tracker-server-web-1`to view and follow backend logs
6. To connect to the backend server while using the emulator, set your URI in the frontend .env to http://10.0.2.2:8008

### Requirements

- `python3`
- `pip3`

### Database schema

Database schema can be found [here](https://github.com/marjanpoimijat/berry-picker-tracker-docs/blob/main/docs/images/bpt_schema.png).

If the database is set up correctly, there's no need for any precautionary measures.

> **Note**
> The database tables are created automatically when running the program for the first time

### Environment variables

The `.env` file should contain following variables:

```bash
NLS_API_KEY=<API KEY>
```

API key for getting map tiles from National Land Survey of Finland. Instructions for acquiring one can be found [HERE](https://www.maanmittauslaitos.fi/rajapinnat/api-avaimen-ohje). The right API is found from [HERE](https://www.maanmittauslaitos.fi/karttakuvapalvelu/tekninen-kuvaus-wmts#avoin-rajapintayhteys) but it is already hard coded in the application.

```bash
DATABASE_URI=<local database address>
```
This is only needed if you're connecting to database locally. Instructions to connect to database locally are [HERE](https://github.com/marjanpoimijat/berry-picker-tracker-docs/blob/main/db_locally_instructions.md).

As one can see from [DATABASE MODULE](https://github.com/marjanpoimijat/berry-picker-tracker-server/blob/main/src/utilities/db.py#L17), there is hard coded address for connecting to database which is run on virtual machine inside docker container (db password is acquired as a docker secret), but this is just original developer team's solution. For further development own solution should be implemented.

```bash
TEST_DATABASE_URI=sqlite:///test.db
```
For testing purposes SQLite is used instead of PostgreSQL.

```bash
LEGEND_URI=<URI for downloading the map's legend>
```

Downloading the map legend is done through back end server in case the URI is modified or changed. The most recent (12 Dec 2022) working one is:

https://www.maanmittauslaitos.fi/sites/maanmittauslaitos.fi/files/attachments/2020/01/karttamerkkien_selitys.pdf

### Updating Dependencies

```bash
$ pip3 freeze > requirements.txt
```

### Running

Either start the "Run the app" task in VSCode or run

```bash
$ uvicorn --app-dir=src main:app --reload
```
