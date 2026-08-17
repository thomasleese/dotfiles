set -gxa LDFLAGS "-L/opt/homebrew/opt/openssl@3/lib"
set -gxa CPPFLAGS "-I/opt/homebrew/opt/openssl@3/include"
set -gxa PKG_CONFIG_PATH "/opt/homebrew/opt/openssl@3/lib/pkgconfig"
