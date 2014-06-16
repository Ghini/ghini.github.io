Getting Started
===============

.. warning:: **The documentation is a work in progress**.

Introduction
------------
Bauble is an opinionated plant collection manager that allows an individual or an organization to manage their plant collections from their computer or mobile device and to host that collection in the "cloud".

Digital plant collection management is not unique to Bauble but it does have
some features that sets it apart from similar plant collection management
systems.  Some of Bauble unique features include:

  - **Built for the cloud.**

    The servers running Bauble are built to be redundant and reliable so that
    you can be sure that your plant records are safe and available when you
    need them.

  - **Open source**.

    Bauble is open soure and built entirely from open source software.  This
    means that your data isn't locked up into proprietary database.  You could
    even run your own instance of Bauble on your own servers. You can find the
    code that makes uf the Bauble server and web app at
    http://github.com/Bauble.

  - **Enforces best practices**

    By enforcing relationships between families, genera, taxa, accessions and
    plants Bauble ensures that your records don't become polluted with mistyped
    generic names, plants without locations, etc.

  - **Open API**

    With an open API you can extend your plant records to work with other
    services or run custom analysis on your data. The possibillites are
    endless. For more information about API see the :ref:`rest-api` section.


Create a new account
--------------------
Every account on Bauble is also part of an organization.  Organizations allow more than one user to manage a plant collection.  At the moment there is no way to restrict what a particular user can an can't edit in a collection so only allow someone access to your collection if they are somone you can trust.

.. note:: The organizations **name** and short **name** are not required to be
   unique but these field are used when exporting your data.  If your
   organization is registered with `BGCI <http://bgci.org>`_ then the short
   name should be the same as the *Institution Code* registered with the BGCI.

After creating a new account you plant collection records will be populated with a comprehensive set of accepted vascular plant families and genera.
