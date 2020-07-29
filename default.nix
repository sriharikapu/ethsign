{ stdenv, buildGoPackage, fetchFromGitHub, fetchgit, clang }:

buildGoPackage rec {
  name = "ethsign-${version}";
  version = "0.10";

  goPackagePath = "github.com/sriharikapu/ethsign";
  hardeningDisable = ["fortify"];
  src = ./.;

  extraSrcs = [
    {
      goPackagePath = "github.com/ethereum/go-ethereum";
      src = fetchFromGitHub {
        owner = "ethereum";
        repo = "go-ethereum";
        rev = "v1.8.1";
        sha256 = "0k7ly9cw68ranksa1fdn7v2lncmlqgabw3qiiyqya2xz3s4aazlf";
      };
    }
    {
      goPackagePath = "gopkg.in/urfave/cli.v1";
      src = fetchFromGitHub {
        owner = "urfave";
        repo = "cli";
        rev = "v1.19.1";
        sha256 = "1ny63c7bfwfrsp7vfkvb4i0xhq4v7yxqnwxa52y4xlfxs4r6v6fg";
      };
    }
    {
      goPackagePath = "golang.org/x/crypto";
      src = fetchgit {
        url = "https://go.googlesource.com/crypto";
        rev = "94eea52f7b742c7cbe0b03b22f0c4c8631ece122";
        sha256 = "095zyvjb0m2pz382500miqadhk7w3nis8z3j941z8cq4rdafijvi";
      };
    }
    {
      goPackagePath = "golang.org/x/sys";
      src = fetchgit {
        url = "https://go.googlesource.com/sys";
        rev = "53aa286056ef226755cd898109dbcdaba8ac0b81";
        sha256 = "1yd17ccklby099cpdcsgx6lf0lj968hsnppp16mwh9009ldf72r1";
      };
    }
  ];

  meta = with stdenv.lib; {
    homepage = http://github.com/sriharikapu/ethsign;
    description = "Package to create raw signed Ethereum transactions";
    license = [licenses.gpl3];
  };
}
