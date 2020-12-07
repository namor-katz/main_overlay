# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PV="8-update9"
MY_P="${PN}-${MY_PV}-linux"

DESCRIPTION="A brainstorming and mind mapping software tool"
HOMEPAGE="https://wwww.xmind.net"
SRC_URI="https://dl3.xmind.net/${MY_P}.zip"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="
	>=virtual/jre-1.8
	x11-libs/gtk+:2
"
BDEPEND=""
S=${WORKDIR}

FONT_SUFFIX="ttf"
FONT_S="${S}/fonts"

src_configure() {
	if use amd64; then
		XDIR="XMind_amd64"
	else
		XDIR="XMind_i388"
	fi
	mv "$XDIR" XMind || die
	# force data instance & config area to be at home/.xmind directory
	sed \
		-e '/-configuration/d' \
		-e '/\.\/configuration/d' \
		-e '/-data/d' \
		-e '/\.\.\/Commons\/data\/workspace-cathy/d' \
		-e 's/\.\.\/plugins/\/opt\/xmind\/plugins/g' \
		-e '/-vmargs/i-showsplash' \
		-e '/vmargs/iorg.xmind.cathy' \
		-i XMind/XMind.ini || die
	echo '-Dosgi.instance.area=@user.home/.xmind/workspace-cathy' >> XMind/XMind.ini || die
	echo '-Dosgi.configuration.area=@user.home/.xmind/configuration-cathy' >> XMind/XMind.ini || die
}

src_compile() {
	:
}

src_install() {
	insinto /opt/xmind
	doins -r plugins configuration features XMind
	fperms a+rx  "/opt/xmind/XMind/XMind"

	exeinto /opt/bin
#	newexe "${FILESDIR}/xmind-wrapper-3.7.0" xmind

	# install icons
	local res
	for res in 16 32 48; do
		newicon -s ${res} "${WORKDIR}/xmind-icons/xmind.${res}.png" xmind.png
	done

	make_desktop_entry ${PN} "XMind" ${PN} "Office" "MimeType=application/x-xmind;"
	font_src_install
}

pkg_postinst() {
	font_pkg_postinst
	xdg_pkg_postinst
	optfeature "audio notes support" media-sound/lame
}
