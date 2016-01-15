{%- from "statsd/map.jinja" import server with context %}

{
	{%- if server.backend.engine == 'carbon' %}
	graphiteHost: "{{ server.backend.host }}",
	graphitePort: {{ server.backend.port }},
	backends: [ "./backends/graphite" ],
	{%- endif %}
	{%- if server.backend.engine == 'rabbitmq' %}
	amqpHost: '{{ server.backend.host }}',
	amqpPort: {{ server.backend.port }},
	amqpLogin: '{{ server.backend.user }}',
	amqpPassword: '{{ server.backend.password }}',
	amqpVhost: '{{ server.backend.virtual_host }}',
	amqpQueue: '{{ server.backend.queue }}',
	amqpDefaultExchange: '{{ server.backend.exchange }}',
	{%- endif %}
	{%- if server.backend.engine == 'opentsdb' %}
	opentsdbHost: "{{ server.backend.host }}",
	opentsdbPort: {{ server.backend.port }},
	opentsdbTagPrefix: "{{ server.backend.get('prefix', '_t_') }}",
	{%- endif %}
	port: {{ server.bind.port }}
}