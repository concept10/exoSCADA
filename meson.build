project('exoscada', ['c', 'vala'],
          version: '0.1.0',
    meson_version: '>= 0.50.0',
  default_options: [ 'warning_level=2',
                   ],
)

gnome = import 'gnome'
i18n = import('i18n')

cc = meson.get_compiler('c')
################################################################################
# Dependencies

giomm   = dependency('giomm-2.4',   version: '>=2.46')
glib    = dependency('glib-2.0',    version: '>=2.56.0')

if get_option('systemd')
  libsystemd = dependency('libsystemd', version: '>=237')
else
  libsystemd = dependency('', required: false)
endif

gtk3    = dependency('gtk+-3.0',    version: '>=3.22.0')



subdir('data')
subdir('src')
subdir('po')

meson.add_install_script('build-aux/meson/postinstall.py')
