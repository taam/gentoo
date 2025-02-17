# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.6.7.9999

CABAL_FEATURES="test-suite"
inherit haskell-cabal

DESCRIPTION="C->Haskell FFI tool that gives some cross-language type safety"
HOMEPAGE="https://github.com/haskell/c2hs"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc64 ~x86"
IUSE="regression"

RESTRICT=test # needs unprefixed 'cpp'

RDEPEND="dev-haskell/dlist:=
	>=dev-haskell/language-c-0.7.1:= <dev-haskell/language-c-0.10:=
	>=dev-lang/ghc-8.4.3:=
	regression? ( >=dev-haskell/shelly-1.9.0:= <dev-haskell/shelly-1.10.0:=
			dev-haskell/text:=
			>=dev-haskell/yaml-0.8:= )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
	test? ( dev-haskell/hunit
		dev-haskell/test-framework
		dev-haskell/test-framework-hunit
		!regression? ( >=dev-haskell/shelly-1.9.0 <dev-haskell/shelly-1.10.0
				dev-haskell/text ) )
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag regression regression)
}
