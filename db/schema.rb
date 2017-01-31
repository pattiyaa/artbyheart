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

ActiveRecord::Schema.define(version: 20170131120956) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.integer  "login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "profile"
    t.string   "subtitle"
  end

  create_table "authors_skills", force: :cascade do |t|
    t.integer "author_id"
    t.integer "skill_id"
    t.index ["author_id"], name: "index_authors_skills_on_author_id", using: :btree
    t.index ["skill_id"], name: "index_authors_skills_on_skill_id", using: :btree
  end

  create_table "availabletimes", force: :cascade do |t|
    t.datetime "from",                     null: false
    t.datetime "to"
    t.integer  "resource_id"
    t.string   "resource_type", limit: 30
    t.string   "type",          limit: 30
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["resource_type", "resource_id"], name: "idx_availabletime_resource", using: :btree
    t.index ["resource_type", "type", "resource_id"], name: "idx_availabletime_resource_type", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree
  end

  create_table "ckeditor_assets_projects", id: false, force: :cascade do |t|
    t.integer "project_id"
    t.integer "picture_id"
    t.index ["picture_id"], name: "index_ckeditor_assets_projects_on_picture_id", using: :btree
    t.index ["project_id"], name: "index_ckeditor_assets_projects_on_project_id", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "post_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "cover_img"
    t.integer  "post_category_id"
    t.text     "content"
    t.boolean  "active"
    t.integer  "author_id"
    t.boolean  "isHighlight"
    t.boolean  "isToplist"
    t.datetime "published_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "slug"
    t.index ["author_id"], name: "index_posts_on_author_id", using: :btree
    t.index ["post_category_id"], name: "index_posts_on_post_category_id", using: :btree
    t.index ["slug"], name: "index_posts_on_slug", unique: true, using: :btree
  end

  create_table "posts_tags", id: false, force: :cascade do |t|
    t.integer "post_id"
    t.integer "tag_id"
    t.index ["post_id"], name: "index_posts_tags_on_post_id", using: :btree
    t.index ["tag_id"], name: "index_posts_tags_on_tag_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "author_id"
    t.index ["author_id"], name: "index_projects_on_author_id", using: :btree
  end

  create_table "skill_sets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.integer  "skill_set_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["skill_set_id"], name: "index_skills_on_skill_set_id", using: :btree
  end

  create_table "spree_addresses", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "zipcode"
    t.string   "phone"
    t.string   "state_name"
    t.string   "alternative_phone"
    t.string   "company"
    t.integer  "state_id"
    t.integer  "country_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["country_id"], name: "index_spree_addresses_on_country_id", using: :btree
    t.index ["firstname"], name: "index_addresses_on_firstname", using: :btree
    t.index ["lastname"], name: "index_addresses_on_lastname", using: :btree
    t.index ["state_id"], name: "index_spree_addresses_on_state_id", using: :btree
  end

  create_table "spree_adjustments", force: :cascade do |t|
    t.string   "source_type"
    t.integer  "source_id"
    t.string   "adjustable_type"
    t.integer  "adjustable_id"
    t.decimal  "amount",          precision: 10, scale: 2
    t.string   "label"
    t.boolean  "mandatory"
    t.boolean  "eligible",                                 default: true
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "state"
    t.integer  "order_id"
    t.boolean  "included",                                 default: false
    t.index ["adjustable_id", "adjustable_type"], name: "index_spree_adjustments_on_adjustable_id_and_adjustable_type", using: :btree
    t.index ["adjustable_id"], name: "index_adjustments_on_order_id", using: :btree
    t.index ["eligible"], name: "index_spree_adjustments_on_eligible", using: :btree
    t.index ["order_id"], name: "index_spree_adjustments_on_order_id", using: :btree
    t.index ["source_id", "source_type"], name: "index_spree_adjustments_on_source_id_and_source_type", using: :btree
  end

  create_table "spree_assets", force: :cascade do |t|
    t.string   "viewable_type"
    t.integer  "viewable_id"
    t.integer  "attachment_width"
    t.integer  "attachment_height"
    t.integer  "attachment_file_size"
    t.integer  "position"
    t.string   "attachment_content_type"
    t.string   "attachment_file_name"
    t.string   "type",                    limit: 75
    t.datetime "attachment_updated_at"
    t.text     "alt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["viewable_id"], name: "index_assets_on_viewable_id", using: :btree
    t.index ["viewable_type", "type"], name: "index_assets_on_viewable_type_and_type", using: :btree
  end

  create_table "spree_calculators", force: :cascade do |t|
    t.string   "type"
    t.string   "calculable_type"
    t.integer  "calculable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "preferences"
    t.index ["calculable_id", "calculable_type"], name: "index_spree_calculators_on_calculable_id_and_calculable_type", using: :btree
    t.index ["id", "type"], name: "index_spree_calculators_on_id_and_type", using: :btree
  end

  create_table "spree_configurations", force: :cascade do |t|
    t.string   "name"
    t.string   "type",       limit: 50
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["name", "type"], name: "index_spree_configurations_on_name_and_type", using: :btree
  end

  create_table "spree_countries", force: :cascade do |t|
    t.string   "iso_name"
    t.string   "iso"
    t.string   "iso3"
    t.string   "name"
    t.integer  "numcode"
    t.boolean  "states_required", default: false
    t.datetime "updated_at"
  end

  create_table "spree_credit_cards", force: :cascade do |t|
    t.string   "month"
    t.string   "year"
    t.string   "cc_type"
    t.string   "last_digits"
    t.integer  "address_id"
    t.string   "gateway_customer_profile_id"
    t.string   "gateway_payment_profile_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "name"
    t.integer  "user_id"
    t.integer  "payment_method_id"
    t.index ["address_id"], name: "index_spree_credit_cards_on_address_id", using: :btree
    t.index ["payment_method_id"], name: "index_spree_credit_cards_on_payment_method_id", using: :btree
    t.index ["user_id"], name: "index_spree_credit_cards_on_user_id", using: :btree
  end

  create_table "spree_customer_returns", force: :cascade do |t|
    t.string   "number"
    t.integer  "stock_location_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "spree_gateways", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      default: true
    t.string   "environment", default: "development"
    t.string   "server",      default: "test"
    t.boolean  "test_mode",   default: true
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.text     "preferences"
    t.index ["active"], name: "index_spree_gateways_on_active", using: :btree
    t.index ["test_mode"], name: "index_spree_gateways_on_test_mode", using: :btree
  end

  create_table "spree_inventory_units", force: :cascade do |t|
    t.string   "state"
    t.integer  "variant_id"
    t.integer  "order_id"
    t.integer  "shipment_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "pending",      default: true
    t.integer  "line_item_id"
    t.index ["line_item_id"], name: "index_spree_inventory_units_on_line_item_id", using: :btree
    t.index ["order_id"], name: "index_inventory_units_on_order_id", using: :btree
    t.index ["shipment_id"], name: "index_inventory_units_on_shipment_id", using: :btree
    t.index ["variant_id"], name: "index_inventory_units_on_variant_id", using: :btree
  end

  create_table "spree_line_items", force: :cascade do |t|
    t.integer  "variant_id"
    t.integer  "order_id"
    t.integer  "quantity",                                                      null: false
    t.decimal  "price",                precision: 10, scale: 2,                 null: false
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.string   "currency"
    t.decimal  "cost_price",           precision: 10, scale: 2
    t.integer  "tax_category_id"
    t.decimal  "adjustment_total",     precision: 10, scale: 2, default: "0.0"
    t.decimal  "additional_tax_total", precision: 10, scale: 2, default: "0.0"
    t.decimal  "promo_total",          precision: 10, scale: 2, default: "0.0"
    t.decimal  "included_tax_total",   precision: 10, scale: 2, default: "0.0", null: false
    t.decimal  "pre_tax_amount",       precision: 8,  scale: 2
    t.index ["order_id"], name: "index_spree_line_items_on_order_id", using: :btree
    t.index ["tax_category_id"], name: "index_spree_line_items_on_tax_category_id", using: :btree
    t.index ["variant_id"], name: "index_spree_line_items_on_variant_id", using: :btree
  end

  create_table "spree_log_entries", force: :cascade do |t|
    t.string   "source_type"
    t.integer  "source_id"
    t.text     "details"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["source_id", "source_type"], name: "index_spree_log_entries_on_source_id_and_source_type", using: :btree
  end

  create_table "spree_option_types", force: :cascade do |t|
    t.string   "name",         limit: 100
    t.string   "presentation", limit: 100
    t.integer  "position",                 default: 0, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["position"], name: "index_spree_option_types_on_position", using: :btree
  end

  create_table "spree_option_types_prototypes", id: false, force: :cascade do |t|
    t.integer "prototype_id"
    t.integer "option_type_id"
  end

  create_table "spree_option_values", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "presentation"
    t.integer  "option_type_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["option_type_id"], name: "index_spree_option_values_on_option_type_id", using: :btree
    t.index ["position"], name: "index_spree_option_values_on_position", using: :btree
  end

  create_table "spree_option_values_variants", id: false, force: :cascade do |t|
    t.integer "variant_id"
    t.integer "option_value_id"
    t.index ["variant_id", "option_value_id"], name: "index_option_values_variants_on_variant_id_and_option_value_id", using: :btree
    t.index ["variant_id"], name: "index_spree_option_values_variants_on_variant_id", using: :btree
  end

  create_table "spree_orders", force: :cascade do |t|
    t.string   "number",                 limit: 32
    t.decimal  "item_total",                        precision: 10, scale: 2, default: "0.0",   null: false
    t.decimal  "total",                             precision: 10, scale: 2, default: "0.0",   null: false
    t.string   "state"
    t.decimal  "adjustment_total",                  precision: 10, scale: 2, default: "0.0",   null: false
    t.integer  "user_id"
    t.datetime "completed_at"
    t.integer  "bill_address_id"
    t.integer  "ship_address_id"
    t.decimal  "payment_total",                     precision: 10, scale: 2, default: "0.0"
    t.integer  "shipping_method_id"
    t.string   "shipment_state"
    t.string   "payment_state"
    t.string   "email"
    t.text     "special_instructions"
    t.datetime "created_at",                                                                   null: false
    t.datetime "updated_at",                                                                   null: false
    t.string   "currency"
    t.string   "last_ip_address"
    t.integer  "created_by_id"
    t.decimal  "shipment_total",                    precision: 10, scale: 2, default: "0.0",   null: false
    t.decimal  "additional_tax_total",              precision: 10, scale: 2, default: "0.0"
    t.decimal  "promo_total",                       precision: 10, scale: 2, default: "0.0"
    t.string   "channel",                                                    default: "spree"
    t.decimal  "included_tax_total",                precision: 10, scale: 2, default: "0.0",   null: false
    t.integer  "item_count",                                                 default: 0
    t.integer  "approver_id"
    t.datetime "approved_at"
    t.boolean  "confirmation_delivered",                                     default: false
    t.boolean  "considered_risky",                                           default: false
    t.string   "guest_token"
    t.index ["approver_id"], name: "index_spree_orders_on_approver_id", using: :btree
    t.index ["bill_address_id"], name: "index_spree_orders_on_bill_address_id", using: :btree
    t.index ["completed_at"], name: "index_spree_orders_on_completed_at", using: :btree
    t.index ["confirmation_delivered"], name: "index_spree_orders_on_confirmation_delivered", using: :btree
    t.index ["considered_risky"], name: "index_spree_orders_on_considered_risky", using: :btree
    t.index ["created_by_id"], name: "index_spree_orders_on_created_by_id", using: :btree
    t.index ["number"], name: "index_spree_orders_on_number", using: :btree
    t.index ["ship_address_id"], name: "index_spree_orders_on_ship_address_id", using: :btree
    t.index ["shipping_method_id"], name: "index_spree_orders_on_shipping_method_id", using: :btree
    t.index ["user_id", "created_by_id"], name: "index_spree_orders_on_user_id_and_created_by_id", using: :btree
    t.index ["user_id"], name: "index_spree_orders_on_user_id", using: :btree
  end

  create_table "spree_orders_promotions", id: false, force: :cascade do |t|
    t.integer "order_id"
    t.integer "promotion_id"
    t.index ["order_id", "promotion_id"], name: "index_spree_orders_promotions_on_order_id_and_promotion_id", using: :btree
  end

  create_table "spree_payment_capture_events", force: :cascade do |t|
    t.decimal  "amount",     precision: 10, scale: 2, default: "0.0"
    t.integer  "payment_id"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.index ["payment_id"], name: "index_spree_payment_capture_events_on_payment_id", using: :btree
  end

  create_table "spree_payment_methods", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",       default: true
    t.string   "environment",  default: "development"
    t.datetime "deleted_at"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "display_on"
    t.boolean  "auto_capture"
    t.text     "preferences"
    t.index ["id", "type"], name: "index_spree_payment_methods_on_id_and_type", using: :btree
  end

  create_table "spree_payments", force: :cascade do |t|
    t.decimal  "amount",               precision: 10, scale: 2, default: "0.0", null: false
    t.integer  "order_id"
    t.string   "source_type"
    t.integer  "source_id"
    t.integer  "payment_method_id"
    t.string   "state"
    t.string   "response_code"
    t.string   "avs_response"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.string   "identifier"
    t.string   "cvv_response_code"
    t.string   "cvv_response_message"
    t.index ["order_id"], name: "index_spree_payments_on_order_id", using: :btree
    t.index ["payment_method_id"], name: "index_spree_payments_on_payment_method_id", using: :btree
    t.index ["source_id", "source_type"], name: "index_spree_payments_on_source_id_and_source_type", using: :btree
  end

  create_table "spree_preferences", force: :cascade do |t|
    t.text     "value"
    t.string   "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_spree_preferences_on_key", unique: true, using: :btree
  end

  create_table "spree_prices", force: :cascade do |t|
    t.integer  "variant_id",                          null: false
    t.decimal  "amount",     precision: 10, scale: 2
    t.string   "currency"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_spree_prices_on_deleted_at", using: :btree
    t.index ["variant_id", "currency"], name: "index_spree_prices_on_variant_id_and_currency", using: :btree
  end

  create_table "spree_product_option_types", force: :cascade do |t|
    t.integer  "position"
    t.integer  "product_id"
    t.integer  "option_type_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["option_type_id"], name: "index_spree_product_option_types_on_option_type_id", using: :btree
    t.index ["position"], name: "index_spree_product_option_types_on_position", using: :btree
    t.index ["product_id"], name: "index_spree_product_option_types_on_product_id", using: :btree
  end

  create_table "spree_product_properties", force: :cascade do |t|
    t.string   "value"
    t.integer  "product_id"
    t.integer  "property_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "position",    default: 0
    t.index ["position"], name: "index_spree_product_properties_on_position", using: :btree
    t.index ["product_id"], name: "index_product_properties_on_product_id", using: :btree
    t.index ["property_id"], name: "index_spree_product_properties_on_property_id", using: :btree
  end

  create_table "spree_products", force: :cascade do |t|
    t.string   "name",                 default: "", null: false
    t.text     "description"
    t.datetime "available_on"
    t.datetime "deleted_at"
    t.string   "slug"
    t.text     "meta_description"
    t.string   "meta_keywords"
    t.integer  "tax_category_id"
    t.integer  "shipping_category_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["available_on"], name: "index_spree_products_on_available_on", using: :btree
    t.index ["deleted_at"], name: "index_spree_products_on_deleted_at", using: :btree
    t.index ["name"], name: "index_spree_products_on_name", using: :btree
    t.index ["shipping_category_id"], name: "index_spree_products_on_shipping_category_id", using: :btree
    t.index ["slug"], name: "index_spree_products_on_slug", using: :btree
    t.index ["slug"], name: "permalink_idx_unique", unique: true, using: :btree
    t.index ["tax_category_id"], name: "index_spree_products_on_tax_category_id", using: :btree
  end

  create_table "spree_products_promotion_rules", id: false, force: :cascade do |t|
    t.integer "product_id"
    t.integer "promotion_rule_id"
    t.index ["product_id"], name: "index_products_promotion_rules_on_product_id", using: :btree
    t.index ["promotion_rule_id"], name: "index_products_promotion_rules_on_promotion_rule_id", using: :btree
  end

  create_table "spree_products_taxons", force: :cascade do |t|
    t.integer "product_id"
    t.integer "taxon_id"
    t.integer "position"
    t.index ["position"], name: "index_spree_products_taxons_on_position", using: :btree
    t.index ["product_id"], name: "index_spree_products_taxons_on_product_id", using: :btree
    t.index ["taxon_id"], name: "index_spree_products_taxons_on_taxon_id", using: :btree
  end

  create_table "spree_promotion_action_line_items", force: :cascade do |t|
    t.integer "promotion_action_id"
    t.integer "variant_id"
    t.integer "quantity",            default: 1
    t.index ["promotion_action_id"], name: "index_spree_promotion_action_line_items_on_promotion_action_id", using: :btree
    t.index ["variant_id"], name: "index_spree_promotion_action_line_items_on_variant_id", using: :btree
  end

  create_table "spree_promotion_actions", force: :cascade do |t|
    t.integer  "promotion_id"
    t.integer  "position"
    t.string   "type"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_spree_promotion_actions_on_deleted_at", using: :btree
    t.index ["id", "type"], name: "index_spree_promotion_actions_on_id_and_type", using: :btree
    t.index ["promotion_id"], name: "index_spree_promotion_actions_on_promotion_id", using: :btree
  end

  create_table "spree_promotion_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spree_promotion_rules", force: :cascade do |t|
    t.integer  "promotion_id"
    t.integer  "user_id"
    t.integer  "product_group_id"
    t.string   "type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "code"
    t.text     "preferences"
    t.index ["product_group_id"], name: "index_promotion_rules_on_product_group_id", using: :btree
    t.index ["promotion_id"], name: "index_spree_promotion_rules_on_promotion_id", using: :btree
    t.index ["user_id"], name: "index_promotion_rules_on_user_id", using: :btree
  end

  create_table "spree_promotion_rules_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "promotion_rule_id"
    t.index ["promotion_rule_id"], name: "index_promotion_rules_users_on_promotion_rule_id", using: :btree
    t.index ["user_id"], name: "index_promotion_rules_users_on_user_id", using: :btree
  end

  create_table "spree_promotions", force: :cascade do |t|
    t.string   "description"
    t.datetime "expires_at"
    t.datetime "starts_at"
    t.string   "name"
    t.string   "type"
    t.integer  "usage_limit"
    t.string   "match_policy",          default: "all"
    t.string   "code"
    t.boolean  "advertise",             default: false
    t.string   "path"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "promotion_category_id"
    t.index ["advertise"], name: "index_spree_promotions_on_advertise", using: :btree
    t.index ["code"], name: "index_spree_promotions_on_code", using: :btree
    t.index ["expires_at"], name: "index_spree_promotions_on_expires_at", using: :btree
    t.index ["id", "type"], name: "index_spree_promotions_on_id_and_type", using: :btree
    t.index ["promotion_category_id"], name: "index_spree_promotions_on_promotion_category_id", using: :btree
    t.index ["starts_at"], name: "index_spree_promotions_on_starts_at", using: :btree
  end

  create_table "spree_properties", force: :cascade do |t|
    t.string   "name"
    t.string   "presentation", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "spree_properties_prototypes", id: false, force: :cascade do |t|
    t.integer "prototype_id"
    t.integer "property_id"
  end

  create_table "spree_prototypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spree_refund_reasons", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active",     default: true
    t.boolean  "mutable",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "spree_refunds", force: :cascade do |t|
    t.integer  "payment_id"
    t.integer  "return_authorization_id"
    t.decimal  "amount",                  precision: 10, scale: 2, default: "0.0", null: false
    t.string   "transaction_id"
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.integer  "refund_reason_id"
    t.index ["refund_reason_id"], name: "index_refunds_on_refund_reason_id", using: :btree
  end

  create_table "spree_return_authorization_reasons", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active",     default: true
    t.boolean  "mutable",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "spree_return_authorizations", force: :cascade do |t|
    t.string   "number"
    t.string   "state"
    t.integer  "order_id"
    t.text     "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stock_location_id"
    t.integer  "return_authorization_reason_id"
    t.index ["return_authorization_reason_id"], name: "index_return_authorizations_on_return_authorization_reason_id", using: :btree
  end

  create_table "spree_return_items", force: :cascade do |t|
    t.integer  "return_authorization_id"
    t.integer  "inventory_unit_id"
    t.integer  "exchange_variant_id"
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.decimal  "pre_tax_amount",          precision: 10, scale: 2, default: "0.0", null: false
    t.decimal  "included_tax_total",      precision: 10, scale: 2, default: "0.0", null: false
    t.decimal  "additional_tax_total",    precision: 10, scale: 2, default: "0.0", null: false
    t.string   "reception_status"
    t.string   "acceptance_status"
    t.integer  "customer_return_id"
    t.index ["customer_return_id"], name: "index_return_items_on_customer_return_id", using: :btree
  end

  create_table "spree_roles", force: :cascade do |t|
    t.string "name"
  end

  create_table "spree_roles_users", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
    t.index ["role_id"], name: "index_spree_roles_users_on_role_id", using: :btree
    t.index ["user_id"], name: "index_spree_roles_users_on_user_id", using: :btree
  end

  create_table "spree_shipments", force: :cascade do |t|
    t.string   "tracking"
    t.string   "number"
    t.decimal  "cost",                 precision: 8,  scale: 2
    t.datetime "shipped_at"
    t.integer  "order_id"
    t.integer  "address_id"
    t.string   "state"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.integer  "stock_location_id"
    t.decimal  "adjustment_total",     precision: 10, scale: 2, default: "0.0"
    t.decimal  "additional_tax_total", precision: 10, scale: 2, default: "0.0"
    t.decimal  "promo_total",          precision: 10, scale: 2, default: "0.0"
    t.decimal  "included_tax_total",   precision: 10, scale: 2, default: "0.0", null: false
    t.decimal  "pre_tax_amount",       precision: 8,  scale: 2
    t.index ["address_id"], name: "index_spree_shipments_on_address_id", using: :btree
    t.index ["number"], name: "index_shipments_on_number", using: :btree
    t.index ["order_id"], name: "index_spree_shipments_on_order_id", using: :btree
    t.index ["stock_location_id"], name: "index_spree_shipments_on_stock_location_id", using: :btree
  end

  create_table "spree_shipping_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spree_shipping_method_categories", force: :cascade do |t|
    t.integer  "shipping_method_id",   null: false
    t.integer  "shipping_category_id", null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["shipping_category_id", "shipping_method_id"], name: "unique_spree_shipping_method_categories", unique: true, using: :btree
    t.index ["shipping_method_id"], name: "index_spree_shipping_method_categories_on_shipping_method_id", using: :btree
  end

  create_table "spree_shipping_methods", force: :cascade do |t|
    t.string   "name"
    t.string   "display_on"
    t.datetime "deleted_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "tracking_url"
    t.string   "admin_name"
    t.integer  "tax_category_id"
    t.index ["deleted_at"], name: "index_spree_shipping_methods_on_deleted_at", using: :btree
    t.index ["tax_category_id"], name: "index_spree_shipping_methods_on_tax_category_id", using: :btree
  end

  create_table "spree_shipping_methods_zones", id: false, force: :cascade do |t|
    t.integer "shipping_method_id"
    t.integer "zone_id"
  end

  create_table "spree_shipping_rates", force: :cascade do |t|
    t.integer  "shipment_id"
    t.integer  "shipping_method_id"
    t.boolean  "selected",                                   default: false
    t.decimal  "cost",               precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.integer  "tax_rate_id"
    t.index ["selected"], name: "index_spree_shipping_rates_on_selected", using: :btree
    t.index ["shipment_id", "shipping_method_id"], name: "spree_shipping_rates_join_index", unique: true, using: :btree
    t.index ["tax_rate_id"], name: "index_spree_shipping_rates_on_tax_rate_id", using: :btree
  end

  create_table "spree_state_changes", force: :cascade do |t|
    t.string   "name"
    t.string   "previous_state"
    t.integer  "stateful_id"
    t.integer  "user_id"
    t.string   "stateful_type"
    t.string   "next_state"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["stateful_id", "stateful_type"], name: "index_spree_state_changes_on_stateful_id_and_stateful_type", using: :btree
    t.index ["user_id"], name: "index_spree_state_changes_on_user_id", using: :btree
  end

  create_table "spree_states", force: :cascade do |t|
    t.string   "name"
    t.string   "abbr"
    t.integer  "country_id"
    t.datetime "updated_at"
    t.index ["country_id"], name: "index_spree_states_on_country_id", using: :btree
  end

  create_table "spree_stock_items", force: :cascade do |t|
    t.integer  "stock_location_id"
    t.integer  "variant_id"
    t.integer  "count_on_hand",     default: 0,     null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "backorderable",     default: false
    t.datetime "deleted_at"
    t.index ["backorderable"], name: "index_spree_stock_items_on_backorderable", using: :btree
    t.index ["deleted_at"], name: "index_spree_stock_items_on_deleted_at", using: :btree
    t.index ["stock_location_id", "variant_id"], name: "stock_item_by_loc_and_var_id", using: :btree
    t.index ["stock_location_id"], name: "index_spree_stock_items_on_stock_location_id", using: :btree
  end

  create_table "spree_stock_locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "default",                default: false, null: false
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.integer  "state_id"
    t.string   "state_name"
    t.integer  "country_id"
    t.string   "zipcode"
    t.string   "phone"
    t.boolean  "active",                 default: true
    t.boolean  "backorderable_default",  default: false
    t.boolean  "propagate_all_variants", default: true
    t.string   "admin_name"
    t.index ["active"], name: "index_spree_stock_locations_on_active", using: :btree
    t.index ["backorderable_default"], name: "index_spree_stock_locations_on_backorderable_default", using: :btree
    t.index ["country_id"], name: "index_spree_stock_locations_on_country_id", using: :btree
    t.index ["propagate_all_variants"], name: "index_spree_stock_locations_on_propagate_all_variants", using: :btree
    t.index ["state_id"], name: "index_spree_stock_locations_on_state_id", using: :btree
  end

  create_table "spree_stock_movements", force: :cascade do |t|
    t.integer  "stock_item_id"
    t.integer  "quantity",        default: 0
    t.string   "action"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "originator_type"
    t.integer  "originator_id"
    t.index ["stock_item_id"], name: "index_spree_stock_movements_on_stock_item_id", using: :btree
  end

  create_table "spree_stock_transfers", force: :cascade do |t|
    t.string   "type"
    t.string   "reference"
    t.integer  "source_location_id"
    t.integer  "destination_location_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "number"
    t.index ["destination_location_id"], name: "index_spree_stock_transfers_on_destination_location_id", using: :btree
    t.index ["number"], name: "index_spree_stock_transfers_on_number", using: :btree
    t.index ["source_location_id"], name: "index_spree_stock_transfers_on_source_location_id", using: :btree
  end

  create_table "spree_stores", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.text     "meta_description"
    t.text     "meta_keywords"
    t.string   "seo_title"
    t.string   "mail_from_address"
    t.string   "default_currency"
    t.string   "code"
    t.boolean  "default",           default: false, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["code"], name: "index_spree_stores_on_code", using: :btree
    t.index ["default"], name: "index_spree_stores_on_default", using: :btree
    t.index ["url"], name: "index_spree_stores_on_url", using: :btree
  end

  create_table "spree_tax_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "is_default",  default: false
    t.datetime "deleted_at"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["deleted_at"], name: "index_spree_tax_categories_on_deleted_at", using: :btree
    t.index ["is_default"], name: "index_spree_tax_categories_on_is_default", using: :btree
  end

  create_table "spree_tax_rates", force: :cascade do |t|
    t.decimal  "amount",             precision: 8, scale: 5
    t.integer  "zone_id"
    t.integer  "tax_category_id"
    t.boolean  "included_in_price",                          default: false
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.string   "name"
    t.boolean  "show_rate_in_label",                         default: true
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_spree_tax_rates_on_deleted_at", using: :btree
    t.index ["included_in_price"], name: "index_spree_tax_rates_on_included_in_price", using: :btree
    t.index ["show_rate_in_label"], name: "index_spree_tax_rates_on_show_rate_in_label", using: :btree
    t.index ["tax_category_id"], name: "index_spree_tax_rates_on_tax_category_id", using: :btree
    t.index ["zone_id"], name: "index_spree_tax_rates_on_zone_id", using: :btree
  end

  create_table "spree_taxonomies", force: :cascade do |t|
    t.string   "name",                   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "position",   default: 0
    t.index ["position"], name: "index_spree_taxonomies_on_position", using: :btree
  end

  create_table "spree_taxons", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "position",          default: 0
    t.string   "name",                          null: false
    t.string   "permalink"
    t.integer  "taxonomy_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.text     "description"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "meta_title"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.integer  "depth"
    t.index ["parent_id"], name: "index_taxons_on_parent_id", using: :btree
    t.index ["permalink"], name: "index_taxons_on_permalink", using: :btree
    t.index ["position"], name: "index_spree_taxons_on_position", using: :btree
    t.index ["taxonomy_id"], name: "index_taxons_on_taxonomy_id", using: :btree
  end

  create_table "spree_taxons_promotion_rules", force: :cascade do |t|
    t.integer "taxon_id"
    t.integer "promotion_rule_id"
    t.index ["promotion_rule_id"], name: "index_spree_taxons_promotion_rules_on_promotion_rule_id", using: :btree
    t.index ["taxon_id"], name: "index_spree_taxons_promotion_rules_on_taxon_id", using: :btree
  end

  create_table "spree_tokenized_permissions", force: :cascade do |t|
    t.string   "permissable_type"
    t.integer  "permissable_id"
    t.string   "token"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["permissable_id", "permissable_type"], name: "index_tokenized_name_and_type", using: :btree
  end

  create_table "spree_trackers", force: :cascade do |t|
    t.string   "environment"
    t.string   "analytics_id"
    t.boolean  "active",       default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["active"], name: "index_spree_trackers_on_active", using: :btree
  end

  create_table "spree_users", force: :cascade do |t|
    t.string   "encrypted_password",     limit: 128
    t.string   "password_salt",          limit: 128
    t.string   "email"
    t.string   "remember_token"
    t.string   "persistence_token"
    t.string   "reset_password_token"
    t.string   "perishable_token"
    t.integer  "sign_in_count",                      default: 0, null: false
    t.integer  "failed_attempts",                    default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "login"
    t.integer  "ship_address_id"
    t.integer  "bill_address_id"
    t.string   "authentication_token"
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "spree_variants", force: :cascade do |t|
    t.string   "sku",                                      default: "",    null: false
    t.decimal  "weight",          precision: 8,  scale: 2, default: "0.0"
    t.decimal  "height",          precision: 8,  scale: 2
    t.decimal  "width",           precision: 8,  scale: 2
    t.decimal  "depth",           precision: 8,  scale: 2
    t.datetime "deleted_at"
    t.boolean  "is_master",                                default: false
    t.integer  "product_id"
    t.decimal  "cost_price",      precision: 10, scale: 2
    t.integer  "position"
    t.string   "cost_currency"
    t.boolean  "track_inventory",                          default: true
    t.integer  "tax_category_id"
    t.datetime "updated_at"
    t.index ["deleted_at"], name: "index_spree_variants_on_deleted_at", using: :btree
    t.index ["is_master"], name: "index_spree_variants_on_is_master", using: :btree
    t.index ["position"], name: "index_spree_variants_on_position", using: :btree
    t.index ["product_id"], name: "index_spree_variants_on_product_id", using: :btree
    t.index ["sku"], name: "index_spree_variants_on_sku", using: :btree
    t.index ["tax_category_id"], name: "index_spree_variants_on_tax_category_id", using: :btree
    t.index ["track_inventory"], name: "index_spree_variants_on_track_inventory", using: :btree
  end

  create_table "spree_zone_members", force: :cascade do |t|
    t.string   "zoneable_type"
    t.integer  "zoneable_id"
    t.integer  "zone_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["zone_id"], name: "index_spree_zone_members_on_zone_id", using: :btree
    t.index ["zoneable_id", "zoneable_type"], name: "index_spree_zone_members_on_zoneable_id_and_zoneable_type", using: :btree
  end

  create_table "spree_zones", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "default_tax",        default: false
    t.integer  "zone_members_count", default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["default_tax"], name: "index_spree_zones_on_default_tax", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "tempimage"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "workshop_photos", force: :cascade do |t|
    t.integer  "workshop_id"
    t.string   "photo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["workshop_id"], name: "index_workshop_photos_on_workshop_id", using: :btree
  end

  create_table "workshops", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "slung"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.string   "meta_title"
    t.datetime "start"
    t.datetime "finish"
    t.integer  "capacity"
    t.integer  "author_id"
    t.datetime "available_on"
    t.datetime "discontinue_on"
    t.integer  "category_id"
    t.decimal  "price"
    t.decimal  "cost"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["author_id"], name: "index_workshops_on_author_id", using: :btree
    t.index ["category_id"], name: "index_workshops_on_category_id", using: :btree
  end

  add_foreign_key "projects", "authors"
  add_foreign_key "workshop_photos", "workshops"
  add_foreign_key "workshops", "authors"
  add_foreign_key "workshops", "categories"
end
