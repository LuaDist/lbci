# Copyright (C) 2007-2009 LuaDist.
# Created by Peter Kapec
# Redistribution and use of this file is allowed according to the terms of the MIT license.
# For details see the COPYRIGHT file distributed with LuaDist.
# Please note that the package source code is licensed under its own license.

PROJECT(lbci C)
CMAKE_MINIMUM_REQUIRED(VERSION 2.6)
INCLUDE(dist.cmake)

INCLUDE_DIRECTORIES(lua51)

ADD_LUA_MODULE(bci lbci.c bci.def)
ADD_LUA_TEST(test.lua)

INSTALL (TARGETS bci DESTINATION ${INSTALL_CMOD})
INSTALL (FILES README COPYRIGHT-LUA DESTINATION ${INSTALL_DATA})
INSTALL (FILES test.lua print.lua DESTINATION ${INSTALL_TEST})
