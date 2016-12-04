# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{4,5} )
inherit distutils-r1

DESCRIPTION="Library to communicate with the Google Chromecast"
HOMEPAGE="https://github.com/balloob/pychromecast"
SRC_URI="https://github.com/balloob/pychromecast/archive/${PV}.tar.gz -> pychromecast-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-python/requests
dev-python/protobuf-python
dev-python/zeroconf
dev-python/six
"
