#Requires AutoHotkey v2.0

; scrcpy 快捷键
#HotIf WinActive("ahk_exe scrcpy.exe")

; alt+t 打开telegram
!t:: Run "cmd /c adb.exe shell am start -n org.telegram.messenger/org.telegram.ui.LaunchActivity"

; alt+q 打开QQ
!q:: Run "cmd /c adb.exe shell am start -n com.tencent.mobileqq/.activity.SplashActivity"

#HotIf
