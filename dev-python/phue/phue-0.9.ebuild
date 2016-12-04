# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{4,5} )
inherit distutils-r1

DESCRIPTION="A Phillips Hue Python Library"
HOMEPAGE="https://github.com/studioimaginaire/phue"
SRC_URI="https://github.com/studioimaginaire/${PN}/archive/${PV}.tar.gz -> phue-0.9.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
