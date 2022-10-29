class Task < ActiveRecord::Base
  # def self.all_ratings
  #   ['G', 'PG', 'PG-13', 'R']
  # end
  def self.list_tasks(ratings, sort_by)
    if ratings.nil?
      all.order sort_by
    else
      where(rating: ratings.map(&:upcase)).order sort_by
    end
  end
end