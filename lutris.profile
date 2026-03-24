net none
protocol unix,inet,inet6,netlink

tmpfs ${HOME}

whitelist ${HOME}/.local/share/lutris
whitelist ${HOME}/.local/share/umu
whitelist ${HOME}/.local/share/Steam/compatibilitytools.d
whitelist ${HOME}/.cache/umu
whitelist ${HOME}/.cache/umu-protonfixes
whitelist ${HOME}/.config/protonfixes

read-write ${HOME}/.cache/umu
read-write ${HOME}/.cache/umu-protonfixes
read-write ${HOME}/.local/share/umu

caps.drop all
ipc-namespace
netfilter
nodvd
noroot
notv
novideo

private-tmp
keep-dev-ntsync
nogroups
nonewprivs

dbus-system none
dbus-user filter
dbus-user.talk com.feralinteractive.GameMode

seccomp !clone3,!modify_ldt,!pivot_root,!mount,!umount2,!unshare
seccomp.32 !modify_ldt
