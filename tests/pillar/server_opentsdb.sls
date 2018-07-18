statsd:
  server:
    enabled: true
    bind:
      port: 8125
      address: 0.0.0.0
    backend:
      engine: opentsdb
      host: metrics1.domain.com
      port: 2003