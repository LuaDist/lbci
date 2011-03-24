# Copyright (C) 2007-2011 LuaDist.
# Created by Peter Kapec
# Redistribution and use of this file is allowed according to the terms of the MIT license.
# For details see the COPYRIGHT file distributed with LuaDist.
# Please note that the package source code is licensed under its own license.

project ( lbci C )
cmake_minimum_required ( VERSION 2.6 )
include ( dist.cmake )

include_directories ( lua51 )

install_lua_module ( bci lbci.c bci.def )
install_data ( README COPYRIGHT-LUA )
install_test ( test.lua )
install_test ( print.lua )

add_lua_test ( test.lua )
# add_lua_test ( print.lua )  # FIX? assumes print.lua in current directory

