# Coversheets for EPrints

The purpose of the Coversheets is to add a front and/or back covering page to a PDF document uploaded to an EPrints repository. 

Coversheets work by using a user-defined Apache OpenOffice coversheet template uploaded to your EPrints repository. This template is then populated with the predefined attributes for the particular EPrint, before being attached to the front (or if specified, back) of any PDF documents uploaded for that EPrint.

See [EPrints wiki page](http://wiki.eprints.org/w/Coversheets) to discover how to configure the module.

## Installation
In order to install from https://github.com/eprintsug/coversheets/ you must have [gitaar](https://github.com/eprintsug/gitaar) up and running on your EPrints.

* cd to your eprints3 base root
* pull in git-hosted package

    ```
    git submodule add https://github.com/eprintsug/coversheets.git lib/epm/coversheets
    ```
* generate coversheets.epmi

    ```
    gitaar/gitaar build_epmi YOUR_ARCHIVE coversheets
    ```
* install coversheets.epmi

    ```
    tools/epm link_lib coversheets
    ```
* enable coversheets.epmi

    ```
    tools/epm enable YOUR_ARCHIVE coversheets
    ```
* regenerate everything

    ```
    generate_static --prune YOUR_ARCHIVE && generate_abstracts YOUR_ARCHIVE  &&  generate_views YOUR_ARCHIVE && epadmin reload YOUR_ARCHIVE
    ```
* restart your webserver
