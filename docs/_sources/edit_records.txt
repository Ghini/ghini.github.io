Creating and editing records
============================

.. warning:: **The documentation is a work in progress**.

Family
------

The family editor allows you to create or edit a botanicl Family in Bauble.
Families are the highest taxonomic grouping in Bauble.  A family has as
children multipler genera.

The family **name** is generally a unique name among all the families in the
database.  The family name is not required to be unique when the family has a
qualifer.  The family name is required.

The family **qualifier** indicates by what definition the family name is used.
For example in taxonomic literature a family might be used in the broad,
inclusive sense (*senso lato*) or the strict more limited sense(*senso
strict*).  The qualifer is not a required field.


Family Synonyms
~~~~~~~~~~~~~~~

Family can have more than one synonyms.  A synonyms is one or more families the
family you are editing is known buy.  Currently in Bauble there is no way to
indicate the type of the synonym.  In general the family you are adding the
synonyms to is considered the accepted name between the family and the list of
synonyms.

It is considered bad practice to add a synonym to a family and also to have
that family as the synonym of the synonymous family.  E.g. if you have A->B
where B is a synonym of A you don't also want to have B->A where A is a synonym
of B.  In this case A would be considered the accepted synonym for B.


Genus
------

Every genus has exactly one related Family.  The family for a genus must be set
before the records can be saved.

The **genus** name is generally a unique name across all the genera in a database.  The uniqueness of a genus is not enforced since a genus can also have a qualifer.  For more information about the qualifer see the section on the family qualifier above.

A genus can also have an **author** which indicated the author(s) that
originally published the name in a botanical journal.

Genus Synonyms
~~~~~~~~~~~~~~~
A genus can have more than on synonyms.

The discussion above about family synonyms applies to genus synonyms as well.


Taxon
------
A taxon is a unique name that groups accessions in a plant record system.  This
is usually a combination of the species and/or cultivated names of a plant.  A taxon is required to have exacty one genus.

Infraspecfic parts.


Accession
---------

An accession is typically a group of plants that share the same source although
the plant collector may decide what does or does not belong as a grouping in an
accession.  For example if 100 seed are collected they usually all have the
same accession number.  The plant collector may also decide to divide the 100
seeds into different accession numbers depending on how the seed was germinated
or stored.



Plant
------

A plant is a subset of an accession.  Plants are usually created when one or
several items in an accession need to have some qualifying information recorded
about them such as their location.  A plant is sometimes called planting or a
plant qualifer.


Location
--------

A location is a unique section of the garden, nursery or herbarium.  A location can have a unique code or a description.
