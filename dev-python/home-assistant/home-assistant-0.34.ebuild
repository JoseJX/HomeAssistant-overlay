# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PYTHON_COMPAT=( python3_{4,5} )
inherit distutils-r1

DESCRIPTION="Open source home automation platform"
HOMEPAGE="http://home-assistant.io"
if [[ ${PV} = 9999 ]]; then
    inherit git-r3
    EGIT_REPO_URI="https://github.com/home-assistant/home-assistant.git"
else
    SRC_URI="https://github.com/${PN}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
    KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"
IUSE="+hue +google +discovery +zeroconf +yahoo"

DEPEND="${PYTHON_DEPS}
	<dev-python/requests-3[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.11[${PYTHON_USEDEP}]
	>=dev-python/pytz-2016.7[${PYTHON_USEDEP}]
	>=dev-python/pip-7[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.8[${PYTHON_USEDEP}]
	=dev-python/voluptuous-0.9.2[${PYTHON_USEDEP}]
	<dev-python/typing-4[${PYTHON_USEDEP}]
	=dev-python/aiohttp-1.1.6[${PYTHON_USEDEP}]
	=dev-python/async_timeout-1.1.0[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}
	zeroconf? ( dev-python/zeroconf )
	discovery? ( dev-python/netdisco )
	hue? ( =dev-python/phue-0.9 )
	google? ( 
		dev-python/oauth2client 
		dev-python/pychromecast
	)
	yahoo? ( dev-python/yahooweather )
"
