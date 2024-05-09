#Requires AutoHotkey v2.0
; 获取坐标的模式，相对于屏幕
CoordMode "Pixel", "Screen"
CoordMode "Mouse", "Screen"

; 应用vim模式的窗口组
GroupAdd  "VimMode", "ahk_exe WindowsTerminal.exe"
GroupAdd  "VimMode", "ahk_exe Code.exe"
GroupAdd  "VimMode", "ahk_exe Obsidian.exe"

; 退出vim模式
VimEsc() {
  Send "{Esc}"
  if (PixelGetColor(2327, 1417) = "0xFFFFFF" || PixelGetColor(2292, 1417) = "0xFFFFFF" || PixelGetColor(2335, 1417) = "0xFFFFFF" || PixelGetColor(2280, 1417) = "0xFFFFFF")
    Send "{Ctrl}"
}

SetCapsLockState "AlwaysOff"

CapsLock::VimEsc()
