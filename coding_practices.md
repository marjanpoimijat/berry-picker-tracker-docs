# This project's coding practices

Lint:
* TypeScript: Prettier & ESLint
* Python: Pep8 & pylint

Filenames:
* TypeScript: `kebab-case` for everything
* Python: `snake_case`

Code documentation:
* [Docstring for Python](https://peps.python.org/pep-0257/)
* JS-Doc -style documentation:
  ```
  /**
   * Description here. `Markdown` works. Description will be shown in VSCode 
   * when you have mouse over the function.
   * @param {string} foo   Argument description here
   * @param {string} [bar] Optional-argument description here
   * @returns Returned value description here
   */
  const fn = (foo: string, bar?: number) => `${foo}: ${bar ?? 0}`;

  /** Description here */
  interface Foo {
      /** Function description here */
      bar: string,
  }
  ```
