######################################################
# windows 启动 scrcpy 投屏并开启键盘输入优化输入体验
# @author: Linkzz
# @date 2024-02-04
######################################################

# 检查安卓是否已加载键盘事件
adb.exe -d shell getevent -lp /dev/input/event9
if (-not ($LASTEXITCODE -eq "0"))
{
  # otg 模式模拟键盘
  $app = Start-Process scrcpy.exe -ArgumentList "-K --otg -s d81f5133" -PassThru -WindowStyle Hidden
  # 等待键盘事件加载完毕
  Start-Sleep 3
  # 关闭进程保留键盘连接
  Stop-Process -Id $app.Id
}

# 启动 scrcpy 投屏
Start-Process scrcpy.exe -ArgumentList "-d -S --power-off-on-close --window-height=1080" -WindowStyle Hidden
