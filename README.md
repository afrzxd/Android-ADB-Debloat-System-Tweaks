# Android ADB Debloat & System Tweaks

provides two ways to apply the configuration:

1. Direct copy–paste from README
2. Using a dedicated shell script file
   
This repository contains a collection of ADB commands to:

- Remove selected preinstalled Google apps (user 0 only)
- Disable system animations
- Enable low power mode
- Disable auto sync
- Reduce screen brightness
- Enable always finish activities
- Switch to 3-button navigation
- Disable haptic feedback
- Restart SystemUI

⚠️ WARNING
- Apps are removed only for user 0 (not from the system partition).
- Some OEMs may block certain commands.
- Use at your own risk.

---

## Requirements

- Android device
- USB debugging enabled
- ADB installed
- Device authorized (`adb devices`)

---

# Method 1 — Direct Copy (Quick Execution)

Connect your device and run:

```bash
adb shell "
pm uninstall --user 0 com.google.android.youtube;
pm uninstall --user 0 com.google.android.gm;
pm uninstall --user 0 com.google.android.apps.maps;
pm uninstall --user 0 com.google.android.apps.youtube.music;
pm uninstall --user 0 com.google.android.apps.docs;
pm uninstall --user 0 com.google.android.apps.photos;
pm uninstall --user 0 com.google.android.calendar;
pm uninstall --user 0 com.google.android.videos;
pm uninstall --user 0 com.google.android.googlequicksearchbox;

settings put global window_animation_scale 0;
settings put global transition_animation_scale 0;
settings put global animator_duration_scale 0;

settings put global low_power 1;
settings put global auto_sync 0;
settings put global always_finish_activities 1;

settings put system screen_brightness 10;

settings put global mobile_data_speed_limit 1;
settings put global setup_wizard_has_run 1;
settings put global device_provisioned 1;

settings put secure navigation_mode 0;
settings put system haptic_feedback_enabled 0;

am force-stop com.android.systemui;
overlay disable com.android.internal.systemui.navbar.gestural;
cmd statusbar collapse
"
```
## Method 2 — Run via Script File (Recommended for Reuse)

This method is cleaner if you plan to reuse or version-control the configuration.

### Step 1 — Clone the Repository

```bash
git clone https://github.com/afrzxd/Android-ADB-Debloat-System-Tweaks
cd <Android-ADB-Debloat-System-Tweaks>
```

Or download the repository as ZIP and extract it.

---

### Step 2 — Create the Script File

```bash
cat << 'EOF' > android-minimal.sh
#!/bin/bash

adb shell "
pm uninstall --user 0 com.google.android.youtube;
pm uninstall --user 0 com.google.android.gm;
pm uninstall --user 0 com.google.android.apps.maps;
pm uninstall --user 0 com.google.android.apps.youtube.music;
pm uninstall --user 0 com.google.android.apps.docs;
pm uninstall --user 0 com.google.android.apps.photos;
pm uninstall --user 0 com.google.android.calendar;
pm uninstall --user 0 com.google.android.videos;
pm uninstall --user 0 com.google.android.googlequicksearchbox;

settings put global window_animation_scale 0;
settings put global transition_animation_scale 0;
settings put global animator_duration_scale 0;

settings put global low_power 1;
settings put global auto_sync 0;
settings put global always_finish_activities 1;

settings put system screen_brightness 10;

settings put global mobile_data_speed_limit 1;
settings put global setup_wizard_has_run 1;
settings put global device_provisioned 1;

settings put secure navigation_mode 0;
settings put system haptic_feedback_enabled 0;

am force-stop com.android.systemui;
overlay disable com.android.internal.systemui.navbar.gestural;
cmd statusbar collapse
"
EOF
```

---

### Step 3 — Make It Executable

```bash
chmod +x android-minimal.sh
```

---

### Step 4 — Run the Script

```bash
./android-minimal.sh
```
---

## Removed Applications

| App | Package |
|-----|---------|
| YouTube | com.google.android.youtube |
| Gmail | com.google.android.gm |
| Google Maps | com.google.android.apps.maps |
| YouTube Music | com.google.android.apps.youtube.music |
| Google Docs | com.google.android.apps.docs |
| Google Photos | com.google.android.apps.photos |
| Google Calendar | com.google.android.calendar |
| Google TV | com.google.android.videos |
| Google Search | com.google.android.googlequicksearchbox |

---

## Restore an App

To restore a removed app:

```bash
adb shell cmd package install-existing <package_name>
```

Example:

```bash
adb shell cmd package install-existing com.google.android.youtube
```

---

## Notes

- \`always_finish_activities=1\` closes every activity when leaving it (debug behavior).
- \`low_power=1\` enables Battery Saver.
- \`screen_brightness=10\` is very low brightness.
- \`navigation_mode=0\` forces 3-button navigation (not supported on all devices).

---

## License

Free to use. Modify at your own risk.
EOF
