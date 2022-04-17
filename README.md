# rpi-imager

This is the source for the snap packaging of the Raspberry Pi Imager. Please
feel free to open issues that you encounter with the imager (when installed
from a snap) in this repository.

## Installation

    sudo snap install rpi-imager

## Notices

There was [an issue](https://github.com/popey/imager-snap/issues/16) with the
customization of the first-run (or cloud-init) configuration. This has now been
[resolved](https://forum.snapcraft.io/t/auto-connection-request-rpi-imager/29170)
with the addition of a couple of new auto-connections for the interfaces
required, but I do not know if this will fix the issue for *existing*
installations (I would hope it would, but it may not occur until the snaps are
refreshed).

If you encounter `Error creating firstrun.sh on FAT partition` (or something
similar; I would imagine `user-data` would be mentioned in the case of an image
that supported cloud-init), please try the following to see if it resolves
things before opening an issue:

    sudo snap connect rpi-imager:mount-observe
    sudo snap connect rpi-imager:removable-media

I have made some efforts to update the UI integration of the snap, so the
fonts *should* now appear at the correct size, and the native GTK-3 open
dialog *should* be used in the case of selecting a custom image. I would be
interested to hear of any issues in the area of UI integration.

## Useful links

* [Original source code](https://github.com/raspberrypi/rpi-imager)
* [Official download (Win/macOS/Deb-x86)](https://www.raspberrypi.com/software/)
* [Ubuntu packaging of Imager](https://launchpad.net/ubuntu/+source/rpi-imager)
