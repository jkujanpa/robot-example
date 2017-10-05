# Robot Framework runner

Easy setup for test development.
Docker compose builds and runs conteinars for Selenium and Robot framework.
By running them with Docker compose it automatically sets them up in the same network.
Robot framework container `runner` runs idle prosess and is therefore ready to run tests when needed.
Test and output folders are mapped to runner container so any chage to test on local machine can be run immidiedly.
And results can be viewed on local machine.

## How to run robot tests locally

1. Clone this repo
2. Use Docker compose to set containers
4. Run test as explained below
5. Check `./output` for the output files

Place your tests in `./robot-tests/`.
There can be subfolders

### Start containers
Setup test runner containers defined in `docker-compose.yml`
```sh
docker-compose up -d --build
```
Note: option `-d` deteaches containers and leaves them running.

Check the names of currently running containers
```sh
docker ps
```
### Run tests
```sh
docker exec <robot_runner_container>  run.sh
```
Note: name of the container depends on your base directory.

Defalt:
```sh
docker exec robotexample_robot-runner_1 run.sh
```

Test can also be run with rfw options, to to list options run help.
Options include change of log level (default INFO) or exclude tags.
Run tests
```sh
docker exec <robot_runner_container>  run.sh '-h'
```


### Destroy containers
```sh
docker-compose down
```


#### Installing dependencies

All pip (Python) dependencies are defined in `requirements.txt`,
as defined here: https://pip.pypa.io/en/stable/user_guide/#requirements-files

