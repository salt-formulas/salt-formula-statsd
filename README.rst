
==============
Statsd formula
==============

Simple daemon for easy stats aggregation.


Sample pillars
==============

Standalone Statsd server with Graphite/carbon backend

.. code-block:: yaml

    statsd:
      server:
        enabled: true
        bind:
          port: 8125
          address: 0.0.0.0
        backend:
          engine: carbon
          host: metrics1.domain.com
          port: 2003

Standalone Statsd server with Graphite/AMQP backend

.. code-block:: yaml

    statsd:
      server:
        enabled: true
        bind:
          port: 8125
          address: 0.0.0.0
        backend:
          engine: amqp
          host: metrics1.domain.com
          port: 5672
          

Standalone Statsd server with OpenTSDB backend

.. code-block:: yaml

    statsd:
      server:
        enabled: true
        bind:
          port: 8125
          address: 0.0.0.0
        backend:
          engine: amqp
          host: metrics1.domain.com
          port: 2003


More information
================

* https://github.com/etsy/statsd/
* https://github.com/mrtazz/statsd-amqp-backend
* https://github.com/danslimmon/statsd-opentsdb-backend


Documentation and Bugs
======================

To learn how to install and update salt-formulas, consult the documentation
available online at:

    http://salt-formulas.readthedocs.io/

In the unfortunate event that bugs are discovered, they should be reported to
the appropriate issue tracker. Use Github issue tracker for specific salt
formula:

    https://github.com/salt-formulas/salt-formula-statsd/issues

For feature requests, bug reports or blueprints affecting entire ecosystem,
use Launchpad salt-formulas project:

    https://launchpad.net/salt-formulas

You can also join salt-formulas-users team and subscribe to mailing list:

    https://launchpad.net/~salt-formulas-users

Developers wishing to work on the salt-formulas projects should always base
their work on master branch and submit pull request against specific formula.

    https://github.com/salt-formulas/salt-formula-statsd

Any questions or feedback is always welcome so feel free to join our IRC
channel:

    #salt-formulas @ irc.freenode.net
