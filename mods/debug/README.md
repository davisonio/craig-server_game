# Debug

## Description
A minetest mod that allows in-game debugging/monitoring of the minetest logfile.

## Features
Adds in-game commands to view or search logfiles in chat and to shutdown the server for players with ban priv:

Return list of last 100 or any indicated number of lines from log file.
	`/debug <number of lines>`

Searches log file for matches of search phrase. Phrase and entries are searched in all lowercase to return results with minor capitalization differences.
	`/grep <search phrase>`

Shutdown the server with 10 second delay. 	
	`/shutdown`
    
If configuration file is set with
    `debug_archive = true`
The mod uses tar to occasionally archive the debug file to optomize searches. The max size of the file before being archived is 30000000 bytes or can be set in minetest.conf with:
    `debug_max_size = <number of bytes>`

## Requirements & Setup
This mod was developed and designed primarily for servers hosted on Linux. The mods should work with the exception of the archiving feature on other OSs.

For this mod to work properly it must be run via command line with the "--logfile" set to log to "debug.txt" in the world folder.
    `minetest --logfile ~/.minetest/worlds/your_world_name/debug.txt`

The archiving feature requires the following setting in minetest.conf:
	`secure.trusted mods = debug`
The *init.lua* file must be configured to the path of your log file. See comments in the file for more info. 	
	
No other mod dependencies.
		
## License
MIT --See license.txt
