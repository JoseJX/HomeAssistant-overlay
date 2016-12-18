# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{4,5} )
inherit distutils-r1

DESCRIPTION="Calculates a token to run the Google Translate text to speech"
HOMEPAGE="https://github.com/boudewijn26/gTTS-token"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.zip"


LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
