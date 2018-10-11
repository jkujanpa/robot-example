# Robot Framework runner

One container setup for robot framework tests.

## How to run robot tests locally

1. Clone this repo
2. Use Docker to build containers
4. Run test and mount test and output folders
5. Check `./output` for the output files

Place your tests in `./robot-tests/`.
There can be subfolders

### Start containers

```sh
docker build -t <container-name:tag> .
docker run --rm  -v $(pwd)/robot-tests:/tmp/tests -v $(pwd)/output:/output <container-name:tag>
```