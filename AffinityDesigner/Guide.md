1.Install ElementalWarrior's wine fork's binaries (https://github.com/Twig6943/ElementalWarrior-wine-binaries/releases)

2.Install heroic games launcher (AppImage/Flatpak recommended)

3.Exract the ElementalWarrior's wine fork's binaries to heroic games launcher's wine directory

AppImage:/home/USER/.config/heroic/tools/wine

Flatpak:/home/USER/.var/app/com.heroicgameslauncher.hgl/config/heroic/tools/wine

4.Open up heroic games launcher and then click on "add game"

5.Name it whatever you want

6.Set the wine version to ElementalWarriorWine

7.Select the setup .exe you've downloaded from affinity's website as the executable

8.Click Finish

9.In order to initialize the prefix run the setup file from heroic. (It'll probably crash wait for it to crash if it somehow opens up close it yourself)

10.Right click on affinity on heroic and open up its settings

11.Scroll down until you see winetricks & then click on it

12.Search & install these dependencies;

dotnet48

corefonts

(Wait while its installing the dependencies. Its %90 not stuck but rather taking its time!!!)

14.Click on "OPEN WINETRICKS GUI"

15.Select "Select the default wineprefix"

16.Select "Change settings"

17.Toggle "win11"

18.Toggle "renderer=vulkan" and click OK

19.Keep pressing "Cancel" till the winetricks window closes

20.Close heroic games launcher's settings window

21.Unzip WinMetadata.zip to drive_c/windows/system32 (https://archive.org/download/win-metadata/WinMetadata.zip)

22.Press launch and the setup should work

23.Once its done installing right click to affinity on heroic and go to the details tab

24.Click on the 3 dots (located on the right top corner)

25.Edit App/Game

26.Change the executable to drive_c/Program Files/Affinity/Designer 2/Designer.exe

27.Click finish & launch it

(Change the settings in the wine tab if it doesn't work or if you have gpu glitches (it should work fine tho) )

# Optional wine dark theme 🍷
1.Download this file https://raw.githubusercontent.com/Twig6943/AffinityOnLinux/main/wine-dark-theme.reg

2.Right click to your affinity app and go to settings

3.Click to winetricks

4.Click to OPEN WINETRICKS GUI

5.Select default prefix

6.Run regedit

7.Registry>Import registry file

8.Pick the file you've downloaded earlier (wine-dark-theme.reg)

9.You should now have dark theme working

### Special Thanks

[Ardishco](https://github.com/raidenovich)

Deviaze

Kemal

Jacazimbo <3

Kharoon

Jediclank134
