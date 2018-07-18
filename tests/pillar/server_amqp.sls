statsd:
  server:
    enabled: true
    bind:
      port: 8125
      address: 0.0.0.0
    backend:
      engine: amqp
      host: metrics1.domain.com
      port: 5672