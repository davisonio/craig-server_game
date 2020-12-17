--Check for debug.txt exists in world path

local debug_file = "/var/log/minetest/minetest-server.log"

local test_debug_path = function ()
    if io.open(debug_file, "r") ~= nil then
        local test_file = io.open(debug_file, "a")
        local msg = "[MOD] Debug: Confirmation, debug.txt found in "..minetest.get_worldpath()
        minetest.log([[[MOD] Debug: Checking configuration... If no confirmation follows this in debug.txt please set minetest to log to "debug.txt" in your world directory]])
        test_file:write(msg)
        test_file:close()
    else
        assert(false, [[[MOD] Debug: Please set minetest to log to "debug.txt" in the world folder by setting the "--logfile" flag to your worldpath directory.]])
    end
end

if minetest.settings:get("debug_archive") == "true" then
    if minetest.request_insecure_environment() ~= nil then
        local ie = minetest.request_insecure_environment()
        minetest.request_insecure_environment(
            minetest.register_on_shutdown(function ()
                local max_size = tonumber(minetest.settings:get("debug_max_size")) or 30000000
                local file = io.open(debug_file, "r")
                local file_size = file:seek("end", 0)
                minetest.log("Current debug.txt size: " ..file_size)
                if file_size >= max_size then
                    local tar = debug_file..".tar"
                    if io.open(tar, "r") ~= nil then
                        ie.os.execute("tar -cvf "..tar.." "..debug_file)
                    else
                        ie.os.execute("tar -rvf "..tar.." "..debug_file)
                    end
                    os.remove(debug_file)
                    local new_file = io.open(debug_file, "w")
                    new_file:close()
                    minetest.log("[Debug]: Archived debug.txt")
                end
            end)
        )
    else assert(false, '[Debug]: You must add "debug" to secure.trusted_mods in minetest.conf to use the archiving feature.')
    end
end

minetest.register_chatcommand("debug", {
    params = "<number_of_lines>",
    privs = {ban = true},
    description = "Returns last 100 lines of debug file",
    func = function(name, param)
        local num_lines = tonumber(param) or 100
        if num_lines > 0 then
            local i = 0
            for line in io.lines(debug_file) do
                i=i+1
            end
            local l = i-num_lines
            i = 0
            if l < 0 then l = 0 end
            local result_table = {}
            for line in io.lines(debug_file) do
                i=i+1
                if i > l then
                    table.insert(result_table, line)
                end
            end
            minetest.chat_send_player(name, "Debug (Last " ..num_lines .." lines):\n" ..table.concat(result_table, "\n"))
        end
    end
})

minetest.register_chatcommand("debug_grep", {
    params = "<search phrase>",
    privs = {ban = true},
    description = "Searches logfile for exact matches of each phrase and returns lines that contain it",
    func = function(name, param)
        local hits = {}
        local i,l = 0
        local searchterm = param
        for line in io.lines(debug_file) do
            if string.match(string.lower(line), string.lower(searchterm)) then
                table.insert(hits, line)
            end
        end
        if #hits > 0 then
           -- for i, line in ipairs(hits) do
             --   minetest.chat_send_player(name, line)
            --end
            local results = table.concat(hits, "\n")
            minetest.chat_send_player(name, results .. "\n Found ".. #hits.." results.")
        else
            minetest.chat_send_player(name, "No matches for " ..searchterm.." found")
        end
    end
})

minetest.register_chatcommand ("shutdown", {
	privs = {ban = true},
	params = "",
	descrition = "Shuts down server",
	func = function()
		minetest.request_shutdown("Server shutting down in 10 seconds", true, 10)
		minetest.log("[Debug] Shutdown requested")
	end
})
