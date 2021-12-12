exoscada_sources = [
  'main.vala',
  'window.vala',
    'application.vala',
  ]

exoscada_deps = [
  dependency('gtk4'),
]

gnome = import('gnome')

exoscada_sources += gnome.compile_resources('exoscada-resources',
  'exoscada.gresource.xml',
  c_name: 'exoscada'
)

executable('exoscada', exoscada_sources,
  vala_args: '--target-glib=2.50',  dependencies: exoscada_deps,
  install: true,
)
