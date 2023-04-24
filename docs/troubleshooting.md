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

## npm start leads to SyntaxError

Running _npm start_ causes an error such as `SyntaxError: Unexpected token '.'`. If the error log shows the error occurring in `internal/modules/cjs/loader` it means there's an issue with Node. One possible reason is there being a conflict with an existing global installation of Node and nvm.

**Example:**

```sh
SyntaxError: Unexpected token '.'
    at wrapSafe (internal/modules/cjs/loader.js:915:16)
    at Module._compile (interal/modules/cjs/loader.js:963:27)
    at Object.Module._extensions..js (internal/modules/cjs/loader.js:1027:10)
    ...
```

**Fix:**

1. Uninstall the global installation using apt-get

```sh
sudo apt-get remove nodejs      # uninstall Node
sudo apt-get update             # update Ubuntu repositories to remove Node
sudo apt-get purge nodejs       # remove packages and files
sudo apt-get autoremove         # delete unused files to free up space
```

2. Install node using nvm

```sh
cd $frontend_directory
```

**If you have not installed nvm, follow the [official instructions](https://github.com/nvm-sh/nvm#installing-and-updating) to install it.**

```sh
nvm install node            # install latest version of node
nvm install-latest-npm      # install latest version of npm
nvm alias default node      # installing the latest version should make it the default but this
                            # guarantees the configured node version persists to new shell sessions
```

## Github Actions Workflow

### legacy-install-failure

If a problem occurs with the `uvtools` dependency, use an older version in the workflow. Python 3.9 should work (January 2023).

## Problems with dependencies

### xml2js is vulnerable to prototype pollution

```
xml2js  <0.5.0
Severity: high
```

xml2js is a dependency of the expo-plugins library. This is a problem in validating incoming JSON keys. Has been fixed in version 0.5.0, will probably be fixed in an upcoming expo-config update. (April 18th 2023)

### Prototype Pollution in JSON5 via Parse Method

```
json5 <1.0.2
Severity: high
```

This problem might occur when using an outdated version of the `find-babel-config` package, which is a sub-sub-sub-dependency of `babel-preset-expo`. A pull request has been opened in the Expo GitHub repository in January 2023. This issue may or may not get fixed with Expo SDK version 49. (21 March 2023).
