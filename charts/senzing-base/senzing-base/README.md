# senzing-base

## Overview

This chart bootstraps a [generic Senzing environment](https://github.com/Senzing/docker-senzing-base) deployment on a
[Kubernetes](http://kubernetes.io) cluster using the
[Helm](https://helm.sh) package manager.

### Contents

1. [Prerequisites](#prerequisites)
1. [Installing the Chart](#installing-the-chart)
1. [Uninstalling the Chart](#uninstalling-the-chart)
1. [Configuration](#configuration)
1. [CHANGELOG](#changelog)
1. [References](#references)

## Prerequisites

1. Install Senzing helm charts. Example:

    ```console
    helm repo add senzing 'https://senzing.github.io/charts/'
    ```

1. Specify a URL for the database storing Senzing data. (`SENZING_DATABASE_URL`).

    Components of the URL:

    ```console
    export DATABASE_PROTOCOL=<postgresql, mysql, or db2>
    export DATABASE_USERNAME=<my-username>
    export DATABASE_PASSWORD=<my-password>
    export DATABASE_HOST=<hostname>
    export DATABASE_PORT=<database-connnection-port>
    export DATABASE_DATABASE=<database-name>
    ```

    Example:

    ```console
    export DATABASE_PROTOCOL=postgresql
    export DATABASE_USERNAME=johnsmith
    export DATABASE_PASSWORD=secret
    export DATABASE_HOST=my.database.com
    export DATABASE_PORT=5432
    export DATABASE_DATABASE=G2

    export SENZING_DATABASE_URL="${DATABASE_PROTOCOL}://${DATABASE_USERNAME}:${DATABASE_PASSWORD}@${DATABASE_HOST}:${DATABASE_PORT}/${DATABASE_DATABASE}"

    echo ${SENZING_DATABASE_URL}
    ```

## Installing the Chart

1. Install into default namespace. Example:

    ```console
    helm install \
      --name my-senzing-base \
      --set senzing.databaseUrl=${SENZING_DATABASE_URL} \
      senzing/senzing-base
    ```

## Uninstalling the Chart

1. Uninstall/delete the deployment. Example:

    ```console
    helm delete my-senzing-base
    ```

## Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `image.repository` | Image name | `senzing/senzing-base` |
| `image.tag` | Image tag | `latest` |
| `image.pullPolicy` | Image pull policy | `IfNotPresent` |
| `senzing.databaseURL` | Value of `${SENZING_DATABASE_URL}`. | `nil`, which uses the internal SQLite database. |
| `senzing.debug` | Turn debugging on (`1`) or off (`0`) | `0`, which is off. |
| `senzing.entrypointSleep` | Sleep, in seconds. `0` is infinity, `nil` is don't sleep | `nil`, don't sleep. |

1. Specify each parameter using the `--set key=value[,key=value]` argument to `helm install` or use multiple `--set` arguments. Example:

    ```console
    helm install \
      --name my-senzing-base \
      --set senzing.databaseURL="postgresql://johnsmith:secret@my.database.com:5432/G2" \
      --set senzing.debug=true \
      senzing/senzing-base
    ```

1. Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart.

    `my-additional-values.yaml` YAML file example contents:

    ```yaml
    senzing:
      databaseURL: "postgresql://johnsmith:secret@my.database.com:5432/G2"
      debug: true
    ```

    Example:

    ```console
    helm install \
      --name my-senzing-base \
      --values my-additional-values.yaml \
      senzing/senzing-base
    ```

## CHANGELOG

### 0.2.0

1. Initial public version

### 0.1.0

1. Initial draft

## References

1. [DockerHub](https://hub.docker.com/r/senzing/senzing-base)
1. [GitHub](https://github.com/Senzing/docker-senzing-base)
