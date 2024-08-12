<!-- [![Downloads](http://cf.way2muchnoise.eu/full_341737_downloads.svg)](https://www.curseforge.com/wow/addons/todochecklister)
[![Downloads](https://img.shields.io/github/downloads/AssisrMatheus/TodoChecklister/total)](https://github.com/AssisrMatheus/TodoChecklister/releases)
[![Gitmoji](https://img.shields.io/badge/gitmoji-%20😜%20😍-FFDD67.svg)](https://gitmoji.carloscuesta.me) -->

<!--
## Download links
You can download it from a handful of places:
- [Curseforge/twitch](https://www.curseforge.com/wow/addons/todochecklister/files)
- [Github releases](https://github.com/AssisrMatheus/TodoChecklister/releases)
- [WoW Interface - Retail](https://www.wowinterface.com/downloads/info25349-TodoChecklister.html)
- [WoW Interface - Classic](https://www.wowinterface.com/downloads/info25348-TodoChecklister.html) -->

# TodoChecklister redux
A todolist/checklist AddOn for World of Warcraft. Save the bad guy's names, the items you're going to farm, the path you're going to take.

![demoGif](./demo1.2.gif)

- Link items from you bag and display their amount
- List is saved even when you log out
- Drag items around to move them
- Click to edit
- Multi-add items with "Keep focus" option!
- More options like opacity or toggling in "Esc" -> Options -> Addons -> TodoChecklister

## Installation
- Download the latest version from any link in the top of this page
- Extract the files on your WoW Addon folder, usually `C:\Program Files (x86)\World of Warcraft\_retail_\Interface\AddOns\TodoChecklister`.
- Your file structure should look like this:

  ```
  WoWInstallFolder\_retail_\Interface\AddOns\TodoChecklister\TodoChecklister.toc
  WoWInstallFolder\_retail_\Interface\AddOns\TodoChecklister\TodoChecklister\src\...
  ```

## How to use it
- If you have an AddOn that integrates with `AceAddon` or `LibDBIcon`, the TodoChecklister icon will show on your minimap. You can show the list by clicking the icon.

	![mapButton](./button.png)

- Type `/todo tg` to toggle the list

## List of slash commands
`/todo help` - Display available commands

`/todo reload` - Reset you window to its default properties(size, position, scale)

`/todo tg` - Toggle the Todo window

`/todo add {message}` - Adds `{message}` to your item list
  Example: `/todo add My item` will add a item named "My item" to your list

`/todo rmv {position}` - Remove item in `{position}`
  Example: `/todo rmv 1` removes the first item from the list

`/todo mv {original_position} {target_position}` - Move item from `{original_position}` to `{target_position}`
  Example: `/todo mv 1 3` Moves the first item in the list to the 3rd slot

`/todo chk {position}` - Check or unchecks an item in `{position}`
  Example: `/todo chk 1` Checks the first intem on your list
