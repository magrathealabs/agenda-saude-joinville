return if defined?(Rails::Console) || !Rails.env.production?

Thread.new do
  create_slot = lambda { |attributes| Appointment.create(attributes) }

  generation_service = TimeSlotGenerationService.new(create_slot: create_slot)

  worker = TimeSlotGenerationWorker.new(
    time_slot_generation_service: generation_service
  )

  worker_options = TimeSlotGenerationWorker::Options.new(
    sleep_interval: ENV['TIMESLOTGEN_SLEEP_INTERVAL_SECONDS']&.to_i&.seconds,
    execution_hour: ENV['TIMESLOTGEN_EXECUTION_HOUR']&.to_i,
    max_appointment_time_ahead: ENV['MAX_APPOINTMENT_DAYS_AHEAD']&.to_i&.days
  )

  Rails.logger.info('Time slot generation worker started')

  worker.execute(options: worker_options)
end
