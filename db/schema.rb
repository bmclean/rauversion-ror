# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_24_060927) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "commentable_type", null: false
    t.bigint "commentable_id", null: false
    t.bigint "user_id", null: false
    t.text "body"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "event_hosts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "event_id", null: false
    t.bigint "user_id", null: false
    t.boolean "listed_on_page"
    t.boolean "event_manager"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_hosts_on_event_id"
    t.index ["user_id"], name: "index_event_hosts_on_user_id"
  end

  create_table "event_recordings", force: :cascade do |t|
    t.string "type"
    t.string "title"
    t.text "description"
    t.text "iframe"
    t.jsonb "properties"
    t.integer "position"
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_recordings_on_event_id"
  end

  create_table "event_schedules", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "schedule_type"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_schedules_on_event_id"
  end

  create_table "event_tickets", force: :cascade do |t|
    t.string "title"
    t.decimal "price"
    t.decimal "early_bird_price"
    t.decimal "standard_price"
    t.integer "qty"
    t.datetime "selling_start"
    t.datetime "selling_end"
    t.string "short_description"
    t.jsonb "settings"
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_tickets_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "slug"
    t.string "state"
    t.string "timezone"
    t.datetime "event_start"
    t.datetime "event_ends"
    t.boolean "private"
    t.boolean "online"
    t.string "location"
    t.string "street"
    t.string "street_number"
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
    t.string "venue"
    t.string "country"
    t.string "city"
    t.string "province"
    t.string "postal"
    t.string "age_requirement"
    t.boolean "event_capacity"
    t.integer "event_capacity_limit"
    t.boolean "eticket"
    t.boolean "will_call"
    t.jsonb "order_form"
    t.jsonb "widget_button"
    t.string "event_short_link"
    t.jsonb "tax_rates_settings"
    t.jsonb "attendee_list_settings"
    t.jsonb "scheduling_settings"
    t.jsonb "event_settings"
    t.jsonb "tickets"
    t.bigint "user_id", null: false
    t.jsonb "streaming_service"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.string "follower_type"
    t.integer "follower_id"
    t.string "followable_type"
    t.integer "followable_id"
    t.datetime "created_at"
    t.index ["followable_id", "followable_type"], name: "fk_followables"
    t.index ["follower_id", "follower_type"], name: "fk_follows"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "likes", force: :cascade do |t|
    t.string "liker_type"
    t.integer "liker_id"
    t.string "likeable_type"
    t.integer "likeable_id"
    t.datetime "created_at"
    t.index ["likeable_id", "likeable_type"], name: "fk_likeables"
    t.index ["liker_id", "liker_type"], name: "fk_likes"
  end

  create_table "listening_events", force: :cascade do |t|
    t.string "remote_ip"
    t.string "country"
    t.string "city"
    t.string "ua"
    t.string "lang"
    t.string "referer"
    t.string "utm_medium"
    t.string "utm_source"
    t.string "utm_campaign"
    t.string "utm_content"
    t.string "utm_term"
    t.string "browser_name"
    t.string "browser_version"
    t.string "modern"
    t.string "platform"
    t.string "device_type"
    t.boolean "bot"
    t.boolean "search_engine"
    t.integer "resource_profile_id"
    t.integer "user_id"
    t.integer "track_id"
    t.integer "playlist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentions", force: :cascade do |t|
    t.string "mentioner_type"
    t.integer "mentioner_id"
    t.string "mentionable_type"
    t.integer "mentionable_id"
    t.datetime "created_at"
    t.index ["mentionable_id", "mentionable_type"], name: "fk_mentionables"
    t.index ["mentioner_id", "mentioner_type"], name: "fk_mentions"
  end

  create_table "oauth_credentials", force: :cascade do |t|
    t.string "uid"
    t.string "token"
    t.jsonb "data"
    t.string "provider"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_oauth_credentials_on_user_id"
  end

  create_table "plain_conversations", force: :cascade do |t|
    t.string "subject"
    t.datetime "pinned_at"
    t.boolean "pinned"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plain_messages", force: :cascade do |t|
    t.string "role"
    t.text "content"
    t.bigint "plain_conversation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plain_conversation_id"], name: "index_plain_messages_on_plain_conversation_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.string "slug"
    t.text "description"
    t.jsonb "metadata"
    t.boolean "private"
    t.string "playlist_type"
    t.datetime "release_date"
    t.string "genre"
    t.string "custom_genre"
    t.integer "likes_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tags", default: [], array: true
    t.index ["slug"], name: "index_playlists_on_slug"
    t.index ["tags"], name: "index_playlists_on_tags", using: :gin
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.jsonb "body"
    t.jsonb "settings"
    t.boolean "private"
    t.text "excerpt"
    t.string "title"
    t.string "slug"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_posts_on_category_id"
    t.index ["slug"], name: "index_posts_on_slug"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "preview_cards", force: :cascade do |t|
    t.string "url"
    t.string "title"
    t.text "description"
    t.string "type"
    t.string "author_name"
    t.string "author_url"
    t.text "html"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchased_items", force: :cascade do |t|
    t.bigint "purchase_id", null: false
    t.string "purchased_item_type", null: false
    t.bigint "purchased_item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.boolean "checked_in"
    t.datetime "checked_in_at"
    t.index ["checked_in"], name: "index_purchased_items_on_checked_in"
    t.index ["purchase_id"], name: "index_purchased_items_on_purchase_id"
    t.index ["purchased_item_type", "purchased_item_id"], name: "index_purchased_items_on_purchased_item"
    t.index ["state"], name: "index_purchased_items_on_state"
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.string "checkout_type"
    t.string "checkout_id"
    t.string "purchasable_type"
    t.bigint "purchasable_id"
    t.decimal "price"
    t.index ["checkout_type"], name: "index_purchases_on_checkout_type"
    t.index ["purchasable_type", "purchasable_id"], name: "index_purchases_on_purchasable_type_and_purchasable_id"
    t.index ["state"], name: "index_purchases_on_state"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "reposts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "track_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["track_id"], name: "index_reposts_on_track_id"
    t.index ["user_id"], name: "index_reposts_on_user_id"
  end

  create_table "schedule_schedulings", force: :cascade do |t|
    t.bigint "event_schedule_id", null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "name"
    t.string "short_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_schedule_id"], name: "index_schedule_schedulings_on_event_schedule_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "title"
    t.decimal "price"
    t.decimal "early_bird_price"
    t.decimal "standard_price"
    t.integer "qty"
    t.datetime "selling_start"
    t.datetime "selling_end"
    t.string "short_description"
    t.jsonb "settings"
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_tickets_on_event_id"
  end

  create_table "track_comments", force: :cascade do |t|
    t.bigint "track_id", null: false
    t.string "body"
    t.integer "track_minute"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["track_id"], name: "index_track_comments_on_track_id"
    t.index ["user_id"], name: "index_track_comments_on_user_id"
  end

  create_table "track_playlists", force: :cascade do |t|
    t.bigint "track_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "playlist_id", null: false
    t.index ["playlist_id"], name: "index_track_playlists_on_playlist_id"
    t.index ["track_id"], name: "index_track_playlists_on_track_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "title"
    t.boolean "private"
    t.string "slug"
    t.string "caption"
    t.bigint "user_id", null: false
    t.jsonb "notification_settings"
    t.jsonb "metadata"
    t.integer "likes_count"
    t.integer "reposts_count"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "genre"
    t.string "tags", default: [], array: true
    t.index ["slug"], name: "index_tracks_on_slug"
    t.index ["tags"], name: "index_tracks_on_tags", using: :gin
    t.index ["user_id"], name: "index_tracks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.boolean "label"
    t.string "support_link"
    t.string "first_name"
    t.string "last_name"
    t.string "country"
    t.string "city"
    t.text "bio"
    t.jsonb "settings"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.jsonb "notification_settings"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "users"
  add_foreign_key "event_hosts", "events"
  add_foreign_key "event_hosts", "users"
  add_foreign_key "event_recordings", "events"
  add_foreign_key "event_schedules", "events"
  add_foreign_key "event_tickets", "events"
  add_foreign_key "events", "users"
  add_foreign_key "oauth_credentials", "users"
  add_foreign_key "plain_messages", "plain_conversations"
  add_foreign_key "playlists", "users"
  add_foreign_key "posts", "categories"
  add_foreign_key "posts", "users"
  add_foreign_key "purchased_items", "purchases"
  add_foreign_key "purchases", "users"
  add_foreign_key "reposts", "tracks"
  add_foreign_key "reposts", "users"
  add_foreign_key "schedule_schedulings", "event_schedules"
  add_foreign_key "tickets", "events"
  add_foreign_key "track_comments", "tracks"
  add_foreign_key "track_comments", "users"
  add_foreign_key "track_playlists", "playlists"
  add_foreign_key "track_playlists", "tracks"
  add_foreign_key "tracks", "users"
end
