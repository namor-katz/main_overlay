# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="digital diary"
HOMEPAGE="http://lifeograph.sourceforge.net/wiki/Main_Page"
SRC_URI="https://launchpad.net/lifeograph/trunk/1.6.1/+download/lifeograph-1.6.1.tar.xz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-cpp/gtkmm
	app-text/enchant
	dev-libs/libgcrypt
	"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/meson"


src_configure() {
	mkdir -v builddir || die "failed create dir"
	meson --buildtype=release --prefix=/usr builddir || die "error configure"
	echo "=================== FINAL configure ======================="
}


src_compile() {
	cd builddir || die "Error cd builddir"
	ninja -v || die "Error compile!"
}

