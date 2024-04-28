# password-generator
REST API application written in Python using Flask

## Prerequisites
- Docker
- pre-commit

## Usage

### Build

1. Clone this repo
2. Run the command below to build the image locally
```bash
docker build -t password-generator:latest .
 ```

### Running in local

```bash
docker run -p 8080:5000 password-generator:latest
```

You should now see the FlaskAPI server up and running.

To test the API endpoint run the below curl

```
curl --location 'http://localhost:8080/generate-passwords' \
--header 'Content-Type: application/json' \
--data '{
    "min_length": "10",
    "special_chars": "5",
    "numbers": "3",
    "num_passwords": "1"
}'
```

## Pre-commit Hooks

### Overview

### Setting Up Pre-commit Hooks
To utilize the pre-commit hooks in your local development environment, follow these steps:

1. **Install Pre-commit**:
   First, ensure that you have the `pre-commit` tool installed. If not, you can install it using pip:

   ```bash
   pip install pre-commit
   ```
2.

## CI/CD with Github Actions

- The workflow flow using is defined in `.github/workflows/ci.yml`.
- The build job is triggered on every push or pull request to the `main` branch to checkout the code, build and push the image to `Dockerhub` registry
- The deploy job is triggered on every push to the `main` branch to update the newly built image tag in the `Helm` values of the `FluxCD` repository
