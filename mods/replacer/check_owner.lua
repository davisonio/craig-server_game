-- taken from Vanessa Ezekowitz' homedecor mod
-- see http://forum.minetest.net/viewtopic.php?pid=26061 or https://github.com/VanessaE/homedecor for details!
function replacer_homedecor_node_is_owned(pos, placer)

	if type( minetest.is_protected == "function") then
		return minetest.is_protected( pos, placer:get_player_name() );
	end


        local ownername = false
        if type(IsPlayerNodeOwner) == "function" then                                   -- node_ownership mod
                if HasOwner(pos, placer) then                                           -- returns true if the node is owned
                        if not IsPlayerNodeOwner(pos, placer:get_player_name()) then
                                if type(getLastOwner) == "function" then                -- ...is an old version
                                        ownername = getLastOwner(pos)
                                elseif type(GetNodeOwnerName) == "function" then        -- ...is a recent version
                                        ownername = GetNodeOwnerName(pos)
                                else
                                        ownername = "someone"
                                end
                        end
                end

        elseif type(isprotect)=="function" then                                         -- glomie's protection mod
                if not isprotect(5, pos, placer) then
                        ownername = "someone"
                end
        end

        if ownername ~= false then
                minetest.chat_send_player( placer:get_player_name(), "Sorry, "..ownername.." owns that spot." )
                return true
        else
                return false
        end
end

