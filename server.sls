{%- if pillar.statsd.server.enabled %}

include:
- nodejs
- git

statsd_user:
  user.present:
  - name: statsd
  - system: True
  - home: /srv/statsd
  - require:
    - git: https://github.com/etsy/statsd.git
    - pkg: nodejs_packages

https://github.com/etsy/statsd.git:
  git.latest:
  - target: /srv/statsd/statsd
  - require:
    - pkg: git_packages

{% if grains.os_family == "Debian" %}

/etc/init.d/statsd:
  file.managed:
  - source: salt://statsd/conf/init
  - user: root
  - group: root
  - mode: 744
  - template: jinja

statsd:
  service.running:
  - enable: true
  - require:
    - file: /etc/init.d/statsd
  - watch:
    - file: /etc/statsd/localConfig.js

{% endif %}

/etc/statsd/localConfig.js:
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

{%- for backend in pillar.statsd.server.backends %}

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