Ranks API
=========
The ranks API allows you to register, unregister, and manage ranks.

`ranks.register(name, def)`

* Register a new rank
* `name`: Name for rank (name cannot be `clear`)
* `def`: See [#Rank definition]

`ranks.unregister(name)`

* Unregister a rank
* `name`: Name of rank

`ranks.list_plaintext()`

* Returns a plaintext, comma-separated list of ranks

`ranks.get_rank(player)`

* Returns the player's rank or `nil`
* `player`: PlayerRef or string

`ranks.get_def(name)`

* Returns the rank definition or `nil`
* `name`: Name of rank

`ranks.update_privs(player)`

* Checks and updates player privileges based on rank definition
* Returns `true` if successful, `nil` if player has no rank
* Automatically called `on_joinplayer` and on `ranks.set_rank`
* `player`: PlayerRef or string

`ranks.update_nametag(player)`

* Checks and updates player nametag based on rank definition
* Returns `true` if successful, `nil` if player has no rank
* Automatically called `on_joinplayer` and on `ranks.set_rank`
* `player`: PlayerRef or string

`ranks.set_rank(player, rank)`

* Changes a player's rank
* Returns `true` if successful, `nil` if rank doesn't exist
* `player`: PlayerRef or string
* `rank`: Name of rank

`ranks.remove_rank(player)`

* Removes all ranking information from a player
* `player`: PlayerRef or string

`ranks.chat_send(name, message)`

* Simulates a chat message being sent to all players from a ranked player
* `name`: Sender player name
* `message`: Message to send

#### Rank definition
```lua
{
	prefix = "Moderator", -- Prefix to be shown on nametag and chat
	colour = {a = 255, r = 255, g = 83, b = 37}, -- A table of RGBA values, a single base colour (e.g. "red"), or a hex string
	strict_privs = false, -- Whether the rank should have a strict set of privileges (prevents privileges from being granted/revoked)
	grant_missing = true, -- Whether missing privileges should be automatically granted
	revoke_extra = false, -- Whether extra privileges should be automatically revoked
	privs = { -- Default privileges (usage modified by above items)
		interact = true,
		shout = true,
		fly = true,
		fast = true,
		...
	}
}
```
