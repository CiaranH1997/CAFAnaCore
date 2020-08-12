# Simple wrapper for those of us who don't like having to cd to build, and
# never remember that it's make *install*

all:
	if [ ! -e build ]; then mkdir -p build; cd build; cmake ..; fi
	make -C build -j install

clean:
	make -C build -j clean
