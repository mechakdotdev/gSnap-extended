'use strict'
// Library imports
const Gio = imports.gi.Gio;

// Extension imports
const Me = imports.misc.extensionUtils.getCurrentExtension();

var settings;

function get() {
  if (!settings) {
    let dir = Me.dir.get_child('schemas').get_path();
    let source = Gio.SettingsSchemaSource.new_from_directory(
        dir,
        Gio.SettingsSchemaSource.get_default(),
        false);

    if (!source) {
        throw new Error('Error Initializing the thingy.');
    }

    let schema = source.lookup('org.gnome.shell.extensions.gsnap', false);

    if (!schema) {
        throw new Error('Schema missing.');
    }

    settings = new Gio.Settings({
        settings_schema: schema
    });
  }
  return settings;
}
