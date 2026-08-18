# Terraform Local Cloud Infrastructure

![Terraform CI](https://github.com/kavana-06/terraform-local-cloud-infrastructure/actions/workflows/terraform-ci.yml/badge.svg)

Infrastructure as Code project that provisions and manages a local cloud-style environment using Terraform, Docker, and GitHub Actions.

## Overview

This project demonstrates how cloud infrastructure and DevOps practices can be implemented locally without using a paid cloud account.

Terraform declaratively provisions and manages Docker-based infrastructure, while GitHub Actions provides automated CI validation and CD deployment through a self-hosted runner.

The environment includes:

- Docker bridge networking
- Secure internal Docker network
- Nginx application container
- PostgreSQL database container
- Terraform modules
- Terraform outputs
- Terraform CI validation
- Terraform CD deployment
- Self-hosted GitHub Actions runner
- Automated application verification

## Architecture

```text
                         GitHub Repository
                                |
                                v
                     +----------------------+
                     |   GitHub Actions     |
                     |                      |
                     | Terraform CI        |
                     | Format / Validate    |
                     | Plan                 |
                     +----------+-----------+
                                |
                                v
                     +----------------------+
                     | Self-Hosted Runner   |
                     |       Linux          |
                     +----------+-----------+
                                |
                                v
                         +-------------+
                         |  Terraform  |
                         +------+------+
                                |
                                v
                         +-------------+
                         |    Docker   |
                         +------+------+
                                |
              +-----------------+-----------------+
              |                                   |
              v                                   v
     +-------------------+              +-------------------+
     | Nginx Application |              |    PostgreSQL     |
     | local-cloud-app   |              |  local-postgres   |
     |     :8080         |              |      :5432        |
     +---------+---------+              +---------+---------+
              |                                   |
              +---------------+-------------------+
                              |
                              v
                     Docker Networks
```

## Project Structure

```text
terraform-local-cloud-infrastructure/
│
├── .github/
│   └── workflows/
│       ├── terraform-ci.yml
│       └── terraform-cd.yml
│
├── docs/
│   ├── terraform-ci.png
│   ├── terraform-cd.png
│   ├── docker-containers.png
│   └── application.png
│
├── scripts/
│   └── deploy.sh
│
├── terraform/
│   ├── environments/
│   │   └── local/
│   │       ├── main.tf
│   │       ├── variables.tf
│   │       └── outputs.tf
│   │
│   └── modules/
│       ├── compute/
│       ├── database/
│       └── security/
│
├── .gitignore
└── README.md
```

## Technologies

| Technology | Purpose |
|---|---|
| Terraform | Infrastructure as Code |
| Docker | Containerization |
| PostgreSQL | Database |
| Nginx | Web application |
| GitHub Actions | CI/CD automation |
| Linux | Self-hosted runner |
| Bash | Deployment automation |
| Git/GitHub | Version control |

## Terraform Modules

### Compute

Manages the Nginx application container and Docker image.

### Database

Manages the PostgreSQL database container and Docker image.

### Security

Manages the internal Docker network used for infrastructure isolation.

## CI Pipeline

Terraform CI runs automatically when changes are pushed to GitHub.

The pipeline performs:

1. Terraform formatting check
2. Terraform initialization
3. Terraform validation
4. Terraform plan

## CD Pipeline

Terraform CD runs through a self-hosted GitHub Actions runner.

The deployment process:

1. Checks out the repository
2. Initializes Terraform
3. Creates a Terraform plan
4. Applies the Terraform plan
5. Starts the Docker containers
6. Verifies the application using `curl`

## Deployment

Go to the local Terraform environment:

```bash
cd terraform/environments/local
```

Initialize Terraform:

```bash
terraform init
```

Create a plan:

```bash
terraform plan
```

Apply the infrastructure:

```bash
terraform apply
```

The deployment script can also be used:

```bash
./scripts/deploy.sh
```

## Self-Hosted Runner

The GitHub Actions self-hosted runner runs on the local Linux/WSL environment.

Start the runner with:

```bash
cd ~/actions-runner
./run.sh
```

The runner connects to GitHub and waits for deployment jobs.

## Verification

Check running containers:

```bash
docker ps
```

Expected containers:

```text
local-cloud-app
local-postgres
```

Verify the application:

```bash
curl http://localhost:8080
```

A successful Nginx response confirms that the application is running.

## Infrastructure Outputs

Terraform provides outputs including:

```text
application_container_name
application_url
network_name
```

Application:

```text
http://localhost:8080
```

PostgreSQL:

```text
localhost:5432
```

## CI/CD Evidence

### Terraform CI

The Terraform CI workflow validates the infrastructure configuration.

![Terraform CI](docs/terraform-ci.png)

### Terraform CD

The Terraform CD workflow deploys the infrastructure using the self-hosted runner.

![Terraform CD](docs/terraform-cd.png)

### Docker Containers

The Nginx application and PostgreSQL database containers are running successfully.

![Docker Containers](docs/docker-containers.png)

### Application Verification

The Nginx application is accessible through port 8080.

![Application](docs/application.png)

## Key DevOps Concepts Demonstrated

- Infrastructure as Code
- Declarative infrastructure management
- Terraform modules
- Docker containerization
- Docker networking
- CI/CD automation
- Self-hosted GitHub Actions runners
- Terraform state management
- Secrets management
- Automated deployment
- Application health verification

## Project Workflow

```text
Developer
    |
    v
GitHub Repository
    |
    v
Terraform CI
    |
    +--> Format
    |
    +--> Validate
    |
    +--> Plan
    |
    v
Self-Hosted Runner
    |
    v
Terraform CD
    |
    v
Docker
    |
    +-------------------+
    |                   |
    v                   v
 Nginx              PostgreSQL
 :8080                 :5432
    |
    v
Application Verification
```

## Project Outcome

This project demonstrates a complete local Infrastructure-as-Code and CI/CD workflow using Terraform, Docker, Linux, and GitHub Actions without requiring a paid cloud account.
