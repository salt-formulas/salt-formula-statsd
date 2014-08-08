{%- from "statsd/map.jinja" import server with context %}

{
	{%- if server.backend.engine == 'carbon' %}
	graphiteHost: "{{ backend.host }}",
	graphitePort: {{ backend.port }},
	backends: [ "./backends/graphite" ],
	{%- endif %}
	{%- if server.backend.engine == 'amqp' %}
	amqpHost: '{{ backend.host }}',
	amqpPort: {{ backend.port }},
	amqpLogin: '{{ backend.user }}',
	amqpPassword: '{{ backend.password }}',
	amqpVhost: '{{ backend.virtual_host }}',
	amqpQueue: '{{ backend.queue }}',
	amqpDefaultExchange: '{{ backend.exchange }}',
	{%- endif %}
	{%- if server.backend.engine == 'opentsdb' %}
	opentsdbHost: "{{ backend.host }}",
	opentsdbPort: {{ backend.port }},
	opentsdbTagPrefix: "{{ backend.get('prefix', '_t_') }}",
	{%- endif %}
	port: {{ pillar.statsd.server.bind.port }}
}