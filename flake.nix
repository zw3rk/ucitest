{
  description = "A very basic test flake.";

  outputs = { self, nixpkgs }: rec {
    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;
    hydraJobs.hello."x86_64-linux" = packages.x86_64-linux.hello;
  };
}
