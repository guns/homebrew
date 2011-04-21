require 'formula'

class Rxvt < Formula
  homepage 'http://sourceforge.net/projects/rxvt/'
  url 'http://sourceforge.net/projects/rxvt/files/rxvt-dev/2.7.10/rxvt-2.7.10.tar.gz/download'
  md5 '302c5c455e64047b02d1ef19ff749141'

  def install
    ENV.x11

    system *%W[./configure --prefix=#{prefix}
                           --mandir=#{man}
                           --enable-languages
                           --enable-frills
                           --enable-mousewheel
                           --enable-slipwheeling
                           --enable-smart-resize
                           --enable-256-color]
    system 'make install'
  end
end
