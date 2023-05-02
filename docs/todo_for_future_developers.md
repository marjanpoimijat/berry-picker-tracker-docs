## The order is not an indication of priority

- App uses SSL certificates
- User knows who can see their data
- Color blind mode
- Map APIs for the rest of the world with topographical and hill shading
- NLS maps combining topographical + hill shading
- Warning message for a weak connectivity and visualization of the connectivity zones on the map
- App uses aws
- Users can download the app through App Store or Google Play
- A screen for emergency situation ("call 112")

## Encryption

- Finish frontend encrypt/decrypt methods and refactor database to match [the planned functionality](/docs/database.md#what-the-schema-should-be-refactored-to)

The current library in use is [CryptoES](https://github.com/entronad/crypto-es) which uses the same API as [CryptoJS](https://github.com/brix/crypto-js). This is not the best possible choice, however the choices of cryptography libraries that work with both react-native and Expo are quite limited as of writing (May 2023). Generally the use of high-level cryptography libraries would be preferred and the state of compatibility of the libraries listed below should be checked periodically.

### Possible libraries to switch to

- [React-native-libsodium](https://github.com/serenity-kit/react-native-libsodium)

  - React Native bindings to the [Libsodium](https://doc.libsodium.org/) cryptography library
  - Lacking Android support as of May 2023

- [Themis](https://docs.cossacklabs.com/themis/)

  - Has React Native wrappers
  - Is not compatible with Expo as of May 2023

- [Other libsodium wrappers](https://doc.libsodium.org/bindings_for_other_languages)
  - Libsodium has wrappers for both pure JavaScript and NodeJS
  - Whether or not these would be usable has not been looked into

## Route sharing

- User can pause an active route
- User can share their route for a period of time (not indefinitely)
- User can cancel the sharing of their data with other users

### Deep Linking

When the tracking link is shared via WhatsApp/Messenger/SMS etc. it should open the app if it's installed or the Play/App store if it's not. This is achieved via [deep linking](https://docs.expo.dev/guides/deep-linking/) that needs to be set up. Expo offers a [module](https://docs.expo.dev/versions/latest/sdk/linking/) for this, see [this guide](https://docs.expo.dev/guides/linking/).
