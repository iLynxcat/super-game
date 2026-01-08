.PHONY: all raylib clean

all: raylib

raylib:
	@echo "Building raylib..."
	cd Submodules/raylib/src && $(MAKE) PLATFORM=PLATFORM_DESKTOP

clean:
	@echo "Cleaning raylib..."
	cd Submodules/raylib/src && $(MAKE) clean
	@echo "Cleaning Swift build..."
	swift package clean

run: all
	swift run
