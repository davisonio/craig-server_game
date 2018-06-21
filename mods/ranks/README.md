![Screenshot](screenshot.png)

Advanced Ranks [ranks]
=======================
- GitHub: https://github.com/octacian/ranks
- Download: https://github.com/octacian/ranks/archive/master.zip
- Forum: https://forum.minetest.net/viewtopic.php?f=9&t=17640

**Notice:** Your experience with Ranks can be improved by using a development build of Minetest. In order to use Ranks at its full potential, you'll need to [build](https://forum.minetest.net/viewtopic.php?id=3837) Minetest yourself with [this commit](https://github.com/minetest/minetest/commit/bc53c82bcf923d11725e3de8565eb4c7e435cd2b) or newer (June 21st, 2017).

Ranks is an advanced ranks mod geared towards larger servers helps to both distiguish between players and make managing privileges much easier. With several ranks premade and a simplistic API, ranks is a good addition to any server, especially those with many players.

This mod was made in an effort to solve two problems. One of these is new players getting confused when they see moderators or administrators doing things that normal players cannot, resulting in repeated accusations of hacking. Ranks allows there to be no confusion between what a player should or should not be able to do, as their rank is displayed in both their nametag and as a prefix to chat messages sent by them.

Displaying the rank prefix on a player's nametag can be disabled by setting `ranks.prefix_nametag = false` in `minetest.conf`, while prefixes before chat messages can be disabled with `ranks.prefix_chat = false`. Ranks message prefixes are also supported even when used alongside my other chat-related mods, for example, [chat3](https://forum.minetest.net/viewtopic.php?t=17163).

Ranks also attempts to make privilege updates easier by allowing you to assign a set of privileges to each rank allowing a strict set of privileges for that rank, automatically granting missing privileges, and automatically revoking extra privileges (configurable per-rank). This means that when a player is given a rank with privilege definitions, they will automatically inherit the privileges specified. Whenever `/grant`, `/grantme`, or `/revoke` is called on a player, their privileges are updated according to rank and a warning is sent to the player who called the chatcommand if privileges are modified further.

### Configuration
All of the features provided by ranks can be configured directly from the advanced settings menu in the ranks subsection of the top-level Mods section. You can also configure ranks directly from `minetest.conf` with the settings listed below.

| Name                 | Type | Default | Description             |
| -------------------- | ---- | ------- | ----------------------- |
| ranks.prefix_chat    | bool | true    | Prefix chat messages    |
| ranks.prefix_nametag | bool | true    | Prefix nametags         |

### Packaged Ranks
By default, four ranks are included with the ranks mod, however, they are only for decoration purposes and do not modify any privileges as they should be configured by each server owner.

* Admin (`admin`)
* Moderator (`moderator`)
* Guardian (`guardian`)
* YouTube (`youtube`)

The above demonstrates that while ranks can be useful for managing privileges, it can also be a very nice form of progression/recognition.

### Usage
Ranks introduces two chatcommands, `/getrank` and `/rank`. The first allows you to get a player's rank while the latter allows you to set a player's rank and requires the `rank` chatcommand. **Note**: the player whose username is the same as the administrator (defined by `name` in `minetest.conf`) will automatically be granted the `rank` privilege.

**`/rank` Usage:**
```
Name or operation is either a player name, or "list" to list ranks
If the operation is "list", no new rank is needed
Setting new rank to "clear" causes all rank information to be removed from the player

/rank <name or operation> <new rank>
```

**`/getrank` Usage:**
```
Name is the name of the player whose rank you wish to retrieve
If name is blank, your own rank is returned

/getrank <name>
```

### Creating Ranks
You can create your own ranks and learn about privilege management in the API documentation. It explains how to manage privileges and register ranks with the `ranks.register` function. Registrations can be made either in the `ranks.lua` file of the mod itself (where default ranks or unregistered), or they can be preferrably placed in a `ranks.lua` file inside the world directory.

If you don't want one of the built in ranks, you can either register a new rank with the same name (effectively overriding the rank) or learn about `ranks.unregister` which can also be called from the world file.
