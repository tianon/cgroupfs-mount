FROM debian:sid
MAINTAINER Tianon Gravi <admwiggin@gmail.com>

# build deps
RUN apt-get update && apt-get install -yq \
	devscripts \
	equivs \
	libcrypt-ssleay-perl \
	libfile-fcntllock-perl \
	libwww-perl \
	lintian \
	python3-debian \
	--no-install-recommends

# need an editor for "dch -i"
RUN apt-get update && apt-get install -yq vim-nox --no-install-recommends

# need deb-src for compiling packages
RUN echo 'deb-src http://http.debian.net/debian sid main' >> /etc/apt/sources.list

# start by adding just "debian/control" so we can get mk-build-deps with maximum caching
ADD debian/control /usr/src/cgroupfs-mount/debian/
WORKDIR /usr/src/cgroupfs-mount

# get all the build deps of _this_ package in a nice repeatable way
RUN apt-get update && mk-build-deps -irt'apt-get --no-install-recommends -yq' debian/control

# need our debian/ directory (and our source) to compile _this_ package
ADD . /usr/src/cgroupfs-mount

# tianon is _really_ lazy, and likes a preseeded bash history
RUN { \
	echo "DEBFULLNAME='' DEBEMAIL='' dch -i"; \
	echo 'lintian --ftp-master-rejects'; \
	echo 'debuild -us -uc --lintian-opts "-EvIL+pedantic"'; \
} >> /.bash_history

CMD [ "debuild", "-us", "-uc", "--lintian-opts", "-EvIL+pedantic" ]
