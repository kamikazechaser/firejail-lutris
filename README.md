## firejail-lutris
> Hardened Firejail profile for Lutris

This profile significantly lowers the attack surface of untrusted Windows programs run via [Lutris](https://lutris.net/) while attempting to maintain core functionality. By default, the native (Non-Flatpak) version of Lutris runs with a high level of trust: it possesses full root RW access, unrestricted network access, and the ability to execute any syscalls (Windows executables run with Wine/Proton are able to execute Linux syscalls).

Tested against the latest Lutris: `v0.5.22 using the default UMU launcher`.

* Note: There is no performance loss when using Firejail.

### What it does:

* Disables network access completely. Socket creation is allowed for the required UMU launcher update check (which will eventually fail).
* Mounts a temporary, blank, in-memory filesystem over your home directory and host tmp folders. Only exceptions are core Lutris dependencies.
* Drops all Linux kernel caps and blocks access to system D-Bus
* Preserves ntsync
* Allows only core dependency syscalls through its default Seccomp-BPF filter for pressure-vessel/bwrap

### Caveats

* Offline access only
* Might not work out of the box with complex prefix setups

## Usage

Adjust profile location accordingly.

`Preferences > Global Options > Command prefix > firejail --profile=~/.config/firejail/lutris.profile`

## Alternatives

* [Bottles](https://usebottles.com/): Generally safe out of the box because it uses Flatpak
* [Lutris](https://lutris.net/): Flatpak variant + [Flatseal](https://flathub.org/en/apps/com.github.tchx84.Flatseal)

## License 

[GPL-2.0](https://github.com/netblue30/firejail/blob/master/COPYING)
