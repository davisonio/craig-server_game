transactor_transactions['rubber_collector:rubber_collector'] = {
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
}