# Windows LNK Extension Toggle
A lightweight Windows batch script that allows users to show or hide .lnk file extensions in File Explorer, helping reduce the risk of confusion with deceptive shortcut files used by malware.

## Description
This project provides an interactive batch script for Windows that toggles the visibility of .lnk file extensions in Explorer.

Shortcuts (.lnk) are often used by malware to disguise malicious files behind seemingly harmless names. Even when the option "Show file extensions" is enabled, .lnk files can still be hidden or visually misleading, which creates a risk of users clicking on files that appear to be harmless documents or images while actually being shortcuts to malicious payloads.

This script modifies the appropriate Windows [registry settings](https://en.wikipedia.org/wiki/Shortcut_(computing)#cite_note-2) to show or hide .lnk extensions quickly and safely through a simple menu-driven interface.
> I know some ppl that can clic on even if they saw "doc.txt.lnk" 😢 but it can still be useful for others 🤔

## Features
- Interactive menu in batch format
- Toggle extension visibility on demand
  - .lnk
- Simple and lightweight solution for Windows
- Registry-based changes for system behavior

## Prerequisites
- Windows OS (only tested on 11)
- Admin rights

## Usage
1. Download or copy the script file `showlnk.bat`
2. Right-click the script and choose: "Run as administrator" (recommended).
3. Select an option from the interactive menu ; 1 to enable, 2 to disable, 3 to quit.
4. Done !

## Issues and Suggestions
If you encounter any issues or have suggestions for improving the project, please use the [GitHub issue tracker](https://github.com/Miiraak/Show-LNK/issues).

## License
This project is licensed under the MIT. See the [LICENSE](./LICENSE) file for more details.

## Authors
- [**Miiraak**](https://github.com/Miiraak) - *Lead Developer*
