class ClassesController < ApplicationController
  WOW_ALLIANCE_CLASSIC_CLASSES_IDS = [2, 3, 4, 6, 7, 8, 10, 11].freeze

  def index
    classes = WarcraftLogsService.classes.select { |classe| WOW_ALLIANCE_CLASSIC_CLASSES_IDS.include?(classe['id']) }
    @classes = Classes::Presenter.map(classes)
  end
end
