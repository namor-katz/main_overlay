# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="This timer from pomodoro technique"
HOMEPAGE="https://github.com/eliostvs/tomate-gtk"
SRC_URI="https://github.com/eliostvs/tomate-gtk/archive/master.zip"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-util/desktop-file-utils
	dev-util/gtk-update-icon-cache
"
RDEPEND="${DEPEND}"
BDEPEND=""
