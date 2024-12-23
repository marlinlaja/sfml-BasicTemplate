# Set variables
BUILD_DIR=build
EXECUTABLE=$(BUILD_DIR)/bin/main.exe
SOURCE_DIR=.

# The default target (if no argument is provided)
.PHONY: all
all: build

# Build the project
.PHONY: build
build:
	@echo "Configuring and building the project..."
	cmake -S $(SOURCE_DIR) -B $(BUILD_DIR) -G "MinGW Makefiles"
	cmake --build $(BUILD_DIR)

# Run the program
.PHONY: run
run:
	@echo "Running the program..."
	if exist $(EXECUTABLE) (
		$(EXECUTABLE)
	) else (
		echo Error: $(EXECUTABLE) not found. Build the project first!
	)

#clean up
.PHONY: clean
clean:
	@echo "Cleaning the build directory..."
	powershell -Command "Remove-Item -Recurse -Force build"
