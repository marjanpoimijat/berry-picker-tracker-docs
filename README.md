<div align="center">
  <a href="https://github.com/marjanpoimijat">
    <img
        alt="Berry Picker Tracker logo"
        height=150
        src="docs/images/logo.png"
        title="Berry Picker Tracker logo"
        width=150
    />
  </a>
  <h1>
    <a href="https://github.com/marjanpoimijat">
      Berry Picker Tracker
    </a>
  </h1>
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

For manual installation, check [installation.md](https://github.com/marjanpoimijat/berry-picker-tracker-docs/blob/main/docs/installation.md).

## Technical

- [AWS Deployment](docs/aws_deployment.md)
- [Building Instructions (frontend)](docs/frontend_building_instructions.md)
- [CI/CD Pipeline](docs/cicd_pipeline.md)
- [Encryption](docs/encryption.md)
- [Features](docs/features.md)
- [Frontend-backend Communication](docs/frontend_backend_requests.md)
- [Implementation](docs/implementation.md) (outdated)
- [Instructions For New Developers](docs/instructions_for_new_developers.md)
- [Installation](docs/installation.md)
- [Known Issues](docs/known_issues.md)
- [Production & Staging](docs/production_and_staging.md)
- [Technologies](docs/technologies.md)
- [Todo List for Future Developers](docs/todo_for_future_developers.md)
- [Translation Guide](docs/translations.md)
- [Troubleshooting](docs/troubleshooting.md)
- [User Level Planning](docs/user_level_planning.md)
- [Virtual Machine Connection](docs/virtual_machine_connection.md) (outdated)

## Scrum

- [Coding Practices](docs/coding_practices.md)
- [Definition of Done](docs/definition_of_done.md)
- [Meeting Log](docs/meeting_log.md)
- [Product Backlog](https://github.com/orgs/marjanpoimijat/projects/3)
- [Sprint Backlogs](https://github.com/orgs/marjanpoimijat/projects)
- [Work Hours](https://helsinkifi-my.sharepoint.com/:x:/g/personal/kajy_ad_helsinki_fi/EVqaF5z1-9pBt4fEqOvs6E0B5plAijWjgKxFrGQQqV2kSg?e=Iay2EU) (requires University of Helsinki login)

## Database

- [Database schema](docs/images/bpt_schema.png)
- [Connecting to a database locally](docs/local_database.md)

## Repositories

- [Frontend](https://github.com/marjanpoimijat/berry-picker-tracker)
- [Backend](https://github.com/marjanpoimijat/berry-picker-tracker-server)

## Legal Information

### Licences

- [Frontend licenses](https://github.com/marjanpoimijat/berry-picker-tracker/tree/main/licenses)
- [Backend licenses](https://github.com/marjanpoimijat/berry-picker-tracker-server/tree/main/licenses)
- [Documentation license](LICENSE.md)
- [Demonstration license](https://github.com/marjanpoimijat/marjanpoimijat.github.io/blob/main/LICENSE)

### Privacy Policy

- [Privacy Policy](docs/privacy_policies.md)
