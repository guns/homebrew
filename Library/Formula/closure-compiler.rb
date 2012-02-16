require 'formula'

class ClosureCompiler < Formula
  url 'http://closure-compiler.googlecode.com/files/compiler-20110615.tar.gz'
  homepage 'http://code.google.com/p/closure-compiler/'
  md5 '7ba597fa67b187df23413eb0ca50f4cb'

  def install
    libexec.install "compiler.jar"
    (bin+'closure-compiler').write <<-EOS.undent
      #!/bin/sh
      java -jar #{libexec}/compiler.jar --js "$@"
    EOS
  end
end
