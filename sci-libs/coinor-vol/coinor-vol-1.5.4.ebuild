# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN=Vol

DESCRIPTION="COIN-OR volume algorithm linear program solver"
HOMEPAGE="https://github.com/coin-or/Vol/"
SRC_URI="https://github.com/coin-or/${MY_PN}/archive/releases/${PV}.tar.gz
	-> ${P}.tar.gz"
LICENSE="EPL-1.0"

# major soname component
SLOT="0/1"

KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="doc examples static-libs test"
RESTRICT="!test? ( test )"

# Fortran is NOT needed, but the ./configure scripts for all of the CoinOR
# packages contain a check for it. Gentoo bug 601648 and upstream issue,
#
#   https://github.com/coin-or/CoinUtils/issues/132
#
BDEPEND="virtual/fortran
	virtual/pkgconfig
	doc? ( app-doc/doxygen[dot] )
	test? ( sci-libs/coinor-sample )"

DEPEND="sci-libs/coinor-osi:=
	sci-libs/coinor-utils:="
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN}-releases-${PV}/${MY_PN}"

PATCHES=(
	"${FILESDIR}"/${P}-musl-1.2.3-null.patch
)

src_prepare() {
	# Needed to make the --with-coin-instdir in src_configure happy.
	dodir /usr

	# They don't need to guess at this, but they do, and get it wrong...
	sed -e "s:lib/pkgconfig:$(get_libdir)/pkgconfig:g" \
		-i configure \
		|| die "failed to fix the pkgconfig path in ${S}/configure"

	default
}

src_configure() {
	local myeconfargs=(
		--enable-dependency-linking
		--with-coin-instdir="${ED}/usr"
		$(use_with doc dot)
	)

	econf "${myeconfargs[@]}"
}

src_compile() {
	emake all $(usex doc doxydoc "")
}

src_test() {
	# NOT redundant! The build system has a "make check" target that does
	# nothing, so if you don't specify "test" here, you'll get a no-op.
	emake test
}

src_install() {
	use doc && HTML_DOC=("${BUILD_DIR}/doxydocs/html/")

	emake DESTDIR="${D}" install

	# Duplicate junk, and in the wrong location.
	rm -r "${ED}/usr/share/coin/doc/${MY_PN}" || die

	# Portage still throws a warning for these, but it's a bug
	# as far as I can tell: https://bugs.gentoo.org/721516
	docompress -x "/usr/share/doc/${PF}/examples/Volume-LP/data.mps.gz"
	docompress -x "/usr/share/doc/${PF}/examples/VolUfl/data.gz"
	use examples && dodoc -r examples
}
