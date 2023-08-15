[Back](README.md)

## Dev Environment Install

<hr>

### 1. Install Android Studio

Download Link: <br />
https://developer.android.com/studio

If you are installing Android Studio for the first time, the initial dialog that appears once the setup process starts may resemble that shown in below:
![AndroidStudio Setup](https://raw.githubusercontent.com/Elliot518/mcp-oss-repo/main/android/AndroidStudioSetup.png)

&nbsp;

### 2. Installing additional Android SDK packages

The steps performed so far have installed the Android Studio IDE and the current set of default Android SDK packages.

Android Studio->Settings->Languages & Frameworks->Android SDK

To install older versions of the Android SDK simply select the checkboxes  corresponding to the versions and click on the Apply button.

Support older versions of Android as far back as Android 8.0 (Oreo), this is to ensure that the apps run on a wide range of Android devices. Within the list of SDK versions, enable the checkbox next to Android 8.0 (Oreo) and click on the Apply button.

![Android SDK](https://raw.githubusercontent.com/Elliot518/mcp-oss-repo/main/android/AndroidSDK.png)


#### Make sure that the following packages are listed as Installed in the Status column: 

- Android SDK Build-tools
- Android Emulator
- Android SDK Platform-tools
- Google Play Services
- Intel x86 Emulator Accelerator (HAXM installer)* • Google USB Driver (Windows only)
- Layout Inspector image server for API 31 and T

![Android SDK Tools](https://raw.githubusercontent.com/Elliot518/mcp-oss-repo/main/android/AndroidSDKTools.png)

#### Config android sdk environment variables
```
<path_to_android_sdk_installation>/sdk/cmdline-tools/latest/bin
<path_to_android_sdk_installation>/sdk/platform-tools
```


Verify that the platform-tools value is correct by attempting to run the adb tool as follows:
```
adb
```
The tool should output a list of command-line options when executed:
Android Debug Bridge version xxx

