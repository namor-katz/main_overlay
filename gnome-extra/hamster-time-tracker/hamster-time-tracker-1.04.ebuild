# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_6,2_7} )
PYTHON_REQ_USE='threads(+)'

inherit eutils waf-utils python-single-r1

DESCRIPTION="Time tracking for the masses"
HOMEPAGE="http://projecthamster.wordpress.com/"
SRC_URI="https://github.com/projecthamster/hamster/archive/${P}.tar.gz"
LICENSE="GPL-3"
SLOT="1"
KEYWORDS="~amd64"
IUSE=""
S="${WORKDIR}/hamster-${P}"

DEPEND="dev-python/gconf-python
		gnome-base/gconf[introspection]
		dev-python/pyxdg
		>=x11-libs/gtk+-3.10
		sys-devel/gettext
		dev-util/intltool"
RDEPEND="${DEPEND}"

pkg_setup() {
	python-single-r1_pkg_setup
}

src_prepare() {
	python_fix_shebang .
}
