module Rankings
  class Presenter < BasePresenter
    def initialize(ranking, gear_total)
      super
      @ranking = ranking
      @gear_total = gear_total
    end
  end
end
