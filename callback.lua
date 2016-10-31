-- This file is licensed under the terms of the BSD 2-clause license.
-- See LICENSE.txt for details.
-- Colors --
-- \0000 White
-- \0001 Black
-- \0002 Navy
-- \0003 Green
-- \0004 Red
-- \0005 Maroon
-- \0006 Purple
-- \0007 Olive
-- \0008 Yellow
-- \0009 Light Green
-- \0010 Teal
-- \0011 Cyan
-- \0012 Royal Blue
-- \0013 Magenta
-- \0014 Gray
-- \0015 Light Gray


minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	if irc.connected and irc.config.send_join_part then
		irc:say("\0033*** "..name.." joined the game")
	end
end)


minetest.register_on_leaveplayer(function(player)
	local name = player:get_player_name()
	if irc.connected and irc.config.send_join_part then
		irc:say("\0033*** "..name.." left the game")
	end
end)


minetest.register_on_chat_message(function(name, message)
	if not irc.connected
	   or message:sub(1, 1) == "/"
	   or message:sub(1, 5) == "[off]"
	   or not irc.joined_players[name]
	   or (not minetest.check_player_privs(name, {shout=true})) then
		return
	end
	local nl = message:find("\n", 1, true)
	if nl then
		message = message:sub(1, nl - 1)
	end
	irc:say(irc:playerMessage(name, message))
end)


minetest.register_on_shutdown(function()
	irc:disconnect("\0034Game shutting down.")
end)

