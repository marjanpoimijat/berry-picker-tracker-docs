# Project documentation

This repository contains the documentation of the Berry Picker Tracker project.

## Installation

### Requirements

- `node:^16.17.0`
- `npm:^8.19.0`
- `python:^3.10.2`
- `pip3`
- `git`
- `PostgreSQL`
- `Android SDK`
- `Android Studio`

### Installation Script

- [install.sh](https://github.com/marjanpoimijat/berry-picker-tracker-docs/blob/main/install.sh)
Download the install script, add a permission to execute it `chmod +x <path>/install.sh`, navigate to a folder you wish to clone the repositories in, and run the install script with `<path>/install.sh`. After running the install script, frontend and backend are run with `<repository_path>/run.sh` inside their respective folders. Depending on your PostgreSQL you may need to add "localhost:5432" into the database URI in berry-picker-tracker-server/.env, like this: "DATABASE_URI=postgresql://*username*:*password*@localhost:5432/bpt".
- [Frontend usage](https://github.com/marjanpoimijat/berry-picker-tracker#usage) documentation will instruct how to run the app on an emulator or physical device.

For more extensive installation instructions, check [frontend](https://github.com/marjanpoimijat/berry-picker-tracker) and [backend](https://github.com/marjanpoimijat/berry-picker-tracker-server) documentation.

## General Project Information

- [Coding practices](coding_practices.md)
- [Definition of Done](definition_of_done.md)
- [Used technologies](technologies.md)
- [Building instructions - frontend](frontend_building_instructions.md)
- [Implementation document - frontend](implementation_document.md)
- [Working hours record](https://helsinkifi-my.sharepoint.com/:x:/g/personal/kajy_ad_helsinki_fi/EVqaF5z1-9pBt4fEqOvs6E0B5plAijWjgKxFrGQQqV2kSg?e=Iay2EU)

## Repositories

- [Frontend repository](https://github.com/marjanpoimijat/berry-picker-tracker)
- [Backend repository](https://github.com/marjanpoimijat/berry-picker-tracker-server)

## Database

- [Database schema](images/bpt_schema.png)
- [Instructions for connecting to local database](db_locally_instructions.md)

## Legal Information

### Licences

- [Frontend licenses](https://github.com/marjanpoimijat/berry-picker-tracker/tree/main/licenses)
- [Backend licenses](https://github.com/marjanpoimijat/berry-picker-tracker-server/tree/main/licenses)

### Privacy Policy

- [Privacy Policy](privacy_policies.md)
