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

- You can test the entire build and deploy workflow by simply raising a PR to change text in `app.py`. This triggers a GitHub Actions CI workflow that builds the `password-generator` app and pushes the image to DockerHub.
- Once the PR is merged, the image tag is updated in the `fluxcd-dev` repo, which prompts FluxCD to roll out the changes to the Pods in the Kubernetes clusters managed by the repo.

### Running in local

```bash
docker run -p 8080:5000 password-generator:latest
```

You should now see the FlaskAPI server up and running!

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

## CI/CD with Github Actions

- The workflow flow using is defined in `.github/workflows/ci.yml`.
- The build job is triggered on every push or pull request to the `main` branch to checkout the code, build and push the image to `Dockerhub` registry
- The deploy job is triggered on every push to the `main` branch to update the newly built image tag in the `Helm` values of the `FluxCD` repository


## Pre-commit Hooks

- To ensure code standards and quality, pre-commit hook checks are automatically enforced before code is committed to the repository.
- The configuration for pre-commit can be found in `.pre-commit-config.yaml`
