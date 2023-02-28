# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python{3_9,3_10,3_11} )

inherit gnome.org gnome2-utils meson python-any-r1 vala xdg

DESCRIPTION="Disk usage browser for GNOME"
HOMEPAGE="https://wiki.gnome.org/Apps/Baobab"

LICENSE="GPL-2+ FDL-1.1+"
SLOT="0"
KEYWORDS="*"

RDEPEND="
	>=dev-libs/glib-2.44:2
	>=x11-libs/gtk+-3.24.1:3
	>=gui-libs/libhandy-1.0.0:1=
"
DEPEND="${RDEPEND}"
BDEPEND="
	${PYTHON_DEPS}
	$(vala_depend)
	>=gui-libs/libhandy-1.0.0:1=[vala]
	dev-util/itstool
	>=sys-devel/gettext-0.21
	virtual/pkgconfig
"

src_prepare() {
	default
	vala_setup
	xdg_environment_reset
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}
