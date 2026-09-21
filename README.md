# Windows Hidden Extension Toggle
A lightweight Windows batch script that allows users to show or hide hidden file extensions in File Explorer, helping reduce the risk of confusion with deceptive shortcut files used by malware.
[Wiki](https://github.com/Miiraak/Show-Hidden-File-Extensions/wiki)

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
