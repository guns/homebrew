require 'formula'

class Qtplay < Formula
  url 'http://qtplay.googlecode.com/files/qtplay%201.4.0.zip'
  homepage 'http://code.google.com/p/qtplay/'
  md5 '903a62347998c06963b2511e8134e8af'

  # compiled binary is included in releases
  def install
    bin.install 'qtplay/qtplay'
  end
end
