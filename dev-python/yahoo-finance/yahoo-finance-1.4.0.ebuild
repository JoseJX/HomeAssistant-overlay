# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{4,5} )
inherit distutils-r1

DESCRIPTION="Python module to get stock data from Yahoo! Finance"
HOMEPAGE="https://github.com/lukaszbanasiak/yahoo-finance"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/simplejson[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
