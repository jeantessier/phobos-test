module Users
  class Consumer
    include Phobos::Handler

    def consume(payload, metadata)
      Rails.logger.info "metadata: #{metadata}"
      Rails.logger.info "payload: #{payload}"
      # Rails.logger.info "#{metadata.topic}[#{metadata.partition}] offset: #{metadata.offset}, headers: #{metadata.headers}, key: #{metadata.key}, value: #{payload}"
    end
  end
end
