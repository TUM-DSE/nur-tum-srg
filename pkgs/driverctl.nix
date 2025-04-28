{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
    name = "driverctl";

	  src = pkgs.fetchgit {
			url = "https://gitlab.com/driverctl/driverctl.git";
	    rev = "3a97f2d0902c8c8d3b059cc33edf275e9fc98aee";
			hash = "sha256-H8aahtsmPwlqxqfgvrvaKQznOnnvmfQ370y+yeleNeU=";
		};

	  installPhase = ''
	    mkdir -p $out/bin
			cp driverctl $out/bin/driverctl
			sed -i 's/\/sbin\/modprobe/modprobe/g' $out/bin/driverctl
	  '';

	  meta = with pkgs.lib; {
	    description = "Linux device driver control utility.";
	    homepage = "https://gitlab.com/driverctl/driverctl.git";
	  };
}
