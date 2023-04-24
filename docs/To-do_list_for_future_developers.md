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

## Route sharing

- User can pause an active route
- User can share their route for a period of time (not indefinitely)
- User can cancel the sharing of their data with other users
- The shared routes are automatically updated

### Deep Linking

When the tracking link is shared via WhatsApp/Messenger/SMS etc. it should open the app if it's installed or the Play/App store if it's not. This is achieved via [deep linking](https://docs.expo.dev/guides/deep-linking/) that needs to be set up. Expo offers a [module](https://docs.expo.dev/versions/latest/sdk/linking/) for this, see [this guide](https://docs.expo.dev/guides/linking/).
