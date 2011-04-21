require 'formula'

class Screen < Formula
  url 'http://ftp.gnu.org/gnu/screen/screen-4.0.3.tar.gz'
  homepage 'http://www.gnu.org/software/screen/'
  md5 '8506fd205028a96c741e4037de6e3c42'

  def install
    # Apple's patches reference vproc_priv.h, a header file for launchd;
    # the version on the trunk is incompatible with screen, so we use an earlier revision
    system 'curl', '-Lo', 'vproc_priv.h', 'http://launchd.macosforge.org/trac/browser/branches/PR-6132016/launchd/src/libvproc_private.h?rev=23964&format=txt'

    # 256 colors is the major reason we want to roll our own screen
    system './configure', '--disable-debug', '--disable-dependency-tracking',
                          '--enable-locale', '--enable-telnet', '--enable-colors256', '--enable-rxvt_osc',
                          "--prefix=#{prefix}"

    # TODO: Makefile does not install documentation
    system 'make install'
  end

  # Apple's patches for compiling on OS X
  def patches
    url = 'http://www.opensource.apple.com/source/screen/screen-12/patches/%s?txt'
    { :p0 => [ 'Makefile.in.diff',
               'config.h.in.diff',
               'configure.diff',
               'pty.c.diff',
               'screen.c.diff',
               'window.c.diff' ].map { |f| url % f }
    }
  end
end
