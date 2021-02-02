class GearService
  def self.total_stats(item_ids)
    Item.includes(:tooltip_labels)
        .find(item_ids)
        .map(&:stats)
        .reduce({}) do |sums, stats|
      sums.merge(stats) { |_, a, b| a + b }
    end
  end
end
