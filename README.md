[![Downloads](https://cf.way2muchnoise.eu/full_1086231_downloads.svg)](https://www.curseforge.com/wow/addons/todochecklister2)
[![Downloads](https://img.shields.io/github/downloads/hutcho/TodoChecklister/total)](https://github.com/hutcho/TodoChecklister/releases)

# TodoChecklister

A todo list addon for World of Warcraft. Save a persistent list that that you can update
on any character you play. Write things down so you don't forget them. Tick them off.
Delete them from the list.

This addon is listed under the name TodoChecklister2 on curseforge, but it will appear
in game as just TodoChecklister (without the 2).

![demoGif](./demo1.2.gif)

- Write a thing you need todo later on your list
- Link items from you bag
- Display item counts
- List is saved even when you log out
- Drag list items around to change the order
- Click the name of an item to edit
- Multi-add items with the "Keep focus" option
- More options like opacity or toggling in "ESC" -> Options -> Addons -> TodoChecklister

## Installation

- Search for it on curseforge as `TodoChecklister2`

or

- Download here and extract the files on your WoW Addon folder,
  usually `C:\Program Files (x86)\World of Warcraft\_retail_\Interface\AddOns\TodoChecklister`.
- Your file structure should look like this:

  ```
  WoWInstallFolder\_retail_\Interface\AddOns\TodoChecklister\TodoChecklister.toc
  WoWInstallFolder\_retail_\Interface\AddOns\TodoChecklister\TodoChecklister\src\
  and so on
  ```

## Commands

`/todo help` - Display available commands

`/todo show` - Show the list

`/todo hide` - Hide the list

`/todo toggle` - Show/hide the list

`/todo add MESSAGE` - Adds `MESSAGE` to your list
  Example: `/todo add do nagrand dailies` will add a item named "do nagrand dailies" to your list

`/todo tick INDEX` - Ticks/unticks an item at `INDEX`
  Example: `/todo tick 1` ticks the first item on your list

`/todo move FROM_INDEX TO_INDEX` - Move item from `FROM_INDEX` to `TO_INDEX`
  Example: `/todo move 1 3` moves the first item to the 3rd slot

`/todo remove INDEX` - Remove item at `INDEX`
  Example: `/todo remove 1` removes the first item from the list

`/todo set` - Open Addon options screen. Can also use `/todo options`.

`/todo resetposition` - Reset the list window to its default size, position and scale. Does not touch the list items.


# Download links

You can download it from:
- <https://www.curseforge.com/wow/addons/todochecklister2>
- <https://github.com/hutcho/TodoChecklister/tags>


# Credits

This addon is a fork of https://github.com/AssisrMatheus/TodoChecklister. All original work was done by assisrMatheus. I have done renovation work to get it working without errors on modern retail WoW.
