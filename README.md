# Windows Hidden Extension Toggle
A lightweight Windows batch script that allows users to show or hide hidden file extensions in File Explorer, helping reduce the risk of confusion with deceptive shortcut files used by malware.

## Description
This project provides an interactive batch script for Windows that toggles the visibility of all hidden file extensions in Explorer.

These hidden extensions are often used by malware to disguise malicious files behind seemingly harmless names. Even when the option "Show file extensions" is enabled, those files can still be hidden or visually misleading, which creates a risk of users clicking on files that appear to be harmless documents or images while actually being shortcuts to malicious payloads.

This script modifies the appropriate Windows registry settings to show or hide extensions quickly and safely through a simple menu-driven interface.
> I know some ppl that can clic on even if they saw "doc.txt.lnk" or else 😢 but it can still be useful for others 🤔

## Features
|Features|Basic|Extended|
|--:|:--:|:--:|
|Interactive menu in batch format| ✔️ | ✔️ |
|Extensions| <ul><li>`.lnk`</li><li>`.url`</li><li>`.pif`</li><li>`.scf`</li><li>`.library-ms`</li><li>`.website`</li><li>`.searchconnector-ms`</li><li>`.search-ms`</li><li>`.SettingContent-ms`</li></ul> | <ul><li>All extensions from basic</li><li>`.mydocs`</li><li>`.ZFSendToTarget`</li><li>`.MAPIMail`</li><li>`.DeskLink`</li></ul> |
|Registry-based changes for system behavior| ✔️ | ✔️ |
|Admin rights detection, auto restart with prompt UAC| ✔️ | 🔴 _(Not working for the system rights)_ |
|Hidden files| ✔️ | ✔️ |
|Extensions visibility| ✔️ | ✔️ |
|Super hidden files| ✔️ | ✔️ |

## Prerequisites
- Windows OS (only tested on 11)
- Admin rights
- _(For extended)_ NT autority/System rights

## Usage
1. Download or copy the script file `ShowHiddenExtensions.bat`
2. Right-click the script and choose: "Run as administrator" (recommended).   
4. Select an option from the interactive menu ; 1 to enable, 2 to disable, 3 to quit.
5. Done !

## Issues and Suggestions
If you encounter any issues or have suggestions for improving the project, please use the [GitHub issue tracker](https://github.com/Miiraak/Show-Hidden-File-Extensions/issues).

## License
This project is licensed under the MIT. See the [LICENSE](./LICENSE) file for more details.

## Authors
- [**Miiraak**](https://github.com/Miiraak) - *Lead Developer*
