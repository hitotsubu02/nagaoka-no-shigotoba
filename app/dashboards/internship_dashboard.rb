require "administrate/base_dashboard"

class InternshipDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    company: Field::BelongsTo,
    thumbnail: Field::ActiveStorage.with_options(index_display_preview: false),
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    start_date: Field::Date,
    end_date: Field::Date,
    deadline: Field::Date,
    location: Field::String,
    target: Field::String,
    acceptable_number: Field::Number,
    others: Field::Text,
    gif_url: Field::String,
    is_public: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    title
    company
    created_at
    updated_at
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    title
    company
    description
    start_date
    end_date
    deadline
    location
    target
    thumbnail
    acceptable_number
    others
    gif_url
    is_public
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    title
    company
    description
    start_date
    end_date
    deadline
    location
    target
    thumbnail
    acceptable_number
    others
    gif_url
    is_public
  ].freeze

  COLLECTION_FILTERS = {}.freeze

  def display_resource(resource)
    "##{resource.id} #{resource.title}"
  end
end
