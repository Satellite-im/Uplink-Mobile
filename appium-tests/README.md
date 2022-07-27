# Uplink Satellite - Proof Of Concept

Automation framework designed to create tests in webdriverIO with Appium for Android and iOS apps created on Flutter project

## Based on

This boilerplate is currently based on:

- **WebdriverIO:** `7.##.#`
- **Appium:** `1.22.#`

## Installation as a single repository

1. Running `git clone https://github.com/luisecm/appium-flutter-poc.git`
1. Running `npm install`
1. Installing Appium on a local machine. You can find detailed instructions for this process [here](https://appium.io/docs/en/about-appium/getting-started/)
1. Setting up Android and iOS on a local machine. The getting started page from Appium can be a helfpul guide for this process and it can be found [here](https://appium.io/docs/en/about-appium/getting-started/)
1. Create a `./apps` directory. Ask development team to provide .apk file for Android app and .zip file for iOS app. Move the files into the directory `apps`.
1. Running tests `npm run android.app` or `npm run android.app`

## Configuration files

This framework uses a specific config for iOS and Android, see [configs](./config). The configs are based on a shared config
[`wdio.shared.conf.ts`](./config/wdio.shared.conf.ts).
This shared config holds **all the defaults** so the iOS and Android configs only need to hold the capabilities and specs that are needed
for running on iOS and or Android.

Please check the [`wdio.shared.conf.ts`](./config/wdio.shared.conf.ts)-file for the minimal configuration options. Notes are added for why
a different value has been selected in comparison to the default values WebdriverIO provides.

Since we do not have Appium installed as part of this package we are going to use the globally installed version of Appium. This is
configured in [`wdio.shared.local.appium.conf.ts`](./config/wdio.shared.local.appium.conf.ts).

## Locator strategy for native apps

The locator strategy for this boilerplate is to use `accessibilityID`'s, see also the
[WebdriverIO docs](https://webdriver.io/docs/selectors#accessibility-id) or this newsletter on
[AppiumPro](https://appiumpro.com/editions/20).
`accessibilityID`'s make it easy to script once and run on iOS and Android because most of the apps already have some `accessibilityID`'s.

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
