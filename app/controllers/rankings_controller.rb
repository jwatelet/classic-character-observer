class RankingsController < ApplicationController
  def index
    @digests = build_digests(params[:character], params[:region], params[:server])
  end

  def build_digests(charecter_name, region, server)
    rankings = WarcraftLogsService.rankings(charecter_name, region, server)
    rankings.map do |ranking|
      item_ids = ranking['gear'].map { |gear| gear['id'] }
                                .compact
                                .reject(&:zero?)
      stats = Item.includes(:tooltip_labels)
                  .find(item_ids)
                  .map(&:stats)

      {
        characterName: ranking['characterName'],
        encounterName: ranking['encounterName'],
        playerClass: ranking['class'],
        spec: ranking['spec'],
        percentile: ranking['percentile'],
        statTotal: stats_total(stats),
        itemIds: item_ids
      }
    end
  end

  def stats_total(stats)
    stats.reduce({}) do |sums, stat|
      sums.merge(stat) { |_, a, b| a + b }
    end
         .except(:durability)
  end
end
