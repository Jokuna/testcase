CC =g++
CFLAGS = -O2 -Wall --std=c++17

TARGET = Main.out
PROBLEM = 1# Default
PLATFORM = beakjoon# Default
# SRC
PY_TARGET = Main.py

#
OUT_DIR = ./out
.PHONY: clean test

all: $(TARGET)
	
build:
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET)

py-build:
	cp $(SRC) $(PY_TARGET)
	python3 -c "import py_compile; py_compile.compile(r'$(PY_TARGET)')"

run:
	make build
	./$(TARGET)

cpp:
	@make -s clean
	@make -s build

	@echo "\nPlatform:\033[0;35m" $(PLATFORM) "\033[0m Problem: \033[0;35m" $(PROBLEM) "\033[0m\n"
	@$(foreach file, $(wildcard $(PLATFORM)/$(PROBLEM)/**.in), \
		./$(TARGET) < $(file) > $(OUT_DIR)/$(notdir $(basename $(file))); \
		echo "TestCase: " $(notdir $(basename $(file))) ""; \
		diff $(OUT_DIR)/$(notdir $(basename $(file))) $(PLATFORM)/$(PROBLEM)/$(notdir $(basename $(file))).out  | grep . && echo "\033[0;31mFail\033[0m" || echo "\033[0;32mPass\033[0m"; \
	)
	@make -s clean

python:
	@make -s clean
	@make -s py-build

	@echo "\nPlatform:\033[0;35m" $(PLATFORM) "\033[0m Problem: \033[0;35m" $(PROBLEM) "\033[0m\n"
	@$(foreach file, $(wildcard $(PLATFORM)/$(PROBLEM)/**.in), \
		python3 $(PY_TARGET) < $(file) > $(OUT_DIR)/$(notdir $(basename $(file))); \
		echo "TestCase: " $(notdir $(basename $(file))) ""; \
		diff $(OUT_DIR)/$(notdir $(basename $(file))) $(PLATFORM)/$(PROBLEM)/$(notdir $(basename $(file))).out  | grep . && echo "\033[0;31mFail\033[0m" || echo "\033[0;32mPass\033[0m"; \
	)
	@make -s clean

clean:
	@rm -rf $(TARGET) $(OUT_DIR)/* __pycache__ $(PY_TARGET)
