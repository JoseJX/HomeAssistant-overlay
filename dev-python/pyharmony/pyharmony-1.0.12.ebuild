# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{4,5} )
inherit distutils-r1

DESCRIPTION="Python library for programmatically using a Logitech Harmony Link or Ultimate Hub."
HOMEPAGE="https://github.com/jterrace/pyharmony"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"


LICENSE="BSD-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/sleekxmpp[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
