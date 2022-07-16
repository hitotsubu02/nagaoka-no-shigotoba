require "administrate/base_dashboard"

class CourseDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    course_category: Field::BelongsTo,
    course_attendance_type: Field::BelongsTo,
    event_date: Field::Date,
    event_start_time: Field::Time,
    deadline: Field::Date,
    place: Field::String,
    target: Field::String,
    acceptable_number: Field::Number,
    others: Field::Text,
    announcement: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    thumbnail: Field::ActiveStorage.with_options(index_display_preview: false),
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    title
    course_category
    created_at
    updated_at
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    title
    description
    course_category
    course_attendance_type
    event_date
    event_start_time
    deadline
    place
    target
    acceptable_number
    others
    announcement
    created_at
    updated_at
    thumbnail
  ].freeze

  FORM_ATTRIBUTES = %i[
    title
    description
    course_category
    course_attendance_type
    event_date
    event_start_time
    deadline
    place
    target
    acceptable_number
    others
    announcement
    thumbnail
  ].freeze

  COLLECTION_FILTERS = {}.freeze

  def display_resource(resource)
    "##{resource.id} #{resource.title}"
  end
end
