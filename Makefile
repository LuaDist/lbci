# makefile for bci library for Lua

# change these to reflect your Lua installation
LUA= /tmp/lhf/lua-5.1.4
LUAINC= $(LUA)/src
LUALIB= $(LUA)/src
LUABIN= $(LUA)/src
LUASRC= $(LUA)/src

# probably no need to change anything below here
CC= gcc
CFLAGS= $(INCS) $(WARN) -O2 $G
WARN= -ansi -pedantic -Wall
INCS= -I$(LUAINC) -I$(LUASRC)

MYNAME= bci
MYLIB= l$(MYNAME)
T= $(MYNAME).so
OBJS= $(MYLIB).o
TEST= test.lua

all:	test

test:	$T
	$(LUABIN)/lua $(TEST)

o:	$(MYLIB).o

so:	$T

$T:	$(OBJS)
	$(CC) -o $@ -shared $(OBJS)

clean:
	rm -f $(OBJS) $T core core.*

doc:
	@echo "$(MYNAME) library:"
	@fgrep '/**' $(MYLIB).c | cut -f2 -d/ | tr -d '*' | sort | column


# distribution

FTP= $(HOME)/public/ftp/lua/5.1
D= $(MYLIB)
A= $(MYLIB).tar.gz
TOTAR= Makefile,README,$(MYLIB).c,test.lua,print.lua

tar:	clean
	tar zcvf $A -C .. $D/{$(TOTAR)}

distr:	tar
	touch -r $A .stamp
	mv $A $(FTP)

diff:	clean
	tar zxf $(FTP)/$A
	diff $D .

# eof
