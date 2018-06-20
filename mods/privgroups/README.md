# Privilege Groups

Allows granting and modifying of privs in bulk

Note: only the /grant and /group add behaviour currently exist.

## Usage

By default, a group called "member" is created which has everything in default_privs.
You can see its properties like so:

	/group info member

Groups can be created or expanded like so:

	/group add groupname privs

Groups are then granted to users like so:

	/grant username groupname

If the caller has the appropriate privileges to grant and privileges in the group,
then this will cause the player to enter the group and be granted all its privs.

You can remove privs from a group like so:

	/group remove groupname privs

This will remove that priv from any members of that group.
