{
  lib,
  buildDotnetModule,
  fetchFromGitHub,
  dotnetCorePackages,
}:

buildDotnetModule (finalAttrs: {
  pname = "hpc-registrar";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "slp-tongji";
    repo = "HpcRegistrar";
    rev = "v${finalAttrs.version}";
    hash = "sha256-LqNhB7vrbb77M3VSUlDvVU0CGmxxKgipSBU9KWNN6pg=";
  };

  projectFile = "src/HpcRegistrar/HpcRegistrar.csproj";
  dotnet-sdk = dotnetCorePackages.sdk_10_0;
  dotnet-runtime = dotnetCorePackages.aspnetcore_10_0;

  nugetDeps = ./deps.nix;

  strictDeps = true;
  __structuredAttrs = true;

  meta = {
    description = "An ASP.NET Core web application for registering and provisioning isolated HPC spaces over SSH.";
    homepage = "https://github.com/slp-tongji/HpcRegistrar";
    license = lib.licenses.mit;
    mainProgram = "HpcRegistrar";
    maintainers = [ ];
  };
})
