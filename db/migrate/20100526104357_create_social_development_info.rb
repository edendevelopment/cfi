class CreateSocialDevelopmentInfo < ActiveRecord::Migration
  def self.up
    create_table :social_development_infos do |t|
      t.references :person
      t.text :type_of_housing, :permanence_of_housing, :access_to_cfi_school, :seasonal_factors, :support_from_other_organisations, :barriers_to_attending_public_school, :ideas_of_carers_about_education, :other_social_issues_or_dangers, :history_of_abuse, :observations_from_visits
    end
  end

  def self.down
    drop_table :social_development_infos
  end
end
