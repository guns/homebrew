require 'formula'

class Htop < Formula
  head 'git://github.com/guns/htop-vi.git', :branch => 'osx-vi-keys'
  homepage 'http://htop.sourceforge.net/'

  def install
    system "./autogen.sh"
    system "./configure", "--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make", "install", "DEFAULT_INCLUDES='-iquote .'"
    rm_rf "#{share}/applications" # Don't need Gnome support on OS X
    rm_rf "#{share}/pixmaps"
  end
end
