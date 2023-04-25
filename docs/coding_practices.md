# Coding Practices

This document explains coding practices to follow in this project. The frontend is written in TypeScript and the backend in Python. If not specified here, follow the best practices for each language or other frameworks or tools used.

## Linting

To ensure the quality of the source code, linting tools are used for both the frontend, and the backend repositories. Using VSCode is recommended as the editor should inform you as the developer of any code violating these linter rules. The point of using a linter is that you should not have to memorize these rules, let the tools do it for you!

Use caution while ignoring any rules, they are in place for a reason.

### Frontend

For the frontend, two different linting tools are used: [ESLint](https://eslint.org) and [Prettier](https://prettier.io).

The configuration for ESLint can be found in the file `.eslintrc.json` in the frontend repository. Several recommended rulesets are used but some manual tweaking has been done via the "rules" attribute found in the configuration file.

Similarly, the Prettier configuration file can be found in `.prettierrc.json` at the root of the frontend repository.

After commiting changes, [lint-staged](https://github.com/okonet/lint-staged) will run the linters. If the linting fails, the commit will not succeed. This way no low quality code can be pushed to the repository on GitHub.

### Backend

The Python code in the backend should follow the [PEP8](https://peps.python.org/pep-0008). For linting, [pylint](https://pypi.org/project/pylint) is used. The pylint configurations are stored in `.pylintrc`.

Run the linter:

```shell
# Start the virtual env if needed
source ./.venv/bin.activate

#Run linter
pylint src
```

## Naming

### Frontend

Use `kebab-case` for file names and `camelCase` for variables. Use `PascalCase` for React components.

### Backend

Use `snake_case` for both file names and variables.

## Project Language

For all source code and documentation, use **English**. The user interface of the application is available in multiple languages but all variable and file names and so on should be in the same language, English.

## Dependencies

### Frontend

The frontend's dependencies are managed with [npm](https://docs.npmjs.com/about-npm). We **very** strongly recommend using [nvm](https://github.com/nvm-sh/nvm) to install `node` and `npm`. (In case of issues with node, see [here](/docs/troubleshooting.md#npm-start-leads-to-syntaxerror)).

`package.json` contains necessary information about project, including its dependencies. `package-lock.json` locks which versions of dependencies should be installed with the project. This ensures that project versions always install with the same versions of dependencies for all users. See [this blogpost](https://www.knowledgehut.com/blog/web-development/package-json-vs-package-lock-json) for a more in-depth explanation.

Running `npm update` does not automatically update `package.json`. You can do this by running

```shell
npm update --save
# Or update all dependency versions to the latest with
npx ncu -u
```

`npx` is used to run [commands of an npm package](https://docs.npmjs.com/cli/v9/commands/npx). **Note:** `package-lock.json` is only updated when `npm install` is run.

By default `npm update` does not update packages to new major versions ([more info on semantic versions](https://semver.org/)). Major updates can easily be done via [npm-check-update](https://github.com/raineorshine/npm-check-updates) dev-only dependency.

```shell
# To check available updates
npx npm-check-updates
# or
npx ncu

# To upgrade package.json
npx ncu -u $package_name

# To install updates
npm install
```

### Backend

[`Pyenv`](https://github.com/pyenv/pyenv) is used for virtual environment management. The dependencies are managed and installed using [`pip`](https://pypi.org/project/pip/) and its associated file `requirements.txt`.

## Environment variables

### Frontend

The environment variables should be located in an `.env` file located in the project's root folder. The `app.config.js` file used by Expo for [app configuration](https://docs.expo.dev/workflow/configuration/) contains the field

```javascript
uri: process.env.URI,
```

that reads the backend's address from the `.env` file. If the configuration is invalid, the backend's address defaults to the `baseURL` configured in `constants.ts`. Remember to keep the `.env` file listed in `.gitignore`!

### Backend

The enviroment variables should be located in a `.env` file located in the project's root directory. The [python-dotenv](https://pypi.org/project/python-dotenv/) dependency handles parsing them into the program. `.env` files should never be publicly available -> it's included in the `.gitignore` file for a reason.

## Code Documentation

### Frontend

Use [JSDoc](https://jsdoc.app) to document TypeScript code. Example below.

```typescript
/**
 * Formats a latitude coordinate as a string.
 *
 * @param {number} latitude - The latitude coordinate to format.
 * @returns {string} The formatted latitude string with a direction indicator.
 */
export const parseLatitude = (latitude: number): string => {
  return latitude > 0
    ? `${formatCoordinate(latitude)} °N`
    : `${formatCoordinate(latitude)} °S`;
};
```

### Backend

Use [Docstring](https://peps.python.org/pep-0257) to document Python code. Example below.

```python
def create_user(user: schemas.UserCreate, db: Session):
    """Adds user to DB, takes json body as a parameter and compares (and validates) it according to schemas.py"""
    db_user = models.User(**user.dict())

    _create(db_user, db)

    return db_user
```

## File Structure

### Frontend

The frontend repository has the roughly the following structure. Store all images in the `assets` directory and all source code in `src`. Follow this logical separation and store all new code in their own places. If you are not sure, discuss with your team! New subdirectories and modules can be created when needed.

```javascript
├── assets
│   └── // ...
├── src
│   ├── components
│   │   └── // React components
│   ├── languages
│   │   └── // language and localization related files
│   ├── reducers
│   │   └── // React Redux
│   ├── styles
│   │   └── // styling, css rules etc.
│   ├── types
│   │   └── // TypeScript types
│   ├── utils
│   │   └── // functions
│   └── // other files and components
└── // configs etc.
```

### Backend

The `docker` directory contains the files needed for both staging and production deployments. The `utilities` directory contains files used for database creation and data validation while the `service` directory contains code for database methods. Routes are defined in `main.py`. Feel free to refactor everything if needed.

```python
├── docker
│   └── # Docker configuration
├── licenses
│   └── # license docs
├── src
│   ├── service
│   │   └── # database methods
│   ├── tests
│   │   └── # tests
│   ├── utilities
│   │   └── # database utilities
│   └── # main.py
└── # configs etc.
```
