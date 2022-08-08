# Uplink - UI Test Automation Framework

Test Automation Framework designed to create UI tests in webdriverIO and Appium for Android and iOS apps created by the Flutter project

## Based on

This automation framework is currently based on:

- **WebdriverIO:** `7.##.#`
- **Appium:** `1.22.#`

## Setting up to run on local machine

1. cd appium-tests && npm install
2. Install Appium on a local machine. You can find detailed instructions for this process [here](https://appium.io/docs/en/about-appium/getting-started/)
3. Setting up Android and iOS on a local machine. The getting started page from Appium can be a helfpul guide for this process and it can be found [here](https://appium.io/docs/en/about-appium/getting-started/)
4. You can run appium-doctor to validate that all Appium necessary dependencies were installed correctly [here](https://github.com/appium/appium-doctor). If environment variables are required, these can be added by editing the ~/.zshrc file:
```sh
# Open .zshrc file
nano ~/.zshrc

# Add the following environment variables to your .zshrc file:
export PATH="/Users/yourusername/Library/Android/sdk/tools:$PATH"
export PATH="/Users/yourusername/Library/Android/sdk/platform-tools:$PATH"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-18.0.1.1.jdk/Contents/Home" # Replace with the JDK folder from the JDK version installed on your machine
export ANDROID_HOME="/Users/yourusername/Library/Android/sdk"
```

5. Create a `appium-tests/apps` directory. Ask development team to provide the .apk file for Android app or .zip file for iOS app. 
6. Move the apk/zip files into the directory `apps`. Ensure that the files that will be placed in this folder have the following location/filename:
```sh
# For Android local execution
./appium-tests/apps/satellite-profile-latest.apk
# For iOS local execution
./appium-tests/apps/Runner.zip
```

Usually, the capabilities that could throw a mismatch on this Appium setup would be the App Filename, or the DeviceName/Platform. Both of these capabilities can be edited to match with your local settings, by editing the following files:
```sh
# For Android App Setup
./appium-tests/conf/wdio.android.app.conf.ts
# For iOS App Setup
./appium-tests/conf/wdio.ios.app.conf.ts
```

7. Running tests `npm run android.app` or `npm run android.app`

## Configuration files

This framework uses a specific config for iOS and Android, see [configs](./config). The configs are based on a shared config
[`wdio.shared.conf.ts`](./config/wdio.shared.conf.ts).
This shared config holds **all the defaults** so the iOS and Android configs only need to hold the capabilities and specs that are needed
for running on iOS and or Android.

Please check the [`wdio.shared.conf.ts`](./config/wdio.shared.conf.ts)-file for the minimal configuration options. Notes are added for why
a different value has been selected in comparison to the default values WebdriverIO provides.

Since we do not have Appium installed as part of this package we are going to use the globally installed version of Appium. This is
configured in [`wdio.shared.local.appium.conf.ts`](./config/wdio.shared.local.appium.conf.ts).

Finally, since there is a github action setup to run the appium tests on Android, there is one configuration file used to run these tests on CI. . This is configured in [`wdio.android.ci.conf.ts`](./config/wdio.android.ci.conf.ts).

## Locator strategy for native apps

The locator strategy for this Test Automation Framework is to preferrably use `accessibilityID`'s. `AccessibilityID`'s make it easy to script once and run on iOS and Android because most of the apps already have some `accessibilityID`'s.

If `accessibilityID`'s can't be used, and for example only XPATH is available, then a conditional selector based on driver.isIOS or driver.isAndroid can be created
## Native App Tests

All tests can be executed on te devices as configured in [`wdio.android.app.conf.ts`](./config/wdio.android.app.conf.ts) or
[`wdio.ios.app.conf.ts`](./config/wdio.ios.app.conf.ts). Please check the below tests on what they do or on how to run them separately.

```sh
# For Android local execution
npm run android.app
# For iOS local execution
npm run ios.app
```