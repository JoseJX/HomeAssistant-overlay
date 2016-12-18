# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{4,5} )
inherit distutils-r1

DESCRIPTION="Python library to scan local network for services and devices"
HOMEPAGE="https://github.com/home-assistant/netdisco"
SRC_URI="https://github.com/home-assistant/netdisco/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
