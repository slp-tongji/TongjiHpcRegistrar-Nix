# TongjiHpcRegistrar-Nix

Nix packaging for [TongjiHpcRegistrar](https://github.com/slp-tongji/TongjiHpcRegistrar) — an ASP.NET Core web application for registering and provisioning isolated HPC spaces over SSH.

## Adding as a flake input

```nix
{
  inputs = {
    tongji-hpc-registrar.url = "github:slp-tongji/TongjiHpcRegistrar-Nix";
  };
}
```

## Package

The binary is exposed as `TongjiHpcRegistrar`:

```nix
tongji-hpc-registrar.packages.${system}.tongji-hpc-registrar
```

Or try it directly from the CLI:

```console
$ nix shell github:slp-tongji/TongjiHpcRegistrar-Nix
$ TongjiHpcRegistrar \
    --listen http://0.0.0.0:8080 \
    --oidc https://dex.example.com \
    --oidc-id my-client \
    --oidc-secret $OIDC_SECRET \
    --hpc-host hpc.example.com \
    --hpc-port 22 \
    --hpc-user provisioner \
    --hpc-key /path/to/key \
    --hpc-host-key <sha256-fingerprint>
```

---

All documentation and `description` fields in this repository are AI-generated.
