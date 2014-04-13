#These are the command-line targets that are specialized for the non-recursive
#make used with this build system.

.PHONY: all

all:

.PHONY: debug
debug: CXXFLAGS+= -DDEBUG -ggdb
debug: all

.PHONY: clean
clean: scratch=$(shell find ./* -name "*~")
clean:
	$(rm) $(BUILD_DIR)/* $(scratch)

.PHONY: realclean
realclean: clean
	$(rm) $(LIB_DIR)/* $(BIN_DIR)/*

deps=$(wildcard $(BUILD_DIR)/*.d)

ifneq ("$(deps)","")
-include $(deps)
endif

#generic rules for working on individual target files
%.o: %.c
	$(cc)

%.o: %.cpp
	$(cxx)

%: %.o
	$(ld)

%.a:
	$(ar)

#these are special rules to compile the tools used by this build system:
all: buildtools/bin/fixdeps
distclean: buildtools/bin/fixdeps
distclean: realclean

.PHONY: buildtools/bin/fixdeps
buildtools/bin/fixdeps:
	@$(MAKE) -s -f buildtools/buildtools.mk $(MAKECMDGOALS)
