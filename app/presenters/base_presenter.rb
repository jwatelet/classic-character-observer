class BasePresenter
  def self.map(objects)
    objects.map do |object|
      new(object).data
    end
  end

  def initialize(object)
    @object = object
  end

  def as_json(_options = {})
    data
  end

  def data
    {}
  end
end
