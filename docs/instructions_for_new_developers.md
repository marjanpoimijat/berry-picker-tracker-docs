# Instructions For New Developers

Hello, new developers! This document should help you get started and allow you to take over the project as smoothly as possible. If you have any questions or cannot get something to work, feel free to email [Riku](https://github.com/rikurauhala) \<firstname.lastname@helsinki.fi\> from the spring 2023 team.

## Primary

Let's get started by getting everything mandatory out of the way so you can get to work! Follow this list of steps but also keep in mind the [official instructions](https://github.com/HY-TKTL/TKT20007-Ohjelmistotuotantoprojekti).

### 1. Create a GitHub Organization

The first thing you need to do, is to create a new [GitHub organization](https://docs.github.com/en/organizations/collaborating-with-groups-in-organizations/creating-a-new-organization-from-scratch). Creating a new organization allows you to contribute together and have a centralized place to host multiple repositories needed for the project. Choose one team member to create an organization, invite other students to it and promote them to *Owner* status so they will have write access to all organization repositories.

Discuss together with your group what you want to call your organization, but the name should probably have something to do with the project.

Previous organizations:
- [hy-ohtu-syksy-22-bpt](https://github.com/hy-ohtu-syksy-22-bpt) (Autumn 2022)
- [marjanpoimijat](https://github.com/marjanpoimijat) (Spring 2023)

Feel free to take some inspiration from the previous organization pages and see how the previous groups have set up their organization pages on GitHub. You should also probably setup the organization README and add relevant links and other information to it.

### 2. Clone the Repositories

Next, you should [clone](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) all project repositories under the newly created organization. Cloning is recommended as doing so will allow you to keep the Git log and look back in time to see when specific changes have been made in the source code.

The following repositories should be cloned:
- [berry-picker-tracker](https://github.com/marjanpoimijat/berry-picker-tracker) (frontend)
- [berry-picker-tracker-server](https://github.com/marjanpoimijat/berry-picker-tracker-server) (backend)
- [berry-picker-tracker-docs](https://github.com/marjanpoimijat/berry-picker-tracker-docs) (documentation)

If you also want to setup a demonstration page, feel free to also clone the [github.io](https://github.com/marjanpoimijat/marjanpoimijat.github.io) repository. You may have to figure out yourself how to set up and host the demo page on [GitHub Pages](https://pages.github.com). The demonstration page is not mandatory and you may set it up later, perhaps towards the end of the project, if you want.

### 3. Discuss Practices

#### Coding Practices

This could be the first time you are going to be writing software as a team. It is no longer enough to work by yourself. You need to agree to a set of common rules and practices and stick to them. Feel free to adopt the previous [coding practices](https://github.com/marjanpoimijat/berry-picker-tracker-docs/blob/main/docs/coding_practices.md) and follow them. Remember, it is your project now! You can come up with your own rules or change existing ones. We are providing you with a starting point. What worked for us may not work for you.

Code style can be enforced by automated linting but anything else you may have to memorize.

#### Definition of Done

As a Scrum team, you will need a *Definition of Done*. Feel free to adopt or modify the previous [Definition of Done](./definition_of_done.md). Keep this in mind when discussing the status of your user stories.

#### Communication Channel

Create a new Discord server, Telegram channel or whatever works for you. During the project, you have to stay in touch with your teammates and be able to share links, screenshots and other information. Don't forget to invite your course instructor as well! The customer may also want to be added, make sure to ask them about it.

#### Work Hour Tracking

Remember that you must keep track of hours worked during the project. There is no need to reinvent the wheel so feel free to copy our [work hour tracking document](https://helsinkifi-my.sharepoint.com/:x:/g/personal/kajy_ad_helsinki_fi/EVqaF5z1-9pBt4fEqOvs6E0B5plAijWjgKxFrGQQqV2kSg?e=Iay2EU). If you're not a fan of spreadsheets, you might come up with another solution as well!

### 4. Create a Backlog

As you will be working with Agile practices and meeting the customer, you will need a *product backlog*. We would recommend using [GitHub Projects](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/about-projects) for both the product backlog and sprint backlogs.

Using GitHub Projects for the backlogs will allow you to create issues for tasks and immediately assign tasks to the team members based on their GitHub accounts. You can also attach relevant labels to tasks. See the example sprint backlog below. GitHub Projects also makes it possible to create different views for the same project: you can view the sprint backlog by user story, as a kanban view or just a list!

For inspiration, see [Product Backlog](https://github.com/orgs/marjanpoimijat/projects/3/views/1) and [Sprint backlog example](https://github.com/orgs/marjanpoimijat/projects/15/views/3). All sprint backlogs can be found in our [organization page](https://github.com/orgs/marjanpoimijat/projects?query=is%3Aopen).

### 5. Setup the Project

Now is the time to set up the project so you can start developing the application.

Refer to the [installation.md](https://github.com/marjanpoimijat/berry-picker-tracker-docs/blob/main/docs/installation.md) to get started.

### 6. Get Familiar with the Code

This application has a lot of code. Some of it can be complicated and just reading it can feel overwhelming. Before writing any new features, get familiar with the codebase! After you have succesfully ran the application, experiment: make some changes to the code and see what happens! Take your time, the more familiar you are with the source code, the easier it will be later on to implement new features.

### 7. Read the Documentation

If something is not working or you want to know how something, read the documentation. Many technical aspects of the application has been documented.

### 8. Plan the First Sprint

A good place to start would be the [todo list](./todo_for_future_developers.md). Also, take a look at the [product backlog](https://github.com/orgs/marjanpoimijat/projects/3/views/1) of the previous team to see what was left unfinished. Make sure to discuss the first sprint with the customer.

## Secondary

With everything urgent out of the way, here are some other things you should take care of.

### Take Control of Documentation

#### Re-brand It

The documentation contains many references to the current organization. After cloning the repositories, use the search function to find and replace every instance of `marjanpoimijat` with the name of your own organization.

#### Reset the Meeting Log

Working in the software engineering project will require meeting the customer live on campus, sometimes on Zoom. You should always have a leader (Scrum master), writer (the one taking notes) and a person with a laptop demonstrating the application to the customer. For this purpose, there exists a [meeting log](./meeting_log.md) document. It is recommended to reset this file and keep track of who has done what during meetings. Make sure each member gets to at least lead once during the course of the project!

### Append the Copyright

The project is licensed with a [MIT License](https://opensource.org/license/mit). Append the copyright files with the names of each member of your team. The format is `Copyright (c) 2023 Student A, Student B, Student C...`.

- [Frontend license](https://github.com/marjanpoimijat/berry-picker-tracker/blob/main/licenses/LICENSE.md)
- [Backend licenses](https://github.com/marjanpoimijat/berry-picker-tracker-server/blob/main/licenses/LICENSE.md)
- [Documentation license](https://github.com/marjanpoimijat/berry-picker-tracker-docs/blob/main/LICENSE.md)
- [Demonstration license](https://github.com/marjanpoimijat/marjanpoimijat.github.io/blob/main/LICENSE)

## Tips

Here are some general tips for a smooth start to your project.

### Communicate

The key to smooth teamwork is good communication. Talk to your teammates. Ask them questions. Tell them what you are doing and why. Remember *transparency*.

### Be Present

Prefer working on campus! Working together in the same room instead of over Zoom will lead to better communication, productivity and help you with getting to know your team.

### Keep the Documentation Up-to-date

This project has quite an extensive documentation. It is easy to just keep writing new features and forget about the documentation. However, doing so will come to haunt you later. When making changes in the code, you should always document those changes immediately. Some technical choices could also be justified in writing so you and the team after you will understand why certain decisions were made!

### Convert Tasks Into Issues

If you choose to use GitHub Projects for sprints backlogs, try to convert tasks into issues! This way you can assign GitHub users (your team members) into tasks, attach [labels](https://docs.github.com/en/issues/using-labels-and-milestones-to-track-work/managing-labels) to them.

### Credit Your Teammates

A commit can have [multiple authors](https://docs.github.com/en/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/creating-a-commit-with-multiple-authors). Make sure to add your teammate as a co-author if you do pair programming.

## Useful Links

- [Expo documentation](https://docs.expo.dev)
- [Full Stack Open](https://fullstackopen.com/en)
- [React Native documentation](https://reactnative.dev/docs/getting-started)
- [Software engineering project information](https://github.com/HY-TKTL/TKT20007-Ohjelmistotuotantoprojekti)
- [Staging server information](https://github.com/UniversityOfHelsinkiCS/ohtup-staging)
