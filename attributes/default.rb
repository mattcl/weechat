default['weechat']['required_packages'] = %w{
  cmake libncursesw5-dev libcurl4-gnutls-dev zlib1g-dev libgcrypt11-dev
}

default['weechat']['optional_packages'] = %w{
  libgnutls-dev gettext ca-certificates libaspell-dev python-dev libperl-dev
  ruby1.9.1-dev liblua5.1-0-dev tcl-dev asciidoc source-highlight xsltproc
}

default['weechat']['source'] = 'http://www.weechat.org/files/src/weechat-0.4.3.tar.bz2'
default['weechat']['source_tarball_name'] = default['weechat']['source'].split('/').last
default['weechat']['source_dir'] = default['weechat']['source_tarball_name'].gsub(/\.tar.*$/, '')

default['weechat']['compile_options'] = %w{
  -DENABLE_ALIAS=ON
  -DENABLE_ASPELL=ON
  -DENABLE_CHARSET=ON
  -DENABLE_GNUTLS=ON
  -DENABLE_LARGEFILE=ON
  -DENABLE_LOGGER=ON
  -DENABLE_LUA=ON
  -DENABLE_NLS=ON
  -DENABLE_PERL=ON
  -DENABLE_PYTHON=ON
  -DENABLE_RELAY=ON
  -DENABLE_RMODIFIER=ON
  -DENABLE_RUBY=ON
  -DENABLE_SCRIPT=ON
  -DENABLE_TCL=ON
  -DENABLE_XFER=ON
}.join(' ')
