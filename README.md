# IFT209 Container

Container specially designed for the UdeS ift209 class. Use this [dev container](https://github.com/DehCrep/ift209-dev-container), for an ideal experience.

## Prerequisites
- Docker engine running on an x86 machine.

## Usage

- To run the latest stable version, use this command :
    ```bash
    docker --name armdevenv run ghcr.io/dehcrep/armdevenv:latest
    ```

    - To run the dev version, use this command :
    ```bash
    docker --name armdevenv run ghcr.io/dehcrep/armdevenv:dev
    ```

Connect to the container using this command :
```bash
docker exec -it armdevenv /bin/bash
```