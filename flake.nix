{
  description = "A very basic test flake.";

  # these are our outputs, based on some ominous nixpkgs?
  outputs = { self, nixpkgs }: rec {
    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
    packages.x86_64-darwin.hello = nixpkgs.legacyPackages.x86_64-darwin.hello;
    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;
    hydraJobs.hello."x86_64-linux" = packages.x86_64-linux.hello;
    hydraJobs.hello."x86_64-darwin" = packages.x86_64-darwin.hello;    
  };
}
