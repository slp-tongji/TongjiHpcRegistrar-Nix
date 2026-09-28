# HpcRegistrar-Nix

Nix packaging for [HpcRegistrar](https://github.com/slp-tongji/HpcRegistrar) — an ASP.NET Core web application for registering and provisioning isolated HPC spaces over SSH.

## Adding as a flake input

```nix
{
  inputs = {
    hpc-registrar.url = "github:slp-tongji/HpcRegistrar-Nix";
  };
}
```

## Package

The binary is exposed as `HpcRegistrar`:

```nix
hpc-registrar.packages.${system}.hpc-registrar
```

Or try it directly from the CLI:

```console
$ nix shell github:slp-tongji/HpcRegistrar-Nix
$ HpcRegistrar \
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
