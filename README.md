# Coversheets for EPrints
#### [EPrints wiki page](http://wiki.eprints.org/w/Coversheets)

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
