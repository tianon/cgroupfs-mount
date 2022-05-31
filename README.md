# cgroupfs-mount

## Light-weight package to set up cgroupfs mounts

Control groups are a kernel mechanism for tracking and imposing limits on
resource usage on groups of tasks.

These scripts set up cgroups at boot without doing any cgroup management or
doing any classification of tasks into cgroups.

## Do I need this?

If you're using `systemd` as your init system, you do not need this, as
`systemd` will already configure and manage a properly mounted cgroup hierarchy.

## How do I install this?

For Debian-family non-systemd:

Release = 14.04:

	Do not install this package, instead use: "apt-get install cgroup-lite"

Release > 14.04:

	Install this package:  "apt-get install cgroupfs-mount"

Release >= 16.04:

	Do NOT install this package.  Ubuntu 16.04 uses systemd and does NOT need this package.

For RedHat-family non-systemd:

Release = 6.x: 

	(tested on Oracle Linux 6.9):
	
	Installing as non-root user with SUDO ALL privileges:

		./install-linux-6.sh

	Installing as root user:

		./install-linux-6-root.sh

	Usage: sudo service cgroupfs [start|stop|restart|status]

	These scripts run the following commands with/without sudo prefix:

	sudo chmod 755 cgroupfs cgroupfs-mount cgroupfs-umount
	sudo cp -p cgroupfs-mount  /etc/cgroupfs-mount
	sudo cp -p cgroupfs-umount /etc/cgroupfs-umount
	sudo cp -p cgroupfs /etc/init.d/cgroupfs
	sudo chkconfig --add cgroupfs
	sudo chkconfig cgroupfs on --level 345
	sudo chkconfig --list

For Other non-Debian and non-RedHat Linux Architectures:

If you're on some other distribution, either look for a similar package in your
distribution's packages or clone these scripts and ensure that the `cgroupfs-mount`
script is somehow invoked during system startup.

## Troubleshooting

It is critically important for the proper operation of these scripts that you do
not manually include any cgroup mount points in `/etc/fstab`.  After commenting
out any extraneous cgroup entries in `/etc/fstab`, you should either reboot or
manually umount them and then run `cgroupfs-mount` again.
