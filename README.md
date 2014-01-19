
# Statsd

## Sample pillar

    statsd:
      server:
        enabled: true
        bind_port: 8125
        backends:
        - type: graphite
          host: metrics1.domain.com
          port: 2003

## Read more

* https://github.com/etsy/statsd/
* https://github.com/mrtazz/statsd-amqp-backend