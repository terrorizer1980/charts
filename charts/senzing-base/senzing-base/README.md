# senzing-base

## Overview

A generic Senzing environment.

### Contents

1. [CHANGELOG](#changelog)
1. [References](#references)

## Prerequisites

## Installing the Chart

## Uninstalling the Chart

## Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `global.imageRegistry` | Global Docker image registry | `nil` |
| `global.imagePullSecrets` | Global Docker registry secret names as an array | `[]` (does not add image pull secrets to deployed pods) |
| `image.registry` | Redis Image registry | `docker.io` |
| `image.repository` | Redis Image name | `senzing/senzing-base` |
| `image.tag` | Redis Image tag | `{VERSION}` |
| `image.pullPolicy` | Image pull policy | `Always` |
| `image.pullSecrets` | Specify docker-registry secret names as an array | `nil` |


## CHANGELOG

### 0.2.0

1. Initial public version

### 0.1.0

1. Initial draft

## References

1. [DockerHub](https://hub.docker.com/r/senzing/senzing-base)
1. [GitHub](https://github.com/Senzing/docker-senzing-base)
