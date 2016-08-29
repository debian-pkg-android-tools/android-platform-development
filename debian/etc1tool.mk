NAME = etc1tool
SOURCES = etc1tool.cpp
SOURCES := $(foreach source, $(SOURCES), tools/etc1tool/$(source))
CPPFLAGS += -Iinclude -I/usr/include/android
LDFLAGS += -Wl,-rpath=/usr/lib/android -lpng -L/usr/lib/android -lETC1

$(NAME): $(SOURCES)
	$(CXX) $^ -o $@ $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)

clean:
	$(RM) $(NAME)