#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri
brew install lynx

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
#[JUSTIN] what uses this? 
#brew install ringojs
#[JUSTIN] https://github.com/280north/narwhal (deprecated project) 
#brew install narwhal
#[JUSTIN] another JS engine
#brew install rhino

# Install more recent versions of some macOS tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php56 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
#[JUSTIN] These are security challenge tools
#brew install aircrack-ng
#[JUSTIN] this tool may be interesting, but scala
#brew install bfg
#[JUSTIN] this is development tooling, might be interesting
#brew install binutils
#brew install binwalk
#brew install cifer
#brew install dex2jar
#brew install dns2tcp
#brew install fcrackzip
#brew install foremost
#brew install hashpump
#brew install hydra
#brew install john
#brew install knock
#brew install netpbm
#brew install nmap
#brew install pngcheck
#[JUSTIN] might be interesting, sort of an improved netcat
#brew install socat
#brew install sqlmap
#brew install tcpflow
#brew install tcpreplay
#brew install tcptrace
#brew install ucspi-tcp # `tcpserver` etc.
#brew install xpdf
#brew install xz

# Install other useful binaries.
brew install ack
#[JUSTIN] MAC OS Utility
brew install dark-mode
#[JUSTIN] image manipulation (commented out originally)
#brew install exiv2
brew install git
brew install git-lfs
#[JUSTIN] web dev utility
brew install imagemagick --with-webp
brew install lua
brew install p7zip
#[JUSTIN] parallel processing version of gzip
brew install pigz
#[JUSTIN] monitor data through process pipes
brew install pv
#[JUSTIN] file renaming utilities
brew install rename
#brew install speedtest_cli
#[JUSTIN] no documentation found on this
#brew install ssh-copy-id
#brew install testssl
brew install tree
brew install vbindiff
#[JUSTIN] web dev utility
brew install webkit2png
#[JUSTIN] compression utility
#brew install zopfli

# Remove outdated versions from the cellar.
brew cleanup
