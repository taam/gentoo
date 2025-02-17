# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.1.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Deriver for Data.Vector.Unboxed using Template Haskell"
HOMEPAGE="https://hackage.haskell.org/package/vector-th-unbox"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~ppc64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/vector-0.7.1:=[profile?] <dev-haskell/vector-0.13:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
	test? ( dev-haskell/data-default )
"

src_prepare() {
	default

	cabal_chdeps \
		'base >= 4.5 && < 4.14' 'base >= 4.5' \
		'template-haskell >= 2.5 && <2.16' 'template-haskell >= 2.5'
}
