{
  inputs = {
    helix.url = "github:semin-park/helix/jump-rebase"
  };
  
  outputs = { self, helix, ... }: {

    packages.x86_64-linux.helix = helix;
  };
}
