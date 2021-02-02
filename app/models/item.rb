class Item < ActiveRecord::Base
  has_many :tooltip_labels, dependent: :delete_all

  def stats
    tooltip_labels.map(&:stat_hash)
                  .compact
                  .reduce({}, :merge)
  end

  def stats_total
    stats.reduce({}) do |sums, stat|
      sums.merge(stat) { |_, a, b| a + b }
    end
  end
end
