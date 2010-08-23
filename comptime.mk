#Add-on Makefile for wxDev-C++ project file
SRCDIR=src
ifdef ComSpec
COMSPEC=$(ComSpec)
RM=del.exe /f /q
endif

all-before:
	${RM} $(SRCDIR)/comptime.h
ifdef COMSPEC
	comptime.bat $(SRCDIR)
else
	./comptime.sh $(SRCDIR)
endif

clean-custom:
	${RM} $(SRCDIR)/comptime.h
