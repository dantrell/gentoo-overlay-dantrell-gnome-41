# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python{3_10,3_11,3_12,3_13} )
VALA_MIN_API_VERSION="0.40"

inherit gnome.org gnome2-utils meson python-any-r1 vala xdg

DESCRIPTION="GNOME contact management application"
HOMEPAGE="https://wiki.gnome.org/Design/Apps/Contacts"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="*"

IUSE="telepathy v4l"

VALA_DEPEND="
	$(vala_depend)
	>=dev-libs/gobject-introspection-1.54:=
	dev-libs/folks[vala(+)]
	net-libs/gnome-online-accounts:=[vala]
	gnome-extra/evolution-data-server[gtk,vala]
	telepathy? ( net-libs/telepathy-glib[vala] )
	>=gui-libs/libhandy-1.1.0:1[vala]
"
# Configure is wrong; it needs cheese-3.5.91, not 3.3.91
RDEPEND="
	>=gnome-extra/evolution-data-server-3.30:=[gnome-online-accounts]
	>=dev-libs/folks-0.11.4:=[eds,telepathy?]
	>=dev-libs/glib-2.58:2
	>=dev-libs/libgee-0.10:0.8
	>=gnome-base/gnome-desktop-3.0:3=
	net-libs/gnome-online-accounts:=
	>=x11-libs/gtk+-3.23.1:3
	v4l? ( >=media-video/cheese-3.5.91:= )
	telepathy? ( >=net-libs/telepathy-glib-0.22 )
	>=gui-libs/libhandy-1.0.0:1
"
DEPEND="${RDEPEND}"
BDEPEND="
	${PYTHON_DEPS}
	${VALA_DEPEND}
	app-text/docbook-xml-dtd:4.2
	app-text/docbook-xsl-stylesheets
	dev-libs/appstream-glib
	dev-libs/libxml2:2
	dev-libs/libxslt
	>=sys-devel/gettext-0.19.8
	virtual/pkgconfig
"

src_prepare() {
	default
	vala_setup
	xdg_environment_reset
}

src_configure() {
	local emesonargs=(
		$(meson_feature v4l cheese)
		$(meson_use telepathy)
		-Dmanpage=true
		-Ddocs=false
	)
	meson_src_configure
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}
