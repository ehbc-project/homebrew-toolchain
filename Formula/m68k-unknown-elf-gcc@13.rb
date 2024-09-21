class M68kUnknownElfGccAT13 < Formula
    desc "GNU Compiler Collection 13 (cross, m68k)"
    homepage "https://gcc.gnu.org"
    url "https://mirrorservice.org/sites/sourceware.org/pub/gcc/releases/gcc-13.3.0/gcc-13.3.0.tar.gz"
    sha256 "3a2b10cab86e32358fdac871546d57e2700e9bdb5875ef33fff5b601265b9e32"

    depends_on "m68k-unknown-elf-binutils"

    depends_on "gmp"
    depends_on "isl"
    depends_on "libmpc"
    depends_on "mpfr"

    def install
        ENV.delete "LD"
        ENV["gcc_cv_prog_makeinfo_modern"] = "no"

        args = [
            "--disable-debug",
            "--disable-dependency-tracking",
            "--disable-silent-rules",
            "--target=m68k-unknown-elf",
            "--enable-languages=c,c++",
            "--disable-nls",
            "--with-as=#{Formula["m68k-unknown-elf-binutils"].opt_bin}/m68k-elf-as",
            "--with-ld=#{Formula["m68k-unknown-elf-binutils"].opt_bin}/m68k-elf-ld",
            "--prefix=#{prefix}"
        ]

        mkdir "../build" do
            system "../gcc-#{version}/configure", *args
            system "make", "all-gcc", "all-target-libgcc"
            system "make", "install-gcc", "install-target-libgcc"
        end
    end
end
