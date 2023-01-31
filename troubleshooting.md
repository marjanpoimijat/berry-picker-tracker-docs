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
1. Jos kyseessä on uvtools-riippuvuus, käytä workflowssa pienempää versiota. Python 3.9 on toimiva (tammikuu 2023).
