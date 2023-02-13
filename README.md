# Project documentation

Contains general documentation about the Berry picker tracker app and project.
***

### Installation
#### Requirements
- `node:^16.17.0`
- `npm:^8.19.0`
- `python:^3.10.2`
- `pip3`
- `git`
- `PostgreSQL`
- `Android SDK`
- `Android Studio`

#### Installation script for bash
- [install.sh](https://github.com/marjanpoimijat/berry-picker-tracker-docs/blob/main/install.sh)  
Download the install script, add a permission to execute it `chmod +x <path>/install.sh`, navigate to a folder you wish to clone the repositories in, and run the install script with `<path>/install.sh`. After running the install script, frontend and backend are run with `<repository_path>/run.sh` inside their respective folders. Depending on your PostgreSQL you may need to add "localhost:5432" into the database URI in berry-picker-tracker-server/.env, like this: "DATABASE_URI=postgresql://*username*:*password*@localhost:5432/bpt".
- [Frontend usage](https://github.com/marjanpoimijat/berry-picker-tracker#usage) documentation will instruct how to run the app on an emulator or physical device.

For more extensive installation instructions, check [frontend](https://github.com/marjanpoimijat/berry-picker-tracker) and [backend](https://github.com/marjanpoimijat/berry-picker-tracker-server) documentation.

### General Project Info

- [Coding practices](coding_practices.md)
- [Definition of Done](definition_of_done.md)
- [Used technologies](used_technologies.md)
- [Working hours record](https://helsinkifi-my.sharepoint.com/:x:/g/personal/kajy_ad_helsinki_fi/EVqaF5z1-9pBt4fEqOvs6E0B5plAijWjgKxFrGQQqV2kSg?e=Iay2EU)
- [Implementation document - frontend](implementation_document.md)
- [Building instructions - frontend](frontend_building_instructions.md)

### Repositories
- [Front-end repository](https://github.com/marjanpoimijat/berry-picker-tracker)
- [Back-end repository](https://github.com/marjanpoimijat/berry-picker-tracker-server)

### Database
- [Database schema](bpt_schema.png)
- [Instructions for connecting to local database](db_locally_instructions.md)

***
### Legal
#### Licences

- [Front end licenses](https://github.com/marjanpoimijat/berry-picker-tracker/tree/main/licenses)
- [Back end licenses](https://github.com/marjanpoimijat/berry-picker-tracker-server/tree/main/licenses)

#### Privacy Policy

- [Privacy Policy](privacy_policies.md)
***
### App Description
####
> #### Demo video
<a href="http://www.youtube.com/watch?feature=player_embedded&v=44t3ZLfdkvw
" target="_blank"><img src="http://img.youtube.com/vi/44t3ZLfdkvw/0.jpg" 
alt="44t3ZLfdkvw" width="240" height="180" border="10" /></a>
##
> #### Current User Interface and Features
####  
![User interface](images/map_and_track.png)
## 
> #### Settings Options
![Settings interface](images/settings.png)
##  
> #### Architecture
####

![Architecture](images/architecture.png)
