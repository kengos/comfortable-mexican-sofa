class Cms::Categorization < ActiveRecord::Base
  
  if ComfortableMexicanSofa.config.database_config && !Rails.env.test?
    establish_connection "#{ComfortableMexicanSofa.config.database_config}_#{Rails.env}"
  end
  
  set_table_name :cms_categorizations
  
  # -- Relationships --------------------------------------------------------
  belongs_to :category
  belongs_to :categorized,
    :polymorphic => true
    
  # -- Validations ----------------------------------------------------------
  validates :categorized_type, :categorized_id,
    :presence   => true
  validates :category_id,
    :presence   => true,
    :uniqueness => { :scope => [:categorized_type, :categorized_id] }
  
end
