# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{4,5} )
inherit distutils-r1

DESCRIPTION="Python library for controlling the Nest Thermostat"
HOMEPAGE="http://github.com/technicalpickles/python-nest/"
SRC_URI="https://github.com/technicalpickles/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="CC-BY-SA-3.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
