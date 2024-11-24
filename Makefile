# Variables
CC = gcc
CFLAGS = -Wall -Werror
EXEC = espdac
SRC = main.c
DOCKER_COMPOSE = docker-compose.yaml

# Targets
.PHONY: all build run start stop clean

# Default target
all: build

# Compile the main.c file
build: $(SRC)
	$(CC) $(CFLAGS) -o $(EXEC) $(SRC)

# Start the Docker container and run the executable
run: start
	./$(EXEC)

# Start the database using Docker Compose and your start script
start:
	docker-compose -f $(DOCKER_COMPOSE) up -d
	bash scripts/start.sh

# Stop the database and clean up
stop:
	bash scripts/kill.sh
	docker-compose -f $(DOCKER_COMPOSE) down

# Clean the compiled executable
clean:
	rm -f $(EXEC)
# Add these lines to your Makefile
TEST_EXEC = test_main
TEST_SRC = tests/test_main.c

.PHONY: test
# Add these lines to your Makefile
.PHONY: docker-test

docker-test:
 bats tests/docker.bats
# Build and run tests
test: $(SRC) $(TEST_SRC)
 $(CC) $(CFLAGS) -o $(TEST_EXEC) $(SRC) $(TEST_SRC) -lcheck
 ./$(TEST_EXEC)
 rm -f $(TEST_EXEC)
