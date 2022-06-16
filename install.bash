#!/bin/bash
sudo brew install openjdk@17
mkdir -p BuildTools
rm ./BuildTools/spigot-*.jar
cd BuildTools
curl -z BuildTools.jar -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
echo Enter a game version \(1.18.2, latest, 1.19, etc\): 
read version
java -jar BuildTools.jar --rev $version
cd ..
cp ./BuildTools/spigot-*.jar spigot.jar
echo Done!