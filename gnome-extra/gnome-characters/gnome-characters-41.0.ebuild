# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit gnome.org gnome2-utils meson xdg

DESCRIPTION="Unicode character map viewer and library"
HOMEPAGE="https://wiki.gnome.org/Design/Apps/CharacterMap"

LICENSE="GPL-2+ BSD"
SLOT="0"
KEYWORDS="*"

RDEPEND="
	>=dev-libs/gjs-1.50
	>=dev-libs/glib-2.32:2
	>=dev-libs/gobject-introspection-1.35.9:=
	>=dev-libs/libunistring-0.9.5:=
	>=x11-libs/gtk+-3.20:3[introspection]
	x11-libs/gdk-pixbuf:2
	>=x11-libs/pango-1.36[introspection]
	gnome-base/gnome-desktop:3[introspection]
	>=gui-libs/libhandy-1.1:1=
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-libs/libxml2:2
	>=sys-devel/gettext-0.19.8
	virtual/pkgconfig
"

PATCHES=(
	# From Gentoo:
	# 	https://bugs.gentoo.org/831471
	"${FILESDIR}"/${PN}-41.0-fix-build-with-meson-0.61.patch
)

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postinst() {
	xdg_pkg_postrm
	gnome2_schemas_update
}
