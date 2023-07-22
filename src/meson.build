project(
  'io.outlawd.exo',
  'c', 'vala',
  'javascript',
  'python3',
  'nodejs',
  'gjs'
  version: '0.2.5'
)


exo_sources = [
  'main.js',
  'window.js',
    'application.js',
    'prefs.js',
    
  ]
## // core folder blah blah
exo_deps = [
  dependency('gtk4'),
]

gnome = import('gnome')

exo_sources += gnome.compile_resources('exoscada-resources',
  'exoscada.gresource.xml',
  c_name: 'exoscada'
)

executable('exo', exo_sources,
  vala_args: '--target-glib=2.50',  dependencies: exo_deps,
  install: true,
)
