# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{4,5} )
inherit distutils-r1

DESCRIPTION="Python library for controlling the Nest Thermostat"
HOMEPAGE="http://github.com/jkoelker/python-nest/"

# The requirements_all.txt from homeassistant calls this version 3.0.2?
GIT_VER=b8391d2b3cb8682f8b0c2bdff477179983609f39
SRC_URI="https://github.com/technicalpickles/${PN}/archive/${GIT_VER}.zip -> ${P}.zip"
S="${WORKDIR}/${PN}-${GIT_VER}"

LICENSE="CC-BY-SA-3.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/requests-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.10.0[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
