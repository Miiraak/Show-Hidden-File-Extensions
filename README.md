# Windows Hidden Extension Toggle
A lightweight Windows batch script that allows users to show or hide hidden file extensions in File Explorer, helping reduce the risk of confusion with deceptive shortcut files used by malware.
[Wiki](https://github.com/Miiraak/Show-Hidden-File-Extensions/wiki)

## Features
|Features|Basic|Extended|
|:--|:--:|:--:|
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
1. Download the repository : <img width="80" height="30" alt="image" src="https://github.com/user-attachments/assets/2b62872c-b2cc-4307-be6e-99c352143170" /> <img width="105" height="25" alt="image" src="https://github.com/user-attachments/assets/5d111fd3-da3f-4104-81b4-56cc3a9eb8f9" />
2. Right-click the zip and Extract all.
4. Right-click the extracted script and choose: "Run as administrator" (recommended).   
5. Select an option from the interactive menu ; 1 to enable, 2 to disable, 3 to quit.
> Done, you can quickly see if changes have occurred by taking a look into the sample folder!

## Issues and Suggestions
If you encounter any issues or have suggestions for improving the project, please use the [GitHub issue tracker](https://github.com/Miiraak/Show-Hidden-File-Extensions/issues).

## License
This project is licensed under the MIT. See the [LICENSE](./LICENSE) file for more details.

## Authors
- [**Miiraak**](https://github.com/Miiraak) - *Lead Developer*
