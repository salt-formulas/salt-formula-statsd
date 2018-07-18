{%- from "statsd/map.jinja" import server with context %}
{%- if server.enabled %}

statsd_pkgs:
  pkg.installed:
    - names: {{ server.pkgs }}

/var/log/statsd:
  file.directory:
  - user: _statsd
  - group: _statsd
  - mode: 775
  - require:
    - pkg: statsd_pkgs
  - require_in:
    - service: {{ server.service }}

{{ server.config }}:
  file.managed:
  - source: salt://statsd/files/localConfig.js
  - user: root
  - group: root
  - mode: 644
  - template: jinja

{{ server.service }}:
  service.running:
  - enable: true
  - watch:
    - file: {{ server.config }}
    - pkg: statsd_pkgs

{%- if server.backend.engine == 'rabbitmq' %}

statsd_backend_pkgs:
  pkg.installed:
    - names: {{ server.pkgs_backend_amqp }}
    - watch_in:
      - service: {{ server.service }}

{%- elif server.backend.engine == 'opentsdb' %}

statsd_backend_pkgs:
  pkg.installed:
    - names: {{ server.pkgs_backend_opentsdb }}
    - watch_in:
      - service: {{ server.service }}

{%- endif %}

{%- endif %}
