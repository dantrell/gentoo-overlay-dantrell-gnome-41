# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="Metapackage for GNOME core libraries"
HOMEPAGE="https://www.gnome.org/"

LICENSE="metapackage"
SLOT="3.0"
KEYWORDS="*"

IUSE="cups python"

RDEPEND="
	>=dev-libs/glib-2.70:2
	>=x11-libs/gdk-pixbuf-2.38:2
	>=x11-libs/pango-1.42
	>=media-libs/clutter-1.26:1.0
	>=x11-libs/gtk+-3.24:3[cups?]
	>=dev-libs/atk-2.36
	>=x11-libs/libwnck-40.0:3
	>=gnome-base/librsvg-2.40.21
	>=gnome-base/gnome-desktop-${PV}:3
	>=x11-libs/startup-notification-0.12

	>=gnome-base/gvfs-1.48
	>=gnome-base/dconf-0.40

	>=media-libs/gstreamer-1.14.5:1.0
	>=media-libs/gst-plugins-base-1.14.5:1.0
	>=media-libs/gst-plugins-good-1.14.5:1.0

	dev-lang/vala:0.50
	dev-lang/vala:0.52
	dev-lang/vala:0.54

	python? ( >=dev-python/pygobject-3.42.0:3 )
"
DEPEND=""
BDEPEND=""

S="${WORKDIR}"
