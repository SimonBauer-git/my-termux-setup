cd C:\Users\simon\Desktop\Hobby\platform-tools
adb shell  "/system/bin/device_config put activity_manager max_phantom_processes 2147483647"
adb shell "/system/bin/device_config set_sync_disabled_for_tests persistent