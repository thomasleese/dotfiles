set -gxa LDFLAGS "-L/opt/homebrew/opt/sqlite/lib"
set -gxa CPPFLAGS "-I/opt/homebrew/opt/sqlite/include"
set -gxa PKG_CONFIG_PATH "/opt/homebrew/opt/sqlite/lib/pkgconfig"
set -gx PYTHON_CONFIGURE_OPTS --enable-loadable-sqlite-extensions --enable-optimizations --with-openssl=(brew --prefix openssl)
