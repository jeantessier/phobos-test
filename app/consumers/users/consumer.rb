module Users
  class Consumer
    include Phobos::Handler

    def consume(payload, metadata)
      Rails.logger.info "#{self.class.name} #{metadata[:topic]}[#{metadata[:partition]}] offset: #{metadata[:offset]}, headers: #{metadata[:headers]}, key: #{metadata[:key]}, value: #{payload}"
    end
  end
end
