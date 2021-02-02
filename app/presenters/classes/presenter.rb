module Classes
  class Presenter < BasePresenter
    def data
      {
        name: @object['name'],
        specs: @object['specs'].map { |spec| spec['name'] }.uniq.join(', ')
      }
    end
  end
end
