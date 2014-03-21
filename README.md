# cgroupfs-mount
## Light-weight package to set up cgroupfs mounts

Control groups are a kernel mechanism for tracking and imposing limits on
resource usage on groups of tasks.

These scripts set up cgroups at boot without doing any cgroup management or
doing any classification of tasks into cgroups.

## Troubleshooting

It is critically important for the proper operation of these scripts that you do
not manually include any cgroup mount points in `/etc/fstab`.  After commenting
out any extraneous cgroup entries in `/etc/fstab`, you should either reboot or
manually umount them and then run `cgroupfs-mount` again.
