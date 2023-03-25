# Building Instructions Using EAS Build

More detailed information can be found in the official [Expo Documentation](https://docs.expo.dev/build/introduction/).

## Preparations

To install EAS CLI run the command:

```bash
$ npm install -g eas-cli
```

Log in to your Expo account using Berry Picker Tracker credentials. As an alternative, create a new [Expo](https://expo.dev/) account:

```bash
$ eas login
```

To build the application, run the command and choose which platform you would like to build the application:

```bash
$ eas build
```

After the building process has been finished, a list of previous builds can be found at the project page of the Expo account.

## Configuration

This project uses two **app-specific secrets** which can be created at the project dashboard in Expo account. Secrets are in the following format:

```bash
MAPS_API=<Google maps API key>
PROJECT_ID=<Expo project ID>
```

To see which secrets are created for the project run the command:

```bash
$ eas secret:list
```

Secrets are defined in [app.config.js](https://github.com/marjanpoimijat/berry-picker-tracker/blob/main/app.config.js) and placed as an environment variables during the build process.

```typescript
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

Build configurations can be found in the file [eas.json](https://github.com/marjanpoimijat/berry-picker-tracker/blob/main/eas.json). Production build will be created as a default and other builds can be created by running the command:

```bash
$ eas build --profile <profile-name>
```

Each of the profiles needs to have the backend address defined as an environment variable in this format:

```typescript
"production": {
  "env": {
    "URI": <backend-address>
  }
}
```

> **Note**  
> Build and version numbering should be updated after each build submit from the `app.config.js`. Further information about build configuration can be found in the [Expo documentation](https://docs.expo.dev/build/eas-json/).

## Submiting Builds

### Android APK Build

To build and install the Android APK build, run the command:

```bash
$ eas build --profile apk
```

After build has completed, go to your Expo account and open the latest `Android internal distribution build` and press the `install` button. Scan the QR code from the pop-up window and install the application on an Android device.

### Google Play Store

At the time of writing this, Berry Picker Tracker application has been placed into `internal testing` state at the Google Play console. There are few ways to submit the build into Google Play console:

1. Submit from the command line

    Store the service account key which is created at the Google Play console and add key path in `eas.json` into submit configuration:

    ```json
    "submit": {
      "production": {
        "android": {
          "serviceAccountKeyPath": <keypath>
        }
      }
    }
   ```

    Run the command:

    ```bash
    $ eas submit -p android --latest
    ```

2. Manual submit

    After the build has completed, go to your Expo account and open the latest `Android Play Store build`, press the `download` button and store it.

    Then go to Google Play Console and choose `Berry Picker Tracker` - `internal testing` - `create new release` and load the previously stored build.

After a new release has been created, internal testers can install the application via Google Play Store.

### Apple App Store

An Apple developer program account is needed to install the application on iOS devices. Go to App Store Connect and create a new application. After that, create the following submit configuration in `eas.json`:

```json
"submit": {
  "production": {
    "ios": {
      "appleId": "<personal apple ID>",
      "ascAppId": "<application ID>",
      "appleTeamId": "<developer membership team id>"
    }
  }
}
```

Run the command:

```bash
$ eas submit -p ios --latest
```

After submiting a build, it will show up in App Store Connect under the `TestFlight` page. After managing missing compliences application can be installed through the `TestFlight` app for the internal testing. Publishing application through Apple App Store requires successfull app review process which can be requested at the App Store Connect.
