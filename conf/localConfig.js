{
	{%- for backend in pillar.statsd.backends %}
	{%- if backend.type == 'graphite' %}
	graphitePort: {{ backend.port }},
	graphiteHost: "{{ backend.host }}",
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
	port: {{ pillar.statsd.bind_port }}
}