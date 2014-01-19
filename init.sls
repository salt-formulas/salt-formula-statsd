
include:
{% if pillar.statsd.server is defined %}
- statsd.server
{% endif %}

