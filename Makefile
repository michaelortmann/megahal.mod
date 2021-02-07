# Makefile for src/mod/megahal.mod/

srcdir = .


doofus:
	@echo ""
	@echo "Let's try this from the right directory..."
	@echo ""
	@cd ../../../ && make

static: ../megahal.o

modules: ../../../megahal.$(MOD_EXT)

../megahal.o:
	$(CC) $(CFLAGS) $(CPPFLAGS) -DMAKING_MODS -c $(srcdir)/megahal.c
	@rm -f ../megahal.o
	mv megahal.o ../

../../../megahal.$(MOD_EXT): ../megahal.o
	$(LD) -o ../../../megahal.$(MOD_EXT) ../megahal.o $(XLIBS)
	$(STRIP) ../../../megahal.$(MOD_EXT)

depend:
	$(CC) $(CFLAGS) $(CPPFLAGS) -MM $(srcdir)/megahal.c > .depend

clean:
	@rm -f .depend *.o *.$(MOD_EXT) *~
distclean: clean

#safety hash
megahal.o: .././megahal.mod/megahal.c .././megahal.mod/megahal.h \
 .././megahal.mod/../module.h ../../../src/main.h ../../../config.h \
 ../../../eggint.h ../../../lush.h ../../../src/lang.h \
 ../../../src/eggdrop.h ../../../src/compat/in6.h ../../../src/flags.h \
 ../../../src/cmdt.h ../../../src/tclegg.h ../../../src/tclhash.h \
 ../../../src/chan.h ../../../src/users.h ../../../src/compat/compat.h \
 ../../../src/compat/snprintf.h ../../../src/compat/strlcpy.h \
 .././megahal.mod/../modvals.h ../../../src/tandem.h \
 .././megahal.mod/../channels.mod/channels.h \
 .././megahal.mod/../irc.mod/irc.h \
 .././megahal.mod/../server.mod/server.h
