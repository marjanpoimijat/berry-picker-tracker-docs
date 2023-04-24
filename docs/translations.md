# Translation Guide

## Overview

The application supports localization. The language of the user interface can be changed. In the _Settings_ view, there is an option for changing the language.

The following languages are supported:

- 🇬🇧 English
- 🇫🇮 suomi (Finnish)
- 🇸🇪 svenska (Swedish)

## Adding Support for a New Language

All translations are stored in the file [translations.json](https://github.com/marjanpoimijat/berry-picker-tracker/blob/main/src/languages/translations.json). Support for new languages can be done by editing this file. The data is stored in the JSON format where the key is the name of the string as it appears in English in the user interface. Each key stores another object of key-value pairs, where the key is a [language code](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) and the value is the corresponding translation of the original English string.

### Appending translations.json

Consider the example code snippet below.

```javascript
// ...
"Original string": {
  "en": "Original string",
  "fi": "String translated into Finnish (fi)",
  "sv": "String translated into Swedish (sv)"
},
// ...
```

To add support for a new language, you must append all of these objects stored in _translations.json_. For example, here the original string is being translated into Dutch.

```diff
"Original string": {
  "en": "Original string",
  "fi": "String translated into Finnish (fi)",
+ "nl": "String translated into Dutch (nl)",
  "sv": "String translated into Swedish (sv)"
},
```

### Appending the Language Type

To add support for a new language, the Language type must also be appended.

```diff
export enum Language {
+ Dutch = "nl",
  English = "en",
  Finnish = "fi",
  Swedish = "sv",
}
```

### Appending the Language Options in the Settings View

All new languages must also be added as an option to be selected in the Settings view.

```diff
const languageOption = [
  { key: index++, component: <Text>English</Text>, label: Language.English },
+ { key: index++, component: <Text>Nederlands</Text>, label: Language.Dutch },
  { key: index++, component: <Text>suomi</Text>, label: Language.Finnish },
  { key: index++, component: <Text>svenska</Text>, label: Language.Swedish },
];
```
