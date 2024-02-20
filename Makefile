# Define tools and flags
CC := afl-clang-lto
CXX := afl-clang-lto++
RANLIB := llvm-ranlib-16
AR := llvm-ar-16
AS := llvm-as-16

# Library and source paths
LIBDIRS := source
BUILDLIBDIR := lib

CFLAGS := -I$(LIBDIRS) -Iinclude
LDFLAGS := -L$(BUILDLIBDIR) -lgbajpeg

SRCS := main.c
OBJS := $(SRCS:.c=.o)

.PHONY: all clean

all: harness-afl harness-san harness-laf harness-cmp

# General rule for making objects, to be reused for each specific target
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# AFL build
harness-afl: $(OBJS) $(BUILDLIBDIR)/libgbajpeg.a
	$(CC) $^ -o $@ $(LDFLAGS)

# Sanitizer build
harness-san: $(OBJS) $(BUILDLIBDIR)/libgbajpeg.a
	AFL_USE_ASAN=1 AFL_USE_UBSAN=1 AFL_USE_CFISAN=1 $(CC) $^ -o $@ $(LDFLAGS)

# LAF-Intel build
harness-laf: $(OBJS) $(BUILDLIBDIR)/libgbajpeg.a
	AFL_LLVM_LAF_ALL=1 $(CC) $^ -o $@ $(LDFLAGS)

# CmpLog build
harness-cmp: $(OBJS) $(BUILDLIBDIR)/libgbajpeg.a
	AFL_LLVM_CMPLOG=1 $(CC) $^ -o $@ $(LDFLAGS)


# Compile the JPEG library
$(BUILDLIBDIR)/libgbajpeg.a: $(LIBDIRS)/gba-jpeg-decode.c
	mkdir -p $(BUILDLIBDIR)
	$(CC) $(CFLAGS) -c $< -o $(@:.a=.o)
	$(AR) rcs $@ $(@:.a=.o)

clean:
	rm -f $(OBJS) harness-afl harness-san harness-laf harness-cmplog $(BUILDLIBDIR)/libgbajpeg.a $(BUILDLIBDIR)/*.o
