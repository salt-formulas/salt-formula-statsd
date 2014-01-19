{%- if pillar.statsd.server.enabled %}

include:
- nodejs
- git

statsd_packages:
  pkg:
  - installed
  - names:
    - nodejs

statsd_user:
  user.present:
  - name: statsd
  - system: True
  - home: /srv/statsd
  - require:
    git: https://github.com/etsy/statsd.git

https://github.com/etsy/statsd.git:
  git.latest:
  - target: /srv/statsd/statsd

{#
/etc/init.d/statsd:
  file:
  - managed
  - source: salt://statsd/conf/init
  - user: root
  - group: root
  - mode: 744
  - template: jinja
#}

statsd:
  service.running:
#  - require:
#    - file: /etc/init.d/statsd
  - watch:
    - file: /etc/statsd/localConfig.js

/etc/statsd/localConfig.js:
  file:
  - managed
  - source: salt://statsd/conf/localConfig.js
  - user: root
  - group: root
  - mode: 644
  - template: jinja

{#
/etc/default/statsd:
  file:
  - managed
  - source: salt://statsd/conf/default
  - user: root
  - group: root
  - mode: 644
  - template: jinja

/srv/statsd/scripts:
  file:
  - directory
  - user: statsd
  - group: statsd
  - mode: 770
  - require:
    - user: statsd
    - git: https:://github.com/etsy/statsd.git

/srv/statsd/scripts/start:
  file:
  - managed
  - source: salt://statsd/conf/start
  - user: root
  - group: root
  - mode: 744
  - template: jinja
  - require:
    - file: /srv/statsd/scripts
#}

/var/log/statsd:
  file:
  - directory
  - user: statsd
  - group: statsd
  - mode: 777
  - require:
    - user: statsd

update-rc.d statsd defaults:
  cmd.run:
  - require:
    - service: statsd

{%- for backend in pillar.statsd.backends %}

{%- if backend.type == 'amqp' %}
#statsd_amqp_package:
#  npm.installed:
#  - name: statsd-amqp-backend

install_package:
  cmd.run:
  - name: npm install statsd-amqp-backend

{%- endif %}

{%- endfor %}

{%- endif %}