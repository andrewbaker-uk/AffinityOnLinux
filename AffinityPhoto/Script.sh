#!/bin/bash

# Check for required dependencies
missing_deps=""

check_dependency() {
  if ! command -v "$1" &> /dev/null; then
    missing_deps+="$1 "
  fi
}

check_dependency "wine"
check_dependency "winetricks"
check_dependency "wget"
check_dependency "curl"
check_dependency "7z"
check_dependency "tar"
check_dependency "jq"

if [ -n "$missing_deps" ]; then
  echo "The following dependencies are missing: $missing_deps"
  echo "Please install them and rerun the script."
  exit 1
fi

echo "All dependencies are installed!"
sleep 2

directory="$HOME/.AffinityLinux"

#Kill wine
wineserver -k
# Create install directory
mkdir -p "$directory"

# Fetch the latest release information from GitHub
asset_url=$(wget -qO- https://api.github.com/repos/Twig6943/ElementalWarrior-Wine-binaries/releases/latest | jq -r '.assets|last|.browser_download_url')

# Download the specific release asset
wget "$asset_url" -O "$directory/ElementalWarriorWine.tar.gz"

# Download files
wget https://upload.wikimedia.org/wikipedia/commons/f/f5/Affinity_Photo_V2_icon.svg -O "/home/$USER/.local/share/icons/AffinityPhoto.svg"
wget https://archive.org/download/win-metadata/WinMetadata.zip -O "$directory/Winmetadata.zip"

# Extract wine binary
tar -xvzf "$directory/ElementalWarriorWine.tar.gz" -C "$directory"

# Erase the ElementalWarriorWine.tar.gz
rm "$directory/ElementalWarriorWine.tar.gz"

# WINETRICKS stuff
WINEPREFIX="$directory" winetricks --unattended dotnet35 dotnet48 corefonts
WINEPREFIX="$directory" winetricks renderer=vulkan

# Extract & delete WinMetadata.zip
7z x "$directory/Winmetadata.zip" -o"$directory/drive_c/windows/system32"
rm "$directory/Winmetadata.zip"
# Start the setup
echo "Put Setup .exe to $directory and press any key when ready."
read -n 1

echo "Click No if you get any errors. Press any key to continue."
read -n 1

# Kill Wine
wineserver -k

#Set windows version to 11
WINEPREFIX="$directory" winecfg -v win11
WINEPREFIX="$directory" wine "$directory"/*.exe
rm "$directory"/affinity*.exe

#Wine dark theme
wget https://raw.githubusercontent.com/Twig6943/AffinityOnLinux/main/wine-dark-theme.reg -O "$directory/wine-dark-theme.reg"
WINEPREFIX="$directory" regedit "$directory/wine-dark-theme.reg"
rm "$directory/wine-dark-theme.reg"

#Remove Desktop entry created by wine
rm "/home/$USER/.local/share/applications/wine/Programs/Affinity Photo 2.desktop"

# Create Desktop Entry
echo "[Desktop Entry]" >> ~/.local/share/applications/AffinityPhoto.desktop
echo "Name=Affinity Photo" >> ~/.local/share/applications/AffinityPhoto.desktop
echo "Comment=A powerful image editing software." >> ~/.local/share/applications/AffinityPhoto.desktop
echo "Icon=/home/$USER/.local/share/icons/AffinityPhoto.svg" >> ~/.local/share/applications/AffinityPhoto.desktop
echo "Path=$directory" >> ~/.local/share/applications/AffinityPhoto.desktop
echo "Exec=env WINEPREFIX=$directory $directory/ElementalWarriorWine/bin/wine \"$directory/drive_c/Program Files/Affinity/Photo 2/Photo.exe\"" >> ~/.local/share/applications/AffinityPhoto.desktop
echo "Terminal=false" >> ~/.local/share/applications/AffinityPhoto.desktop
echo "NoDisplay=false" >> ~/.local/share/applications/AffinityPhoto.desktop
echo "StartupWMClass=photo.exe" >> ~/.local/share/applications/AffinityPhoto.desktop
echo "Type=Application" >> ~/.local/share/applications/AffinityPhoto.desktop
echo "Categories=Graphics;" >> ~/.local/share/applications/AffinityPhoto.desktop
echo "StartupNotify=true" >> ~/.local/share/applications/AffinityPhoto.desktop

cp ~/.local/share/applications/AffinityPhoto.desktop ~/Desktop/AffinityPhoto.desktop

# Copy to desktop
cp "$HOME/.local/share/applications/AffinityPhoto.desktop" "$HOME/Desktop/AffinityPhoto.desktop"

# Special Thanks section
echo "******************************"
echo "    Special Thanks"
echo "******************************"
echo "Ardishco (github.com/raidenovich)"
echo "Deviaze"
echo "Kemal"
echo "Jacazimbo <3"
echo "Kharoon"
echo "Jediclank134"
read -n 1
