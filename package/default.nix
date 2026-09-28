{
  lib,
  buildDotnetModule,
  fetchFromGitHub,
  dotnetCorePackages,
}:

buildDotnetModule (finalAttrs: {
  pname = "tongji-hpc-registrar";
  version = "0.0.3";

  src = fetchFromGitHub {
    owner = "slp-tongji";
    repo = "TongjiHpcRegistrar";
    rev = "v${finalAttrs.version}";
    hash = "sha256-nb4SqK0d4g2o56cNPsfy4AqaYxm6CKQqbKRqwF+l/a0=";
  };

  projectFile = "src/TongjiHpcRegistrar/TongjiHpcRegistrar.csproj";
  dotnet-sdk = dotnetCorePackages.sdk_10_0;
  dotnet-runtime = dotnetCorePackages.aspnetcore_10_0;

  nugetDeps = ./deps.nix;

  strictDeps = true;
  __structuredAttrs = true;

  meta = {
    description = "An ASP.NET Core web application for registering and provisioning isolated HPC spaces over SSH.";
    homepage = "https://github.com/slp-tongji/TongjiHpcRegistrar";
    license = lib.licenses.mit;
    mainProgram = "TongjiHpcRegistrar";
    maintainers = [ ];
  };
})
