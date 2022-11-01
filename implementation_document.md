# Project implementation - frontend

### General structure

Root component [App](https://github.com/hy-ohtu-syksy-22-bpt/berry-picker-tracker/blob/main/src/app.tsx) uses `Main` component which is wrapped by:

- `NativeRouter` component from the [react-route-native](https://reactrouter.com/en/v6.3.0/api#nativerouter) to allow routing between application screens
- `Provider` component from the [react-redux](https://react-redux.js.org/) for the state handling. Further information regarding the state handling can be found [here](#state-handling)
- `PersistGate` component from the [redux-persist](https://github.com/rt2zz/redux-persist) to retrieve and save states persistently on a device.

Primary purposes for the [Main](https://github.com/hy-ohtu-syksy-22-bpt/berry-picker-tracker/blob/main/src/main.tsx) component are:

- Initialize user identification
- Tracking and sending interval handling during the active berry picking event
- Routing between `Map`, `Coffee` and `Settings` screens. Further information regarding different screens can be found [here](#screens)

```
.
├── app.tsx
├── main.tsx
├── requests.ts
├── store.ts
├── ...
├── components
│   ├── app-header.tsx
│   └── ...
├── hooks
│   └── use-interval.ts
├── reducers
│   ├── index.ts
│   ├── route-reducer.ts
│   ├── user-reducer.ts
│   └── waypoint-reducer.ts
├── screens
│   ├── coffee-screen.tsx
│   ├── map-screen.tsx
│   └── settings-screen.tsx
├── __tests__
│   └── components
│       └── ...
```

### State handling

Following libraries are used in an application for the state handling:

- [Redux](https://redux.js.org/)
- [React Redux](https://react-redux.js.org/)
- [Redux Toolkit](https://redux-toolkit.js.org/)
- [Redux Persist](https://github.com/rt2zz/redux-persist)

There are following primary states which all are also retrieved and stored persistantly on a users device:

- `User` which contains:
  - `userId` which set as default to `null` and will be generated during the first launch of the application via http request and stored into the device
  - `trackingInterval` which is used to determine interval (in milliseconds) how often new `Waypoints` will be created and stored into the device during the berry picking event
  - `sendingInterval` which is used to determine interval (in milliseconds) how often list of `pendingWaypoints` will be sent to the server
  - _TODO_ - Intervals can be changed at the `Settings` screen in order to adjust battery life of the device.
  ```
  interface User {
  	userId: string | null;
  	trackingInterval: number;
  	sendingInterval: number;
  }
  ```
- `Route` which contains

  - `routeId` which set as default to `null` and will be generated when new berry picking event has been started via http request and stored into the device
  - `showRoute` which is set as default to `true` and indicates that the taken route will be drawn on a map during the berry picking event. `showRoute` can be set to `false` at the `hide route` button on a application in order to hide route on a map
  - `active` which is set as default to `false` and changed to `true` when new berry picking event has been started.
  - _NB_ - `routeId` will be set to `null` and `active` will be set to `false` when active berry picking event has been ended using the `end route` button on a application.

  ```
  interface Route {
    routeId: string | null;
    showRoute: boolean;
    active: boolean;
  }
  ```

- `Waypoint` which contains:

  - `routeId` explained above
  - Coordinates, ie. `latitude` and `longitude` values to determine users last known location
  - `mnc` which is three digit mobile network code of the cellular service provider. This is used to determine wheter there are cellular range available or not. In case of out of cellular range `mnc` will be set to a `null`.
  - `ts` which timestamp of the waypoint

  ```
  interface Waypoint {
    routeId: string | null;
    latitude: number;
    longitude: number;
    mnc: string | null;
    ts: number;
  }
  ```

- `WaypointState` which contains:
  - `localWaypoints` which is the list of `Waypoints` stored into local device during a new berry picking event. `localWaypoints` will be emptied when the berry picking event has been ended
  - `pendingWaypoints` which is the temporary list of `Waypoints` stored into the device between the `sendingInterval` when these are send to the server. `pendingWaypoints` will be emptied after those are send to the server.
  ```
  interface WaypointState {
    localWaypoints: Array<Waypoint>;
    pendingWaypoints: Array<Waypoint>;
  }
  ```

### Screens

Application has three different screens:

- [MapScreen](https://github.com/hy-ohtu-syksy-22-bpt/berry-picker-tracker/blob/main/src/screens/map-screen.tsx)
- [CoffeeScreen](https://github.com/hy-ohtu-syksy-22-bpt/berry-picker-tracker/blob/main/src/screens/coffee-screen.tsx)
- [SettingsScreen](https://github.com/hy-ohtu-syksy-22-bpt/berry-picker-tracker/blob/main/src/screens/settings-screen.tsx)

Primary purposes for `MapScreen` are:

- Request users permission for a application to use devices location
- To use `MapViewContainer` which uses `MapView` component from the [react-native-maps](https://github.com/react-native-maps/react-native-maps) library. `MapView` renders the topological map using [National land survey of Finland](https://www.maanmittauslaitos.fi/en) API and draws a route on a map when berry picking event has been started.
- To use `RouteButtonContainer` which provides buttons to activate / deactivate berry picking routes and to toggle visibility of the route on / off.

Primary purposes for `CoffeeScreen` are:

- To be added...

Primary purposes for `SettingsScreen` are:

- To be added...
