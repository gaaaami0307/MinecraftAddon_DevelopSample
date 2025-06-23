@echo off
set SOURCE_D=C:\programming\minecraft_addon_develop\rouge\rouge_function_behavior
set DEST_D=C:\Users\nakah\AppData\Local\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\development_behavior_packs\rouge_function_behavior
set SOURCE_R=C:\programming\minecraft_addon_develop\rouge\rouge_function_resources
set DEST_R=C:\Users\nakah\AppData\Local\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\development_resource_packs\rouge_function_resources

:: 既存のフォルダを削除（存在する場合のみ）
if exist "%DEST_D%" (
    rd /s /q "%DEST_D%"
)
if exist "%DEST_R%" (
    rd /s /q "%DEST_R%"
)
:: コピー実行
xcopy "%SOURCE_D%" "%DEST_D%" /E /I /Y
xcopy "%SOURCE_R%" "%DEST_R%" /E /I /Y

echo コピー完了しました。
pause