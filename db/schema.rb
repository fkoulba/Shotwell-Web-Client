# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "PhotoTable", force: true do |t|
    t.text    "filename",                          null: false
    t.integer "width"
    t.integer "height"
    t.integer "filesize"
    t.integer "timestamp"
    t.integer "exposure_time"
    t.integer "orientation"
    t.integer "original_orientation"
    t.integer "import_id"
    t.integer "event_id"
    t.text    "transformations"
    t.text    "md5"
    t.text    "thumbnail_md5"
    t.text    "exif_md5"
    t.integer "time_created"
    t.integer "flags",                default: 0
    t.integer "rating",               default: 0
    t.integer "file_format",          default: 0
    t.text    "title"
    t.text    "backlinks"
    t.integer "time_reimported"
    t.integer "editable_id",          default: -1
    t.integer "metadata_dirty",       default: 1
    t.text    "developer"
    t.integer "develop_shotwell_id",  default: -1
    t.integer "develop_camera_id",    default: -1
    t.integer "develop_embedded_id",  default: -1
    t.text    "comment"
  end

  add_index "PhotoTable", ["event_id"], name: "PhotoEventIDIndex"
  add_index "PhotoTable", ["filename"], name: "sqlite_autoindex_PhotoTable_1", unique: true

end
