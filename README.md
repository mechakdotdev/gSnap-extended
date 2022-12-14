# gSnap

An extension of the Gnome-shell extension by @micahosborne that allows you to move windows into specific regions similiar to FancyZones on Windows.

This extension was built from gSnap which was originally built on gTile, so thanks to the teams that worked on both of those.

### Installation from source
You can alternatively manually install the latest version from GitHub master branch:

1. Clone the repository to a folder of your choice.

   ```shell
   git clone https://github.com/mechakdotdev/gSnap-extended.git
   ```
   Note: It is not recommended to clone the repository directly into. The code gSnap
   installs into the extensions folder is a compiled version of the code in the
   git repository, and the files may conflict.)

2. Build and install

   You will need to [install NodeJS](https://nodejs.org) on your
   system to run the build tool. Then, you can run the installation script to
   install to `$HOME/.local/share/gnome-shell/extensions/gSnap@micahosborne`.
   
   ```shell
   npm run install-extension
   ```

3. Log out and log back in. (If you don't want to log out, you can restart gnome
   shell, which keeps all your windows open. Type `Alt`+`F2`, then type `r` and
   hit enter.)


### Debugging

If you encounter buggy behavior, it may help to view the log messages gSnap
writes. These may be viewed with the following shell command:

```shell
journalctl --follow /usr/bin/gnome-shell | grep "gSnap"
```

## Configuration

For configuration, please use the built-in preferences dialog (Gnome Tweak Tool -> Extensions -> gSnap -> Preferences).

* Keyboard shortcuts:
  * Currently you can switch between preconfigured layouts
  * You can set the margins between the windows as well
   
## Edit Layouts:
To edit a layout follow the instructions below
* Click "Edit Layout" (will edit the currently applied layout).
* Left-Click to split the region
* Middle-Click to split with opposite orientation
* Right-Click to remove

When done click "Stop Editing"

Layouts are stored in this file.
```shell
gedit ~/.local/share/gnome-shell/extensions/gSnap-extended@mechakdotdev/layouts.json 
```
After editing layouts disable and re-enable the plugin

Layouts are defined via json here is a 50% 50% split layout
```jsonc
  {
    "type": 0, // 0 for horizontal, 1 for vertical
    "length": 100, // Percentage of screen
    "items": [
      {
        "length": 50 // Percentage of parent
      },
      {
        "length": 50
      }
    ]
  }
```
Here is a 3 split configuration, with the column in the middle split into 3 zones
```jsonc
  {
    "length": 100, // 100% of screen
    "items": [
       // Column 1
      {
        "length": 42 // 42% of parent
      },
       // Column 2
      {
        "type": 1, // Layout items in vertical
        "length": 16, // 16% of parent
        "items": [
          {
            "length": 33
          },
          {
            "length": 34
          },
          {
            "length": 33
          }
        ]
      },
       // Column 3
      {
        "length": 42 // 42% of parent
      }
    ]
  }
```

## Usage with interface

1. Make sure the window you want to resize has focus
2. Click and drag a window to see the layouts and snap a window
3. Use the (configurable) shortcuts to switch between layouts. Ctrl+Super+KP[NUM]

Note: Right now the layouts can only be edited from source.  When I have more time i'll make a configuration file, or even and editor for this.  Feel free to contribute

Default shortcuts for `Super`+`Alt`+`[KP_1..KP_9]`

Shortcut | Description
------------ | -------------
`Super`+`Alt`+`KP_1` | Preset 1
`Super`+`Alt`+`KP_2` | Preset 2
`Super`+`Alt`+`KP_3` | Preset 3
`Super`+`Alt`+`KP_4` | Preset 4
`Super`+`Alt`+`KP_5` | Preset 5
`Super`+`Alt`+`KP_6` | Preset 6
`Super`+`Alt`+`KP_7` | Preset 7
`Super`+`Alt`+`KP_8` | Preset 8
`Super`+`Alt`+`KP_9` | Preset 9

## Source code

This extension is an extension of gSnap on [GitHub](https://github.com/micahosborne/gSnap), which is based on gTile which can be found here [GitHub](https://github.com/gTile/gtile).

gSnap is licensed under the [GPL v2+](https://www.gnu.org/licenses/gpl-2.0.html)

For debugging, enable debug in preferences, and in terminal run journalctl /usr/bin/gnome-shell -f

## Enjoy!
