# Building instructions using EAS Build

### General information

More detailed information can be found from the [Expo Docs](https://docs.expo.dev/build/introduction/).

##### Preparations

To install EAS CLI run the command:

```
npm install -g eas-cli
```

Log in to Expo account using Berry Picker Tracker credentials. As a alternative create new [Expo](https://expo.dev/) account:

```
eas login
```

To build application run the command and choose for which platform you would like build the application:

```
eas build
```

fter building process has been finished the application and list of previous builds can be found at the project page of the Expo account.

##### Configuration

This project uses two **app-specific secrets** which can be created at project dashboard in Expo account. Secrets are in format:

```
MAPS_API=<Google maps API key>
PROJECT_ID=<Expo project ID>
```

To see which secrets are created for the project run the command:

```
eas secret:list
```

Secrets are defined in [app.config.js](https://github.com/hy-ohtu-syksy-22-bpt/berry-picker-tracker/blob/main/app.config.js) and placed as a environment variables during the build process.

```
android: {
  config: {
    googleMaps: {
      apiKey: process.env.MAPS_API,
    },
  },
  extra: {
    uri: process.env.URI,
    eas: {
      projectId: process.env.PROJECT_ID,
    },
  },
},
```

Build configurations can be found from [eas.json](https://github.com/hy-ohtu-syksy-22-bpt/berry-picker-tracker/blob/main/eas.json). Production build will be created as a default and other builds can be created by running to the command:

```
eas build --profile <profile-name>
```

Each of the profiles needs to have backend address defined as environment variable in format:

```
"production": {
  "env": {
    "URI": <backend-address>
  }
}
```

**Note.** Build and version numbering should be updated after each build submits from the `app.config.js`. Further information about build configuration can be found from the [Expo docs](https://docs.expo.dev/build/eas-json/).

### Submiting builds

##### Android APK build

To build and install Android APK build run the command:

```
eas build --profile apk
```

After build has completed, go the Expo account and open the latest `Android internal distribution build` and press `install` button. Scan the QR-code from the pop-up window and install the application on a Android device.

##### Google Play Store

As of time of writing, Berry Picker Tracker application has been placed into `internal testing` state at the Google Play console. There are several ways to submit the build into Google Play console:

1. Submit from the command line

   Store the service account key which is created at the Google Play console and add key path in `eas.json` into submit configuration:

   ```
   "submit": {
    "production": {
      "android": {
        "serviceAccountKeyPath": "<keypath>
      },
   ```

   Run the command:

   ```
   eas submit -p android --latest
   ```

2. Manual submit

   After build has completed, go the Expo account and open the latest `Android Play Store build` and press `download` button and store it.

   Then go to Google Play Console and choose `Berry Picker Tracker` - `internal testing` - `create new release` and load the previously stored build.

After new release has been created, internal testers can install the application via Google Play Store.

##### Apple App Store

Apple developer program account is needed to install application into ios devices. Go to App Store Connect and create new application. After that create following submit configuration at `eas.json`:

```
"submit": {
  "production": {
    "ios": {
      "appleId": "<personal apple ID>",
      "ascAppId": "<application ID>",
      "appleTeamId": "<developer membership team id>"
    }
```

Run the command:

```
eas submit -p ios --latest
```

After submiting a build it will show up in App Store Connect under the TestFlight page. After managing missing compliences application can be installed through TestFlight App for the internal testing. Publishing application through Apple App Store requires successfull app review process which can be requested at the App Store connect.
