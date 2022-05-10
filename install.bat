@echo off
IF NOT EXIST OpenJDK (
    mkdir OpenJDK
)
cd ./OpenJDK
curl -z OpenJDK17U-jdk_x64_windows_hotspot_17.0.3_7.msi -o OpenJDK17U-jdk_x64_windows_hotspot_17.0.3_7.msi -L https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.3+7/OpenJDK17U-jdk_x64_windows_hotspot_17.0.3_7.msi
OpenJDK17U-jdk_x64_windows_hotspot_17.0.3_7.msi
cd ..
IF NOT EXIST BuildTools (
    mkdir BuildTools
)
cd BuildTools
curl -z BuildTools.jar -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
set /p Input=Enter the version: || set Input=latest
"C:\Program Files\Eclipse Adoptium\jdk-17.0.3.7-hotspot\bin\java" -jar BuildTools.jar --rev %Input%
cd ..
copy /B .\BuildTools\spigot-*.jar spigot.jar
pause