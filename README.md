# DITA-OT EditLink plugin

[![DITA-OT 3.1](https://img.shields.io/badge/DITA--OT-3.1-blue.svg)](http://www.dita-ot.org/3.1)
[![Build Status](https://travis-ci.org/jason-fox/com.oxygenxml.editlink.svg?branch=master)](https://travis-ci.org/jason-fox/com.oxygenxml.editlink)
[![Coverage Status](https://coveralls.io/repos/github/jason-fox/com.oxygenxml.editlink/badge.svg?branch=master)](https://coveralls.io/github/jason-fox/com.oxygenxml.editlink?branch=master)
[![license](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0)

This plugin is compatible with DITA OT 2.x and it allows you to add references to the original DITA topic after each presented topic title both in the PDF and XHTML-based outputs.

To add "Edit" links to each topic title for editing the original topics in the oXygen XML Web Author you need to set the following Ant properties:

* `editlink.remote.ditamap.url` The URL of the root DITA map in the remote repository (e.g., GitHub). This URL depends on the connector to the file server. For example:
  * For *GitHub*, the format is `github://getFileContent/${user}/${repo}/${branch}/path/to/file.ditamap` .
  * For *WebDAV*, the format is `webdav-http://example.com/path/to/file.ditamap`.
  * For more details, please see the [customization manual](https://www.oxygenxml.com/doc/ug-waCustom/topics/webauthor-integrate-embedded-launch.html).

* `editlink.web.author.url` The link to the Oxygen Web Author server that will be used to edit the source in the remote repository, e.g. `https://www.oxygenxml.com/oxygen-xml-web-author/`.

If you set the parameter "editlink.present.only.path.to.topic" to "true" the references will be simple relative file paths pointing to the original DITA topic location and which start to appear after each topic title.
For example the PDF output would look like this:
![https://www.oxygenxml.com/forum/files/presentingReferencesToDITATopics.png](https://www.oxygenxml.com/forum/files/presentingReferencesToDITATopics.png)

For what audience would this plugin be useful?

1) Internal reviewers can review directly the WebHelp or PDF output and when they need to make a correction they can click the "Edit Link" button, open the topic in the Oxygen Web Author and propose changes there, add comments or edit content.
2) Translators may get from the agency both a set of DITA topics and the PDFs or WebHelp output for the entire manual. If after each topic title in the published output the translator sees the path to the original DITA topic location, they can quickly find the part in the user manual PDF or WebHelp output which was generated from the DITA topic they are currently translating.
 
## Integration with the [PDF5-ML plugin](https://github.com/AntennaHouse/pdf5-ml)

To embed an Edit link DITA PDF5 output, obtained using the PDF5-ML plugin, follow this procedure:

1. Add the following import `<xsl:include href="../../com.oxygenxml.editlink/pdf5.xsl"/>` in the `com.antennahouse.pdf5.ml/customization/dita2fo_custom.xsl` file of the PDF5 plugin.
1. In the `com.oxygenxml.editlink/plugin.xml` file, uncomment the lines that configure the parameters for the PDF5 plugin: 

```
<feature extension="com.antennahouse.pdf5.ml.param" value="params.xml" type="file"/>
<feature extension="com.antennahouse.pdf5.ml.saxon.param" value="params.xml" type="file"/>
<feature extension="com.antennahouse.pdf5.ml.psmi.param" value="params.xml" type="file">
```
1. In Oxygen XML Editor/Author, edit a DITA Map PDF5 transformation scenario and open the Parameters tab. 
1. Set values for the following parameters: 
 - editlink.remote.ditamap.url - The custom OXY-URL of the DITA Map suitable for opening in Web Author.
 - editlink.web.author.url - The URL of the Web Author installation (for example: https://www.oxygenxml.com/oxygen-xml-web-author/).
