require "administrate/base_dashboard"

class CompanyDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    business_category: Field::BelongsTo,
    employees: Field::HasMany,
    internships: Field::HasMany,
    video: Field::ActiveStorage.with_options(index_display_preview: false),
    id: Field::Number,
    name: Field::String,
    company_url: Field::String,
    phone_number: Field::String,
    address: Field::String,
    business_description: Field::Text,
    number_of_employee: Field::Number,
    manager_name: Field::String,
    manager_email: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    name
    created_at
    updated_at
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    name
    company_url
    phone_number
    address
    business_description
    number_of_employee
    manager_name
    manager_email
    video
    created_at
    updated_at
    business_category
    employees
    internships
  ].freeze

  FORM_ATTRIBUTES = %i[
    name
    company_url
    phone_number
    address
    business_description
    number_of_employee
    manager_name
    manager_email
    video
    business_category
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end