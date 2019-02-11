# rancher-catalog

[Catalog and charts](https://rancher.com/docs/rancher/v2.x/en/catalog/) for use with
[Rancher](https://rancher.com/) and
[Kubernetes](https://kubernetes.io/).

## Using Catalog

### Add catalog

1. Using Rancher Web interface.
   Reference: [Adding custom catalogs](https://rancher.com/docs/rancher/v2.x/en/catalog/#adding-custom-catalogs).
   Example:

    1. Choose Rancher > Top, Left-most dropdown box > Global
    1. Choose Rancher > Catalogs tab
    1. Click "Add Catalog" button.
    1. In "Add Catalog" dialog box:
        1. **Name:** senzing
        1. **Catalog URL:** [https://github.com/senzing/rancher-catalog](https://github.com/senzing/rancher-catalog)
        1. **Branch:** master
        1. **Kind:** Helm
    1. Click "Create" button

1. Using Rancher command line interface (CLI).  Example:

    ```console
    rancher catalog add \
      senzing \
      https://github.com/senzing/rancher-catalog
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

### Set environment variables for repository

1. These variables may be modified, but do not need to be modified.
   The variables are used throughout the installation procedure.

    ```console
    export GIT_ACCOUNT=senzing
    export GIT_REPOSITORY=rancher-catalog
    ```

1. Synthesize environment variables.

    ```console
    export GIT_ACCOUNT_DIR=~/${GIT_ACCOUNT}.git
    export GIT_REPOSITORY_DIR="${GIT_ACCOUNT_DIR}/${GIT_REPOSITORY}"
    export GIT_REPOSITORY_URL="git@github.com:${GIT_ACCOUNT}/${GIT_REPOSITORY}.git"
    ```

### Clone repository

1. Get repository.

    ```console
    mkdir --parents ${GIT_ACCOUNT_DIR}
    cd  ${GIT_ACCOUNT_DIR}
    git clone ${GIT_REPOSITORY_URL}
    ```