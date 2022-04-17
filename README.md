# rpi-imager

This is the source for the snap packaging of the Raspberry Pi Imager. Please
feel free to open issues that you encounter with the imager (when installed
from a snap) in this repository.

## Installation

The Imager can be installed from the snap store like so:

    sudo snap install rpi-imager

Updates will be performed automatically. The Imager can be removed with the
following command:

    sudo snap remove rpi-imager

## Notes

### Undesirable flash targets

The sandboxing means that the Imager can't tell which storage is genuinely
removable. Be aware that, when running on certain platforms (e.g. a Raspberry
Pi, or my little laptop which has eMMC storage), your boot device *may* appear
as a flash target under "CHOOSE STORAGE" (alongside the device you wish to
flash to).

It may be possible to fix this in future, but for the time being: choose
carefully!

### First-run configuration errors

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

### UI integration

I have made some efforts to update the UI integration of the snap, so the fonts
*should* now appear at the correct size, the cursor should be the native one,
and the native GTK-3 open dialog *should* be used in the case of selecting a
custom image. I would be interested to hear of any issues in the area of UI
integration.

### Size

As the Imager is based on the Qt5 UI framework, and snap's support for Qt5 (on
architectures other than `amd64`) is …
[complicated](https://forum.snapcraft.io/t/deprecated-desktop-app-support-qt5/11703),
the size of the snap is necessarily *huge* (because it's bundling much of Qt5).
This also means its start-up time is less than stellar; sorry about that.

## Useful links

* [Store page](https://snapcraft.io/rpi-imager)
* [Original source code](https://github.com/raspberrypi/rpi-imager)
* [Official download (Win/macOS/Deb-x86)](https://www.raspberrypi.com/software/)
* [Ubuntu packaging of Imager](https://launchpad.net/ubuntu/+source/rpi-imager)
