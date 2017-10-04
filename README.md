# Robot Framework runner

## How to run robot tests locally

1. Clone this repo
2. Use Docker compose to set containers
4. Run test as explained below
5. Check `./output` for the output files

Place your tests in `./robot-tests/`.
There can be subfolders

Setup test runner containers defined in `docker-compose.yml`
```sh
docker-compose up -d --build
```
Note: option `-d` deteaches containers and leaves them running.

Run tests
```sh
docker exec <robot_runner_container>  run.sh
```
Note: name of the container depends on your base directory.

## Destroy containers
```sh
docker-compose down
```


#### Installing dependencies

All pip (Python) dependencies are defined in `requirements.txt`,
as defined here: https://pip.pypa.io/en/stable/user_guide/#requirements-files

