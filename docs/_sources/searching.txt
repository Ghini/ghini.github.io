Searching
=========

** This section is a work in progress **

Bauble enables you to search your plant records for generic terms or use more
specific queries to find exactly what you're looking for.  Three types of
search in Bauble are:

  - Search by value
  - Domain queries
  - Expressions

These three types of search are in order of simple and forgiving to detailed and complex.

Search By Value
---------------

Search by value allows you to enter a list of value to match the most common
fields in the database.  For example if you enter **Max** it will match all the
families, genera and taxa that match the name **Max**.

These are the simplest forms of search and can return large result sets that
can match across multiple types of records.  One search might returns lists of
locations, families and accessions.


Domain queries
---------------

Domain queries search a specific type of record.  The are of the form ** <domain> = <value>** where <domain> is a search domain like family or accessions and value is the value that you want to search for withing that domain.

For example if you only want to search families for a particular string you
might enter **family = Max** to match only families that contain the string
**Max**.

Expressions
---------------

Expressions are the most powerful types of search but are also the most
difficult to master.  Expression search have their own query language and like
domain queries return results within a specific search domain.  The main
difference between domain queries and expressions is that expressions allow you
so search for more specific results in fields within a domain and even children
of search domain.

An example of a search expression that returns all the accessions in the genus *Maxillaria* or *Enyclia* would be:

accessions where species.genus.genus = "Maxillaria" or species.genus.genus = "Encyclia"
