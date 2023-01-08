INTRODUCTION
------------

This is an all-in-one JAR file to be used to run a web application for the validation of RDF content using SHACL shapes.
Any RDF content can be validated using an arbitrary set of shapes that you provide as input.

PREREQUISITES
-------------

The validator application uses the Java platform and is packaged as an executable JAR file. This JAR file includes
the application itself as well as an embedded server for its deployment. Before using the validator ensure you have
an installation of the Java Runtime Environment (JRE) or Java Development Kit (JDK) of at least version  11.0.0, 
and that the "java" executable is present on your system path.

To validate your Java installation you can open a command prompt and issue "java --version". Doing so you should
see an output such as the following:

openjdk 11.0.2 2019-01-15
OpenJDK Runtime Environment 18.9 (build 11.0.2+9)
OpenJDK 64-Bit Server VM 18.9 (build 11.0.2+9, mixed mode)

The validator can be installed and ran on any operating system that supports the Java Virtual Machine (JVM).

INSTALLATION
------------

To install the validator extract file "validator.jar" into a folder of your choosing. The validator itself is
agnostic of any configuration of domains and their included validation artifacts. As a first step you will need
to ensure that the complete configuration is available on the filesystem and accessible by the validator. Keep in
mind that the validator by default supports a multi-domain setup. This support is reflected on the configuration's
folder structure.

As a proposed setup consider the following structure (note the extra "/resources" directory):

/validator
    |
    +-- validator.jar
    +-- /resources
        |
        + /my_domain
            |
            +-- config.properties
        
Considering this structure you can start the validator with the following command (note the use of system
properties passed as arguments with the "-D" prefix):

java -Dvalidator.resourceRoot=/validator/resources \
     -Dlogging.file.path=/validator/logs \
     -Dvalidator.tmpFolder=/validator/tmp \
     -jar validator.jar

Any passed system properties may also be defined as environment variables. The properties included above are
defined as follows:
    - [validator.resourceRoot]: The root folder from which all domain configurations will be loaded (one sub-folder
      per domain).
    - [logging.file.path]: The validator's log output folder.
    - [validator.tmpFolder]: The validator's temporary work folder.

The above properties constitute a minimum of properties you would want to configure. Additional system properties
you may find useful to set are:
    - [server.port]: To define the listen port of the application (by default 8080).
    - [server.servlet.context-path]: To define the base context path of the application (by default "/shacl").
    - [validator.domain]: a comma-separated list of folders under the [validator.resourceRoot] folder to load.
    - [validator.domainName.DOMAIN]: In case the name "my_domain" above should be exposed differently. The domain
      name will be reflected in the application's path mappings and APIs.

Important: Ensure that all system properties passed from the command line are done before the "-jar" flag.

LICENCE
-------

This tool is shared using the European Union Public Licence (EUPL) version 1.2. The licence text
can be consulted online at https://joinup.ec.europa.eu/sites/default/files/custom-page/attachment/eupl_v1.2_en.pdf.

LEGAL NOTICE
------------

The authors of this tool waive any and all liability linked to its usage or the interpretation of its results.
In terms of data, the tool does not harvest, collect or process in any way data that could be linked to the tool's
user or workstation, nor does it maintain any state or statistics other than the report files that it produces as 
output.

CONTACT
-------

For any questions or feedback you are invited to send an email to DIGIT-ITB@ec.europa.eu.

VERSION INFORMATION AND CHECKSUMS
---------------------------------

Build timestamp: 2023-01-04 09:22:24
Checksums for file validator.jar (for file integrity verification):
- MD5: 8c3bdd0dff4fbaf218d83121d46899d5
- SHA1: 56ab9ae8055dcfd46697ad2c880ff4070aa03ce1