class M68kUnknownElfGdb < Formula
    desc "GNU Debugger (cross, m68k)"
    homepage "https://www.gnu.org/software/gdb/"
    url "https://ftp.gnu.org/gnu/gdb/gdb-15.1.tar.gz"
    sha256 "8b61b0c2bdd9d9c83b113c9167866bdb474651d291fedcaa5eb7cde49bd47036"

    depends_on "gmp"
    depends_on "isl"
    depends_on "libmpc"
    depends_on "mpfr"

    def install
        args = [
            "--disable-debug",
            "--disable-dependency-tracking",
            "--disable-silent-rules",
            "--target=m68k-unknown-elf",
            "--prefix=#{prefix}"
        ]

        system "./configure", *args

        system "make"
        system "make", "install"
    end
end
