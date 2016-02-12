NAME = etc1tool
SOURCES = etc1tool.cpp
SOURCES := $(foreach source, $(SOURCES), tools/etc1tool/$(source))
CXXFLAGS += -fPIC
CPPFLAGS += -Iinclude -include android/arch/AndroidConfig.h
LDFLAGS += -Wl,-rpath=/usr/lib/android -lpng -L/usr/lib/android -lETC1

$(NAME): $(SOURCES)
	$(CXX) $^ -o $@ $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)
	dpkg-gensymbols -pandroid-libetc1 -v0 -elibETC1.so.0 -Odebian/android-libetc1.symbols

clean:
	$(RM) $(NAME)