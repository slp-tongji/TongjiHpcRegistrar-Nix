{
  lib,
  buildDotnetModule,
  fetchFromGitHub,
  dotnetCorePackages,
}:

buildDotnetModule (finalAttrs: {
  pname = "tongji-hpc-registrar";
  version = "0.0.7";

  src = fetchFromGitHub {
    owner = "slp-tongji";
    repo = "TongjiHpcRegistrar";
    rev = "v${finalAttrs.version}";
    hash = "sha256-yl3nK0ZSJ9xL0u/MkZNElXYB3FkYUiBeCv36gBIbpzk=";
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
