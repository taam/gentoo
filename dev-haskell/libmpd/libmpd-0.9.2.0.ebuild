# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.7.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="An MPD client library"
HOMEPAGE="https://github.com/vimus/libmpd-haskell#readme"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~ppc64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/attoparsec-0.10.1:=[profile?] <dev-haskell/attoparsec-1:=[profile?]
	>=dev-haskell/data-default-class-0.0.1:=[profile?] <dev-haskell/data-default-class-1:=[profile?]
	>=dev-haskell/mtl-2.0:=[profile?] <dev-haskell/mtl-3:=[profile?]
	>=dev-haskell/network-2.6.3.5:=[profile?]
	>=dev-haskell/old-locale-1:=[profile?] <dev-haskell/old-locale-2:=[profile?]
	>=dev-haskell/safe-exceptions-0.1:=[profile?] <dev-haskell/safe-exceptions-0.2:=[profile?]
	>=dev-haskell/text-0.11:=[profile?] <dev-haskell/text-2:=[profile?]
	>=dev-haskell/utf8-string-0.3.1:=[profile?] <dev-haskell/utf8-string-1.1:=[profile?]
	>=dev-lang/ghc-8.0.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.24.0.0
	test? ( >=dev-haskell/hspec-1.3
		>=dev-haskell/quickcheck-2.10 )
"
