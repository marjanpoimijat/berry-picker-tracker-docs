# Features

This document goes over the features of the application. The mobile application consists of two main _views_ or _screens_.

## Map View

The main view of the application is the _Map view_. This view contains all the main functionality of the application. It consists of a coordinate bar, a map and various navigation or functionality buttons.

### Coordinate Bar

The coordinate bar displays the user's current location using the [Geographic coordinate system](https://en.wikipedia.org/wiki/Geographic_coordinate_system). The coordinate bar consists of two separate values: the **latitude**, i.e. the _North-South_ position and the **longitude**, i.e. the _East-West_ position. Both values are rounded to five decimals.

For example, a person standing at the [Senate Square](https://en.wikipedia.org/wiki/Senate_Square,_Helsinki) in Helsinki would see their location displayed as `60.16948 °N, 24.95228 °E`.

### Map

The most relevant part of the application is the map. The map takes almost all space on the screen. By default, the map uses map tiles provided by the [National Land Survey of Finland](https://www.maanmittauslaitos.fi/en).

On the map, the user can see their location as a light blue dot with a white outline. While recording a route or tracking other users, various locations and routes will be overlaid on the map in different colors.

### Routes

Tapping the `Routes` button brings up route controls. Tapping `Start route` will start recording a new route and `End route` will stop recording. Tapping `Hide route` will hide the current route being recorded and `Share route` opens a link to be copied and shared with other users.

### Tracking

Other users can be tracked by asking them to share their link via a messaging application, e.g. WhatsApp or Telegram. Tracked users will show up in the the Tracking menu, which can be opened by tapping the `Tracking` button. The tracking menu contains a list of tracked users and their names and corresponding colors. Each user has three buttons associated with them:

- The _eye_ button: shows or hides the user's current location
- The _route_ button: shows or hids the user's current route
- The _trash can_ button: deletes a user from the tracking menu

The tracking menu also contains master toggle buttons to perform the aforementioned operations on all users on the list.

## Settings View

The other relevant view the application offers is the settings menu. All settings related to the functionality of the application can be found here.

### Language

The application supports multiple languages. The language of the user interface can be changed here. See [translations.md](./translations.md) for a list of supported languages and for instructions on how to add support for more languages as a developer.

### Navigation

Various waypoint frequencies can be tweaked to save battery life.

### Map

The map type can be changes. The application supports four different maps:

- Topographic Map (National Land Survey of Finland)
- OpenStreepMap
- Plain Map (NLS)
- Aerial image (NLS)

### User Information

The user can reset their UserID here or set a _username_ for themself. This username will be displayed on other users' tracking menu after sharing their information.

### Legal Information

This sections contains links to all relevant legal information, such as licenses or privacy policies.

### Map Legend

The map legend for the base map can be downloaded via this section.
