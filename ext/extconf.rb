# Loads mkmf which is used to make makefiles for Ruby extensions
require 'mkmf'

$LDFLAGS << ' -x objective-c -framework IOKit'

# Give it a name
extension_name = 'kinetosis'

# The destination
dir_config(extension_name)

# Do the work
create_makefile(extension_name)
