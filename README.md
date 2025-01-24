# silverred

[![silverred build badge](https://github.com/tecncr/silverred/actions/workflows/build.yml/badge.svg)](https://github.com/tecncr/silverred/actions/workflows/build.yml)

A custom Fedora Silverblue bootable OCI image made with BlueBuild

## Rebasing to silverred

To rebase an existing atomic Fedora installation to the latest build:

### Rebasing to the unsigned image, to get the proper signing keys and policies installed:

  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/tecncr/silverred:latest
  ```

### Reboot to complete the rebase

  ```
  systemctl reboot
  ```

### Then rebase to the signed image, like so:

  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/tecncr/silverred:latest
  ```

### Reboot again to complete the rebase

  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in the files located at the `recipes` directory.


## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/tecncr/silverred
```