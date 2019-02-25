# Charts

## Overview

Charts used with [Kubernetes](https://kubernetes.io/).

Used by:

- [Helm](https://helm.sh/)
- [Rancher](https://rancher.com/)
  - [Catalog](https://rancher.com/docs/rancher/v2.x/en/catalog/)

### Contents

1. [Using Helm](#using-helm)
    1. [Add helm repository](#add-helm-repository)
    1. [List helm repositories](#list-helm-repositories)
    1. [View charts in Senzing Helm repository](#view-charts-in-senzing-helm-repository)
    1. [Remove helm repository](#remove-helm-repository)
1. [Using Rancher Catalog](#using-rancher-catalog)
    1. [Add catalog](#add-catalog)
    1. [Delete catalog](#delete-catalog)
1. [Development](#development)
    1. [Clone repository](#clone-repository)
    1. [Package Helm chart](#package-helm-chart)

## Using Helm

### Add helm repository

1. Example:

    ```console
    helm repo add senzing 'https://senzing.github.io/charts/'
    ```

### List helm repositories

1. Example:

    ```console
    helm repo list
    ```

### View charts in Senzing Helm repository

1. Example:

    ```console
    helm search senzing
    ```

### Remove helm repository

1. Example:

    ```console
    helm repo remove senzing
    ```

## Using Rancher Catalog

### Add catalog

1. Using Rancher Web interface.
   Reference: [Adding custom catalogs](https://rancher.com/docs/rancher/v2.x/en/catalog/#adding-custom-catalogs).
   Example:

    1. Choose Rancher > Top, Left-most dropdown box > Global
    1. Choose Rancher > Catalogs tab
    1. Click "Add Catalog" button.
    1. In "Add Catalog" dialog box:
        1. **Name:** senzing
        1. **Catalog URL:** [https://github.com/senzing/charts](https://github.com/senzing/charts)
        1. **Branch:** master
        1. **Kind:** Helm
    1. Click "Create" button

1. Using Rancher command line interface (CLI).  Example:

    ```console
    rancher catalog add \
      senzing \
      https://github.com/senzing/charts
    ```

### Delete catalog

1. Using Rancher Web interface. Example:

    1. Choose Rancher > Global tab
    1. Choose Rancher > Catalogs tab
    1. In "Custom" section, select "senzing" catalog.
    1. Click "Delete" button.

1. Using Rancher command line interface (CLI). Example:

    ```console
    rancher catalog delete \
      senzing
    ```

## Development

### Clone repository

1. Using these environment variable values:

    ```console
    export GIT_ACCOUNT=senzing
    export GIT_REPOSITORY=charts
    ```

   Follow steps in [clone-repository](https://github.com/Senzing/knowledge-base/blob/master/HOWTO/clone-repository.md).

### Package Helm chart

1. Identify directory.  Example:

    ```console
    export GIT_ACCOUNT_DIR=~/${GIT_ACCOUNT}.git
    export GIT_REPOSITORY_DIR="${GIT_ACCOUNT_DIR}/${GIT_REPOSITORY}"
    ```

1. Package helm chart. Example:

    ```console
    export CHART_NAME=senzing-hello-world

    cd ${GIT_REPOSITORY_DIR}/docs
    helm package ${GIT_REPOSITORY_DIR}/charts/${CHART_NAME}/${CHART_NAME}
    ```

1. Update `index.yaml`. Example:

    ```console
    cd ${GIT_REPOSITORY_DIR}/docs
    helm repo index .
    ```
