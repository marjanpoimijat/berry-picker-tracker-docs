<div align="center">
  <img
    alt="Berry Picker Tracker logo"
    height=200
    src="docs/images/logo.png"
    title="Berry Picker Tracker logo"
    width=200
  />
</div>

# Documentation

This repository contains the documentation of the [Berry Picker Tracker](https://github.com/marjanpoimijat) project. The documentation is written mostly for the developers of the application but contains useful information for the users of the application, other software developers or anyone else interested in the app as well.

## Installation

### Requirements

Make sure your system meets the following requirements. [Cubbli Linux](https://wiki.helsinki.fi/display/it4sci/Cubbli+Linux) is recommended for all developers but other Ubuntu-based distributions should be fine. Getting everything to work on a Windows device or a Macbook might be difficult.

Software requirements:

- `node:^16.17.0`
- `npm:^8.19.0`
- `python:^3.10.2`
- `pip3`
- `git`
- `PostgreSQL`
- `Android SDK`
- `Android Studio`

### Installation Script

A shell script has been written to make the installation process as easy as possible. The script is named [install.sh](install.sh) and can be found at the root of this repository. Run the script and follow the instructions. The script should take care of everything else automatically, but it will ask you to enter some credentials to be stored as environment variables.

```bash
# Move to a directory where you wish to install the application
# The following is just an example, feel free to come up with your own
$ cd git

# Get the script
$ wget https://raw.githubusercontent.com/marjanpoimijat/berry-picker-tracker-docs/main/install.sh

# Make it executable
$ chmod +x install.sh

# Run the script
$ ./install.sh
```

## General Project Information

- [Coding Practices](docs/coding_practices.md)
- [Definition of Done](docs/definition_of_done.md)
- [Building instructions - frontend](docs/frontend_building_instructions.md)
- [Implementation - frontend](docs/implementation.md) [Outdated]
- [Technologies](docs/technologies.md)
- [Work Hours](https://helsinkifi-my.sharepoint.com/:x:/g/personal/kajy_ad_helsinki_fi/EVqaF5z1-9pBt4fEqOvs6E0B5plAijWjgKxFrGQQqV2kSg?e=Iay2EU) [requires University of Helsinki login]

## Repositories

- [Frontend](https://github.com/marjanpoimijat/berry-picker-tracker)
- [Backend](https://github.com/marjanpoimijat/berry-picker-tracker-server)

## Database

- [Database schema](docs/images/bpt_schema.png)
- [Connecting to a database locally](docs/local_database.md)

## Legal Information

### Licences

- [Frontend licenses](https://github.com/marjanpoimijat/berry-picker-tracker/tree/main/licenses)
- [Backend licenses](https://github.com/marjanpoimijat/berry-picker-tracker-server/tree/main/licenses)
- [Documentation license](LICENSE.md)
- [Demonstration license](https://github.com/marjanpoimijat/marjanpoimijat.github.io/blob/main/LICENSE)

### Privacy Policy

- [Privacy Policy](privacy_policies.md)
