class M68kUnknownElfBinutils < Formula
    desc "GNU Binutils (cross, m68k)"
    homepage "https://www.gnu.org/software/binutils/"
    url "https://ftp.gnu.org/gnu/binutils/binutils-2.42.tar.gz"
    sha256 "5d2a6c1d49686a557869caae08b6c2e83699775efd27505e01b2f4db1a024ffc"

    depends_on "texinfo" => :build

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
