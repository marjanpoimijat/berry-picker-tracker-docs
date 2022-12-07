# Project implementation - frontend

### General structure

Root component [App](https://github.com/hy-ohtu-syksy-22-bpt/berry-picker-tracker/blob/main/src/app.tsx) uses `Main` component which is wrapped by:

- `NativeRouter` component from the [react-route-native](https://reactrouter.com/en/v6.3.0/api#nativerouter) to allow routing between application screens
- `Provider` component from the [react-redux](https://react-redux.js.org/) for the state handling. Further information regarding the state handling can be found [here](#state-handling)
- `PersistGate` component from the [redux-persist](https://github.com/rt2zz/redux-persist) to retrieve and save states persistently on a device.

Primary purposes for the [Main](https://github.com/hy-ohtu-syksy-22-bpt/berry-picker-tracker/blob/main/src/main.tsx) component are:

- Creates directory for custom map tile caching
- Defines background locations task. Further information regarding background tasks can be found [here](#background-location-task)
- Request permissions to use foreground and background location on a users device
- Initialize user identification
- Routing between `Map`, `FindUserRoute` and `Settings` screens. Further information regarding different screens can be found [here](#screens).

```
├── index.js
├── ...
├── src
│   ├── app.tsx
│   ├── main.tsx
│   ├── store.ts
│   ├── requests.ts
│   ├── ...
│   ├── components
│   │   ├── app-header.tsx
│   │   ├── ...
│   ├── reducers
│   │   ├── index.ts
│   │   ├── route-reducer.ts
│   │   ├── user-reducer.ts
│   │   └── waypoint-reducer.ts
│   ├── screens
│   │   ├── find-user-route-screen.tsx
│   │   ├── map-screen.tsx
│   │   └── settings-screen.tsx
│   ├── styles
│   │   ├── index.ts
│   │   └── theme.ts
│   ├── __tests__
│   │   └── components
│   │       └── ...
│   └── utils
│       ├── file-system.ts
│       └── location-tracking.ts
```

### Screens

Application has three different screens:

- [MapScreen](https://github.com/hy-ohtu-syksy-22-bpt/berry-picker-tracker/blob/main/src/screens/map-screen.tsx)
- [FindUserRouteScreen](https://github.com/hy-ohtu-syksy-22-bpt/berry-picker-tracker/blob/main/src/screens/find-user-route-screen.tsx)
- [SettingsScreen](https://github.com/hy-ohtu-syksy-22-bpt/berry-picker-tracker/blob/main/src/screens/settings-screen.tsx)

Primary purposes for the `MapScreen` are:

- To use `MapViewContainer` which uses `MapView` component from the [react-native-maps](https://github.com/react-native-maps/react-native-maps) library. `MapView` renders topological map using [National land survey of Finland](https://www.maanmittauslaitos.fi/en) API and draws a route on a map when berry picking event has been started
- To use `RouteButtonContainer` which provides buttons to activate / deactivate berry picking routes and to toggle visibility of the route on / off
- To use `CoordinateContainer` which shows users current coordinates at the top of a map screen.

Primary purposes for the `FindUserRouteScreen` are:

- To use `InputContainer` which allows user to search other users latest route with user ID
- To use `FindUserRouteContainer` which shows the user latest route on a small map after succesfull search.

Primary purposes for the `SettingsScreen` are:

- Change waypoint tracking and sending frequencies.
- To use offline mode (functionalities not implemented)
- Change lifetime how long custom map tiles will be stored on a users device
- Allows user to copy user ID into clipboard or reset user ID
- Allows user to reset default settings
- Several links to the legal information
- Download link to map legends.

### State handling

Following libraries are used in an application for the state handling:

- [Redux](https://redux.js.org/)
- [React Redux](https://react-redux.js.org/)
- [Redux Toolkit](https://redux-toolkit.js.org/)
- [Redux Persist](https://github.com/rt2zz/redux-persist)

There are following primary states which all are also retrieved and stored persistantly on a users device:

##### User

```
interface User {
  userId: string | null;
  trackingInterval: number;
  sendingInterval: number;
  mapLifetime: number;
  offlineMode: boolean;
}
```

- `userId` is set as default to `null` and will be generated during the first launch of the application via http request and stored into the device
- `trackingInterval` is used to determine interval (in milliseconds) how often new `Waypoints` will be created and stored into the device during the berry picking event
- `sendingInterval` is used to determine interval (in milliseconds) how often list of `pendingWaypoints` will be sent to the server
- `mapLifetime` in hours which indicates how long custom map tiles will be stored on a users device
- `offlineMode` is set as default to `false` Functionalities for offline mode has not been implemented.

##### Route

```
interface Route {
  routeId: string | null;
  showRoute: boolean;
  active: boolean;
}
```

- `routeId` is set as default to `null` and will be generated when new berry picking event has been started via http request and stored into the device
- `showRoute` is set as default to `true` and indicates that the taken route will be drawn on a map during the berry picking event. `showRoute` can be set to `false` from the `hide route` button in order to hide route on a map
- `active` is set as default to `false` and changed to `true` when new berry picking event has been started
- `routeId` will be set to `null` and `active` will be set to `false` when active berry picking event has been ended after pressing `end route` button on a application.

##### Waypoint

```
interface Waypoint {
  routeId: string | null;
  latitude: number;
  longitude: number;
  mnc: string | null;
  connection: string | null;
  ts: number;
}
```

- `routeId` explained above
- Coordinates, ie. `latitude` and `longitude` values to determine users last known location
- `mnc` which is three digit mobile network code of the cellular service provider. This is used to determine wheter there are cellular range available or not. In case of out of cellular range `mnc` will be set to a `null`.
- `connection` is used to determine what type connection is available on a current time being such as 3g, 4g, 5g etc.
- `ts` which timestamp of the waypoint.

##### WaypointState

```
interface WaypointState {
  routeId: string | null;
  localWaypoints: Array<Waypoint>;
  pendingWaypoints: Array<Waypoint>;
}
```

- `routeId` explained above.
- `localWaypoints` is the list of `Waypoints` stored into local device during a new berry picking event. `localWaypoints` will be emptied when the berry picking event has ended.
- `pendingWaypoints` is the temporary list of `Waypoints` stored into the device between the `sendingInterval` when these are send to the server. `pendingWaypoints` will be emptied after they are send to the server or when berry picking event has ended.

### Background location task

[Background location task](https://github.com/hy-ohtu-syksy-22-bpt/berry-picker-tracker/blob/main/src/utils/location-tracking.ts) is performed by using [Expo TaskManager](https://docs.expo.dev/versions/latest/sdk/task-manager/). During the application launch background task will be defined and user is asked to allow both foreground and background location permissions.

While berry picking event is active, background task keeps tracking users waypoints on a background even if the application has been closed. To be more precise, application can not be fully closed while background location task is running and devices statusbar shows the following notification to the user:

```
notificationTitle: "Berry picker tracker is running on a background"
notificationBody: "End current route tracking in order to close the app"
```

Background location task is closed when user ends the berry picking event. Background location can be also updated during the active event for example when user changes sending frequency at the settings.

### Styles

Application [styles](https://github.com/hy-ohtu-syksy-22-bpt/berry-picker-tracker/blob/main/src/styles/index.ts) and [theme](https://github.com/hy-ohtu-syksy-22-bpt/berry-picker-tracker/blob/main/src/styles/theme.ts) files are located at the `src/styles` -folder. Application colors and font sizes are can be changed through `theme` -file.

### Requests

Server [requests](https://github.com/hy-ohtu-syksy-22-bpt/berry-picker-tracker/blob/main/src/requests.ts) performed in `src/requests.ts` -file. Backend address is passed via `baseUrl` which should defined at `.env` -file in format `URI=<backend-address>`. In build configuration `baseUrl` will be defined at [eas.json](https://github.com/hy-ohtu-syksy-22-bpt/berry-picker-tracker/blob/main/eas.json) in format:

```
"build": {
  "production": {
    "env": {
      "URI": "<backend-address>"
```
