@echo off
set SOURCE=C:\programming\minecraft_addon_develop\rouge\rouge_function_behavior
set DEST=C:\Users\nakah\AppData\Local\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\development_behavior_packs

xcopy "%SOURCE%" "%DEST%" /E /I /Y

echo コピー完了しました。
pause