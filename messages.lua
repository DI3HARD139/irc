-- This file is licensed under the terms of the BSD 2-clause license.
-- See LICENSE.txt for details.

irc.msgs = irc.lib.msgs

function irc:sendLocal(message)
	minetest.chat_send_all(message)
end

function irc:playerMessage(name, message)
	return ("\0032<%s> %s"):format(name, message)
end

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
