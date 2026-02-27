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
