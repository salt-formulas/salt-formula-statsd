{
	{%- for backend in pillar.statsd.server.backends %}
	{%- if backend.type == 'graphite' %}
	graphitePort: {{ backend.port }},
	graphiteHost: "{{ backend.host }}",
	backends: [ "./backends/graphite" ],
	{%- endif %}
	{%- if backend.type == 'amqp' %}
	amqpHost: '{{ backend.host }}',
	amqpPort: {{ backend.port }},
	amqpLogin: '{{ backend.user }}',
	amqpPassword: '{{ backend.password }}',
	amqpVhost: '{{ backend.virtual_host }}',
	amqpQueue: '{{ backend.queue }}',
	amqpDefaultExchange: '{{ backend.exchange }}',
	{%- endif %}
	{%- endfor %}
	port: {{ pillar.statsd.server.bind.port }}
}