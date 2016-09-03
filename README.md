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

For Debian users, simply `apt-get install cgroupfs-mount`.

If you're on Ubuntu 14.04 (Trusty), you should simply use `cgroup-lite` instead
(the equivilant package this one was based upon).

If you're on Ubuntu 16.04 (Xenial) or later, you're likely using `systemd`
already, and thus are unlikely to need this package.

If you're on some other distribution, either look for a similar package in your
distribution's packages or clone these scripts and ensure that the
`cgroupfs-mount` script is somehow invoked during system startup.

## Troubleshooting

It is critically important for the proper operation of these scripts that you do
not manually include any cgroup mount points in `/etc/fstab`.  After commenting
out any extraneous cgroup entries in `/etc/fstab`, you should either reboot or
manually umount them and then run `cgroupfs-mount` again.
