######################################################
# windows 启动 scrcpy 投屏并开启键盘输入优化输入体验
# @author: Linkzz
# @date 2024-02-04
######################################################

# 获取usb设备序列号
$serialNo = adb.exe devices | Where-Object {$_ -match '([\w]{8})\sdevice$'} | ForEach-Object {$Matches[1]} | Select-Object -First 1
if (-not $serialNo)
{
  Write-Host("Please connect usb device and try again!")
  exit
}

# 检查安卓是否已连接otg实体键盘
$vendor = adb.exe -s $serialNo shell dumpsys input | grep vendor=0xffff
if (-not $vendor)
{
  # otg 模式模拟键盘
  $app = Start-Process scrcpy.exe -ArgumentList "-K --otg -s $serialNo" -PassThru -WindowStyle Hidden
  # 等待键盘事件加载完毕
  Start-Sleep 3
  # 关闭进程保留键盘连接
  Stop-Process -Id $app.Id
}

# 启动 scrcpy 投屏
Start-Process scrcpy.exe -ArgumentList "-s $serialNo -S --power-off-on-close --window-height=1080" -WindowStyle Hidden
