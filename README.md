# Terraform Local Cloud Infrastructure

Infrastructure as Code project that provisions and manages a local cloud-style environment using Terraform and Docker.

## Overview

This project demonstrates how cloud infrastructure concepts can be implemented locally using Infrastructure as Code (IaC).

Instead of manually creating Docker resources, Terraform defines and manages the infrastructure declaratively.

The current implementation provisions:

- A Docker bridge network
- A reusable Terraform compute module
- An Nginx application container
- Terraform infrastructure outputs
- A reproducible local infrastructure workflow

## Architecture

```text
                         Terraform
                             |
                             v
                  +----------------------+
                  | Local Environment    |
                  | terraform/environments|
                  |       /local         |
                  +----------+-----------+
                             |
                  +----------+----------+
                  |                     |
                  v                     v
          Docker Network        Compute Module
       local-cloud-network             |
                                      v
                              Docker Image
                               nginx:alpine
                                      |
                                      v
                              Docker Container
                               local-cloud-app
                                      |
                                      v
                              localhost:8080
