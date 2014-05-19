FROM tianon/debian-devel

# start by adding just "debian/control" so we can get mk-build-deps with maximum caching
ADD debian/control /usr/src/cgroupfs-mount/debian/
WORKDIR /usr/src/cgroupfs-mount

# get all the build deps of _this_ package in a nice repeatable way
RUN apt-get update && mk-build-deps -irt'apt-get --no-install-recommends -yq' debian/control

# need our debian/ directory (and our source) to compile _this_ package
ADD . /usr/src/cgroupfs-mount

# tianon is _really_ lazy, and likes a preseeded bash history
RUN echo 'dpkg-buildpackage -us -uc && lintian -EvIL+pedantic' >> "$HOME/.bash_history"
