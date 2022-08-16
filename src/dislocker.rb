#
# this brew file *must* be called 'dislocker.rb' to match the Formula
#

require 'formula'

class Dislocker < Formula
    head 'https://github.com/satra/dislocker.git'

    depends_on 'mbedtls@2'
    depends_on 'cmake'
#    This dependency is separately installed, as a cask
#    depends_on :osxfuse

    def install
        system 'cmake', *std_cmake_args
        system 'make'
        system 'make', 'install'
    end
end
