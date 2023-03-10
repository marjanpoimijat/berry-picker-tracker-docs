# Translation guide

## Overview

The application supports localization. The language of the user interface can be changed. In the *Settings* view, there is an option for changing the language.

The following languages are supported:

- 🇬🇧 English
- 🇫🇮 suomi (Finnish)
- 🇸🇪 svenska (Swedish)

## Adding support for a new language

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

To add support for a new language, you must append all of these objects stored in *translations.json*. For example, here the original string is being translated into Dutch.

```diff
"Original string": {
  "en": "Original string",
  "fi": "String translated into Finnish (fi)",
+ "nl": "String translated into Dutch (nl)",
  "sv": "String translated into Swedish (sv)"
},
```

### Appending the Language type

To add support for a new language, the Languag type must also be appended.

```diff
export enum Language {
+ Dutch = "nl",
  English = "en",
  Finnish = "fi",
  Swedish = "sv",
}
```

### Appending the language options in the Settings view

All new languages must also be added as an option to be selected in the Settings view.

```diff
const languageOption = [
  { key: index++, component: <Text>English</Text>, label: Language.English },
+ { key: index++, component: <Text>Nederlands</Text>, label: Language.Dutch },
  { key: index++, component: <Text>suomi</Text>, label: Language.Finnish },
  { key: index++, component: <Text>svenska</Text>, label: Language.Swedish },
];
```
