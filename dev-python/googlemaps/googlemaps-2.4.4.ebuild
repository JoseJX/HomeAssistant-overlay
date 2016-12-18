# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{4,5} )
inherit distutils-r1

DESCRIPTION="Python client library for Google Maps API Web Services"
HOMEPAGE="https://github.com/googlemaps/google-maps-services-python"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	<=dev-python/requests-2.11.1[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
