# File: tests/docker.bats

@test "Docker Compose starts up without errors" {
    run docker-compose -f docker-compose.yaml up -d
    [ "$status" -eq 0 ]
}

@test "Custom start script runs successfully" {
    run bash scripts/start.sh
    [ "$status" -eq 0 ]
}

@test "Executable runs without errors" {
    run ./$(EXEC)
    [ "$status" -eq 0 ]
}

@test "Docker Compose stops without errors" {
    run docker-compose -f docker-compose.yaml down
    [ "$status" -eq 0 ]
}

@test "Custom kill script runs successfully" {
    run bash scripts/kill.sh
    [ "$status" -eq 0 ]
}
