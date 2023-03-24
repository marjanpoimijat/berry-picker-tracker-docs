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

The Python code in the backend should follow the [PEP8](https://peps.python.org/pep-0008). For linting, [pylint](https://pypi.org/project/pylint) is used.

<!-- How can the linter be run in the backend? -->

## Naming

### Frontend

Use `kebab-case` for file names and `camelCase` for variables. Use `PascalCase` for React components.

### Backend

Use `snake_case` for both file names and variables.

## Project language

For all source code and documentation, use **English**. The user interface of the application is available in multiple languages but all variable and file names and so on should be in the same language, English.

## Code documentation

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
	return latitude > 0 ? `${formatCoordinate(latitude)} °N` : `${formatCoordinate(latitude)} °S`;
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

## File structure

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
│   ├── screens
│   │   └── // React Native screens
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

To be added.

<!-- Improve and document the backend file structure. -->
