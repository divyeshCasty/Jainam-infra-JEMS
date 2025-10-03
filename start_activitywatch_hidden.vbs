Set WshShell = CreateObject("WScript.Shell")

' --- Kill existing ActivityWatch processes ---
WshShell.Run "taskkill /F /IM aw-server.exe /T", 0, True
WshShell.Run "taskkill /F /IM aw-watcher-afk.exe /T", 0, True
WshShell.Run "taskkill /F /IM aw-watcher-window.exe /T", 0, True
WshShell.Run "taskkill /F /IM aw-watcher-input.exe /T", 0, True
WshShell.Run "taskkill /F /IM aw-watcher-web.exe /T", 0, True

' --- Free port 5600 if occupied ---
' Find PID using port 5600 and kill it
WshShell.Run "cmd /c for /f ""tokens=5"" %a in ('netstat -ano ^| findstr :5600 ^| findstr LISTENING') do taskkill /F /PID %a", 0, True

' --- Start ActivityWatch hidden ---
WshShell.Run """C:\ProgramData\activitywatch\aw-server\aw-server.exe"" --host 0.0.0.0 --port 5600", 0, False
WshShell.Run """C:\ProgramData\activitywatch\aw-watcher-afk\aw-watcher-afk.exe""", 0, False
WshShell.Run """C:\ProgramData\activitywatch\aw-watcher-window\aw-watcher-window.exe""", 0, False
WshShell.Run """C:\ProgramData\activitywatch\aw-watcher-input\aw-watcher-input.exe""", 0, False
WshShell.Run """C:\ProgramData\activitywatch\aw-watcher-web\aw-watcher-web.exe""", 0, False
