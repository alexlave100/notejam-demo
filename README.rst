****************************************
Notejam Migration to Amazon Web Services
****************************************

The current version of Notejam is deployed as a monolith application, serving all technical content from the same source. The source code is written in Python v2.7 and backed by the Django web framework and the database used is a SQLite3 database embedded into the end program.
The first step towards migrating the application to AWS is to break up the monolithic architecture and define the different components inside separate technical boundaries using AWS specific technologies.

The migration is done by defining the new architecture in a CloudFormation template and using the PaaS platform Elastic Beanstalk as the hosting platform for the application.

The current version of this project separates the main components of the Notejam application and builds an architecture more suitable for a cloud environment. The database is migrated, but as of right now not implemented in the CloudFormation template. It has to be created separately.


***************
Notejam: Django
***************


Notejam application implemented using `Django <https://www.djangoproject.com/>`_ framework.

Django version: 1.6

==========================
Installation and launching
==========================

-----
Clone
-----

Clone the repo:

.. code-block:: bash

    $ git clone git@github.com:komarserjio/notejam.git YOUR_PROJECT_DIR/

-------
Install
-------
Use `virtualenv <http://www.virtualenv.org>`_ or `virtualenvwrapper <http://virtualenvwrapper.readthedocs.org/>`_
for `environment management <http://docs.python-guide.org/en/latest/dev/virtualenvs/>`_.

Install dependencies:

.. code-block:: bash

    $ cd YOUR_PROJECT_DIR/django/
    $ pip install -r requirements.txt

Create database schema:

.. code-block:: bash

    $ cd YOUR_PROJECT_DIR/django/notejam/
    $ ./manage.py syncdb
    $ ./manage.py migrate

------
Launch
------

Start django web server:

.. code-block:: bash

    $ cd YOUR_PROJECT_DIR/django/notejam/
    $ ./manage.py runserver

Go to http://127.0.0.1:8000/ in your browser.

---------
Run tests
---------

Run functional and unit tests:

.. code-block:: bash

    $ cd YOUR_PROJECT_DIR/django/notejam/
    $ ./manage.py test


============
Contribution
============
Do you have python/django experience? Help the app to follow python and django best practices.

Please send your pull requests in the ``master`` branch.
Always prepend your commits with framework name:

.. code-block:: bash

    Django: Implemented sign in functionality

Read `contribution guide <https://github.com/komarserjio/notejam/blob/master/contribute.rst>`_ for details.
