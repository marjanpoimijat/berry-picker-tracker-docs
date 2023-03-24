# Troubleshooting

## Android emulation on Cubbli / Ubuntu

1. Install the Android SDK.

```bash
# Install Android SDK
$ sudo apt install android-sdk

# Add the path to the sdk to .bashrc
# Make sure the path is correct
$ echo 'export ANDROID_HOME="$HOME/Android/Sdk"' >> .bashrc
```

2. Install Android Studio by following [the instructions](https://developer.android.com/studio/install#linux).

3. Set up an emulator by following [the instructions](https://docs.expo.dev/workflow/android-studio-emulator).
    - Pixel 6 Pro was used as the device
    - Android 13.0 (API 33) was used as the operating system

4. Keep Android Studio and the emulator open while running the frontend.

## Github Actions Workflow

### legacy-install-failure

If a problem occurs with the `uvtools` dependency, use an older version in the workflow. Python 3.9 should work (January 2023).

## Problems with dependencies

### Prototype Pollution in JSON5 via Parse Method

```
json5 <1.0.2
Severity: high
```

This problem might occur when using an outdated version of the `find-babel-config` package, which is a sub-sub-sub-dependency of `babel-preset-expo`. A pull request has been opened in the Expo GitHub repository in January 2023. This issue may or may not get fixed with Expo SDK version 49. (21 March 2023).
