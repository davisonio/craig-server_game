-- Transactor mod for Minetest
-- Copyright 2012 Mark Holmquist <mtraceur@member.fsf.org>
--
-- The transactor mod is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- The transactor mod is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with the transactor mod. If not, see <http://www.gnu.org/licenses/>.

transactor_transactions['factory:factory'] = {
	get = function ( pos, wishlist )
		local inv = minetest.get_meta( pos ):get_inventory(), itst
		if wishlist ~= nil then
			for _, thing in ipairs( wishlist ) do
				itst = ItemStack( thing )
				if inv:contains_item( 'dst', itst ) then
					return inv:remove_item( 'dst', itst )
				end
				return false
			end
		else
			ix = inv:get_size( 'dst' ) - 1
			if not inv:is_empty( 'dst' ) then
				itst = inv:get_stack( 'dst', ix )
				while ix > 0 and ( itst == nil or itst:is_empty() ) do
					ix = ix - 1
					itst = inv:get_stack( 'dst', ix )
				end
				if itst == nil or itst:is_empty() then
					return false
				end
				itst = ItemStack( itst:get_name() )
				return inv:remove_item( 'dst', itst )
			end
			return false
		end
	end,
	add = function ( pos, thing, addcb )
        if not thing then
            return false
        end
        local inv = minetest.get_meta( pos ):get_inventory()
        local listname, leftover

		local prefer_fuel = function ( inven, something )
			if inven:is_empty( 'fuel' ) then
				return true
			else
				if not inven:contains_item( 'fuel', something ) then
					return false
				else
					if inven:contains_item( 'rec', something ) then
						return false
					else
						return true
					end
				end
			end
		end

        local out, _ = minetest.get_craft_result( { method = 'fuel', width = 1, items = { thing } } )
        if out.time ~= 0 and prefer_fuel( inv, thing ) then
            listname = 'fuel'
        else
            if inv:contains_item( 'rec', thing ) then
                listname = 'src'
            end
        end
        if listname ~= nil then
            leftover = inv:add_item( listname, thing )
        else
            leftover = thing
        end
        if not leftover:is_empty() and addcb ~= nil then
            addcb( thing )
        end
	end,
	get_wishlist = function ( pos )
		local wishlist = {}
		local inv = minetest.get_meta( pos ):get_inventory()
		for _, item in pairs( minetest.registered_items ) do
			local tmpis = ItemStack( item.name )
			local out, _ = minetest.get_craft_result( { method = 'fuel', width = 1, items = { tmpis } } )
			if inv:get_stack( 'fuel', 1 ):is_empty() and out.time ~= 0 then
				table.insert( wishlist, item.name )
			end
		end

		if not inv:is_empty( 'rec' ) then
			local list = inv:get_list( 'rec' )
			for _, item in ipairs( list ) do
				if item ~= nil and not item:is_empty() then
					table.insert( wishlist, item:get_name() )
				end
			end
		end
		return wishlist
	end
}

