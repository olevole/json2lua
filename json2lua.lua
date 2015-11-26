#!/usr/bin/env lua51
-- 1. Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- 2. Redistributions in binary form must reproduce the above copyright notice,
-- this list of conditions and the following disclaimer in the documentation and/or
-- other materials provided with the distribution.
-- Oleg Ginzburg < olevole at olevole dot ru >
-- 
local json = require "cjson"
local util = require "cjson.util"

-- local json_text = util.file_load(arg[1])
local json_text = io.read()
local t = json.decode(json_text)
local item = arg[1]
local depth_delimer="."

local depth=0

if item == nil then
	item="-"
end

function print_depth_prefix()

	if depth == 0 then return end

	for i=0,depth,1 do
		io.write("    ")
	end

end


function print_table( v, item, table_prefix )

	for k, v in pairs ( v ) do

		if depth > 0 then
			k = table_prefix .. k
		else
			new_prefix=table_prefix
		end

		if item == "-" then
			-- Show all records
			if ( type(v) == "table" ) then
				print_depth_prefix()
				depth = depth + 1

				print ( ">>" .. k )

				new_prefix = k .. depth_delimer
				print_table(v, item, new_prefix )
				depth = depth - 1
				print_depth_prefix()

				print ( "<<" .. k )
			else
				print_depth_prefix()
				print (k, v)
			end
		else
			-- Search for elements
			if ( type(v) == "table" ) then
				depth = depth + 1
				new_prefix = k .. depth_delimer
				print_table( v, item, new_prefix )
				depth = depth - 1
			elseif k == item or item == "-" then
				print ( v )
			end
		end
	end

end

print_table ( t, item, "" )
