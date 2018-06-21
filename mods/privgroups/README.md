# Privilege Groups

Allows granting of privs in bulk

## Usage

Groups can be created or expanded like so:

	/group add groupname privs

You can remove privs from a group like so:

	/group remove groupname privs

Groups are then granted to users like so:

	/grant username groupname

The player will be granted all privs in the group which the caller has the
right to grant.
