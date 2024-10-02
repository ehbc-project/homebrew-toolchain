class VasmM68k < Formula
    desc "vasm portable and retargetable assembler (m68k Motorola syntax)"
    homepage "http://sun.hasenbraten.de/vasm/"
    url "http://phoenix.owl.de/tags/vasm1_9d.tar.gz"
    version "1.9d"
    sha256 "0e5d4285bdca8d1db9eae4ea8061788bce603bf5c1f369f070c2218b4915c985"
    
    def install
        system "make", "CPU=m68k", "SYNTAX=mot"
        bin.install "vasmm68k_mot"
    end
  
    test do
        (testpath/"test.S").write <<~EOS
            section .text                     ; This is normal code

        main::
            rts                               ; And return
        EOS
        
        system "#{bin}/vasmm68k_mot", "-o", "test", "test.S"
    end
end