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

transactor_transactions['default:chest'] = {
    get = function ( pos, wishlist )
        local inv = minetest.get_meta( pos ):get_inventory(), itst
        if wishlist ~= nil then
            for _, thing in ipairs( wishlist ) do
                itst = ItemStack( thing )
                if inv:contains_item( 'main', itst ) then
                    return inv:remove_item( 'main', itst )
                end
            end
            return false
        else
            ix = inv:get_size( 'main' ) - 1
            if not inv:is_empty( 'main' ) then
                itst = inv:get_stack( 'main', ix )
                while ix > 0 and ( itst == nil or itst:is_empty() ) do
                    ix = ix - 1
                    itst = inv:get_stack( 'main', ix )
                end
                if itst == nil or itst:is_empty() then
                    return false
                end
                itst = ItemStack( itst:get_name() )
                return inv:remove_item( 'main', itst )
            end
            return false
        end
    end,
    add = function ( pos, thing, addcb )
        if not thing then
            return false
        end
        local inv = minetest.get_meta( pos ):get_inventory()
        local leftover = inv:add_item( 'main', thing )
        if not leftover:is_empty() and addcb ~= nil then
            addcb( thing )
        end
    end
}

transactor_transactions['default:chest_locked'] = transactor_transactions['default:chest']
transactor_transactions['chests_0gb_us:shared'] = transactor_transactions['default:chest']
transactor_transactions['chests_0gb_us:dropbox'] = transactor_transactions['default:chest']