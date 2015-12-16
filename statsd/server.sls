{%- from "statsd/map.jinja" import server with context %}
{%- if server.enabled %}

include:
- nodejs
- git

statsd_user:
  user.present:
  - name: statsd
  - system: True
  - home: /srv/statsd
  - require:
    - git: {{ server.source }}
    - pkg: nodejs_packages

{{ server.source }}:
  git.latest:
  - target: /srv/statsd/statsd
  - require:
    - pkg: git_packages

{% set conf = "".join((server.config_prefix,'localConfig.js'),) %}

{#
{{ server.service_location }}:
  file.managed:
  - source: salt://statsd/conf/init
  - user: root
  - group: root
  - mode: 744
  - template: jinja

{{ server.service }}:
  service.running:
  - enable: true
  - require:
    - file: {{ server.service_location }}
  - watch:
    - file: {{ server.config }}
    - cmd: install_statsd_deps
#}

/etc/statsd:
  file.directory

install_statsd_deps:
  cmd.run:
  - name: npm install
  - cwd: /srv/statsd/statsd/
  - unless: test -e /srv/statsd/statsd/node_modules
  - require:
    - git: {{ server.source }}

{{ server.config }}:
  file.managed:
  - source: salt://statsd/conf/localConfig.js
  - user: root
  - group: root
  - mode: 644
  - template: jinja

/var/log/statsd:
  file.directory:
  - user: statsd
  - group: statsd
  - mode: 777
  - require:
    - user: statsd

{%- if server.backend.engine == 'amqp' %}

#statsd_amqp_package:
#  npm.installed:
#  - name: statsd-amqp-backend

install_package:
  cmd.run:
  - name: npm install statsd-amqp-backend

{%- endif %}

{%- if server.backend.engine == 'opentsdb' %}

install_package:
  cmd.run:
  - name: npm install statsd-opentsdb-backend

{%- endif %}

{%- endif %}