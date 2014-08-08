
# Statsd

## Sample pillars

Standalone Statsd server with Graphite/carbon backend

    statsd:
      server:
        enabled: true
        bind:
          port: 8125
          address: 0.0.0.0
        backend:
          engine: carbon
          host: metrics1.domain.com
          port: 2003

Standalone Statsd server with Graphite/AMQP backend

    statsd:
      server:
        enabled: true
        bind:
          port: 8125
          address: 0.0.0.0
        backend:
          engine: amqp
          host: metrics1.domain.com
          port: 2003

Standalone Statsd server with OpenTSDB backend

    statsd:
      server:
        enabled: true
        bind:
          port: 8125
          address: 0.0.0.0
        backend:
          engine: amqp
          host: metrics1.domain.com
          port: 2003
    
## Read more

* https://github.com/etsy/statsd/
* https://github.com/mrtazz/statsd-amqp-backend
* https://github.com/danslimmon/statsd-opentsdb-backend
