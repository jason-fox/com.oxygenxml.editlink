<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:editlink="http://oxygenxml.com/xslt/editlink/" exclude-result-prefixes="xs editlink" version="2.0">

    <xsl:import href="link.xsl"/>

  <xsl:param name="editlink.remote.ditamap.url"/>
  <xsl:param name="editlink.web.author.url"/>
  <xsl:param name="editlink.local.ditamap.path"/>
  <xsl:param name="editlink.present.only.path.to.topic"/>
  <xsl:param name="editlink.local.ditaval.path"/>
 
  <xsl:template match="*" mode="processTopicTitle"><xsl:if test=". instance of element()"><xsl:comment>d4e16:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if>


    <xsl:if test=". instance of element()">
<xsl:comment>d4e18:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if><xsl:choose>
      <xsl:when test="string-length($editlink.remote.ditamap.url) &gt; 0         or $editlink.present.only.path.to.topic = 'true'"><xsl:if test=". instance of element()"><xsl:comment>d4e20:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if>


        <xsl:variable name="level" as="xs:integer">
          <xsl:apply-templates select="." mode="get-topic-level"/>
        </xsl:variable>
        <xsl:variable name="attrSet1">
          <xsl:apply-templates select="." mode="createTopicAttrsName">
            <xsl:with-param name="theCounter" select="$level"/>
          </xsl:apply-templates>
        </xsl:variable>
        <xsl:variable name="attrSet2" select="concat($attrSet1, '__content')"/>
        <fo:block>
          <xsl:call-template name="commonattributes"/>
          <xsl:call-template name="processAttrSetReflection">
            <xsl:with-param name="attrSet" select="$attrSet1"/>
            <xsl:with-param name="path" select="'../../cfg/fo/attrs/commons-attr.xsl'"/>
          </xsl:call-template>
          <fo:block>
            <xsl:call-template name="processAttrSetReflection">
              <xsl:with-param name="attrSet" select="$attrSet2"/>
              <xsl:with-param name="path" select="'../../cfg/fo/attrs/commons-attr.xsl'"/>
            </xsl:call-template>
            
            <fo:table>
              <fo:table-body>   
                <fo:table-row>
                  <fo:table-cell>
                    <fo:block>
                      <!-- This content was already here before. I just wrapped it in a table. -->
                      <xsl:if test="$level = 1"><xsl:if test=". instance of element()"><xsl:comment>d4e69:xslfo.xsl</xsl:comment></xsl:if>


                        <fo:marker marker-class-name="current-header">
                          <xsl:apply-templates select="." mode="getTitle"/>
                        </fo:marker>
                      </xsl:if>
                      <xsl:if test="$level = 2"><xsl:if test=". instance of element()"><xsl:comment>d4e77:xslfo.xsl</xsl:comment></xsl:if>


                        <fo:marker marker-class-name="current-h2">
                          <xsl:apply-templates select="." mode="getTitle"/>
                        </fo:marker>
                      </xsl:if>
                      <fo:inline id="{parent::node()/@id}"/>
                      <fo:inline>
                        <xsl:attribute name="id">
                          <xsl:call-template name="generate-toc-id">
                            <xsl:with-param name="element" select=".."/>
                          </xsl:call-template>
                        </xsl:attribute>
                      </fo:inline>
                      <xsl:call-template name="pullPrologIndexTerms"/>
                      <xsl:apply-templates select="." mode="getTitle"/>
                      <!-- End of existing content -->
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell width="80pt">
                    <fo:block start-indent="0px" width="80pt">
                      <xsl:if test="@xtrf"><xsl:if test=". instance of element()"><xsl:comment>d4e111:xslfo.xsl</xsl:comment></xsl:if>
                        <xsl:if test=". instance of element()">
<xsl:comment>d4e113:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if><xsl:choose>
                          <xsl:when test="$editlink.present.only.path.to.topic = 'true'"><xsl:if test=". instance of element()"><xsl:comment>d4e115:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if>

                            <fo:inline text-align="right" white-space="nowrap" color="navy" font-size="8pt" font-weight="normal" width="80pt" font-style="normal">
                              <xsl:value-of select="editlink:makeRelative(editlink:toUrl($editlink.local.ditamap.path), @xtrf)"/>
                            </fo:inline>
                          </xsl:when>
                          <xsl:otherwise><xsl:if test=". instance of element()"><xsl:comment>d4e123:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if>
                            <fo:basic-link text-align="right" white-space="nowrap" text-decoration="underline" color="navy" font-size="8pt" font-weight="normal" width="80pt" font-style="normal">
                              <xsl:attribute name="external-destination">
                                <xsl:value-of select="editlink:compute($editlink.remote.ditamap.url, $editlink.local.ditamap.path, @xtrf, $editlink.web.author.url, $editlink.local.ditaval.path)"/>
                              </xsl:attribute>
                              Edit online
                            </fo:basic-link>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:if>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-body>
            </fo:table>
          </fo:block>
        </fo:block>
      </xsl:when>
      <xsl:otherwise><xsl:if test=". instance of element()"><xsl:comment>d4e144:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if>
        <xsl:next-match/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <!--  Bookmap Chapter processing  -->
  <xsl:template match="*[contains(@class, ' bookmap/chapter ')]" mode="generatePageSequences"><xsl:if test=". instance of element()"><xsl:comment>d4e153:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if>


    <xsl:if test=". instance of element()">
<xsl:comment>d4e155:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if><xsl:choose>
      <xsl:when test="string-length($editlink.remote.ditamap.url) &gt; 0          or $editlink.present.only.path.to.topic = 'true'"><xsl:if test=". instance of element()"><xsl:comment>d4e157:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if>


        <xsl:variable name="referencedTopic" select="key('topic-id', @id)" as="element()*"/>
        <xsl:if test=". instance of element()">
<xsl:comment>d4e161:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if><xsl:choose>
          <xsl:when test="empty($referencedTopic)"><xsl:if test=". instance of element()"><xsl:comment>d4e163:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if>


            <xsl:apply-templates select="*[contains(@class,' map/topicref ')]" mode="generatePageSequences"/>
          </xsl:when>
          <xsl:otherwise><xsl:if test=". instance of element()"><xsl:comment>d4e168:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if>
            <xsl:if test=". instance of element()">
<xsl:comment>d4e170:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if><xsl:for-each select="$referencedTopic">
              <xsl:call-template name="processTopicChapterForEditLinks"/>
            </xsl:for-each>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise><xsl:if test=". instance of element()"><xsl:comment>d4e178:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if>
        <xsl:next-match/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template name="processTopicChapterForEditLinks"><xsl:if test=". instance of element()"><xsl:comment>d4e185:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if>


    <xsl:if test=". instance of element()">
<xsl:comment>d4e187:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if><xsl:choose>
      <xsl:when test="string-length($editlink.remote.ditamap.url) &gt; 0         or $editlink.present.only.path.to.topic = 'true'"><xsl:if test=". instance of element()"><xsl:comment>d4e189:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if>


        <fo:page-sequence master-reference="body-sequence" xsl:use-attribute-sets="page-sequence.body">
          <xsl:call-template name="startPageNumbering"/>
          <xsl:call-template name="insertBodyStaticContents"/>
          <fo:flow flow-name="xsl-region-body">
            <fo:block xsl:use-attribute-sets="topic">
              <xsl:call-template name="commonattributes"/>
              <xsl:variable name="level" as="xs:integer">
                <xsl:apply-templates select="." mode="get-topic-level"/>
              </xsl:variable>
              <xsl:if test="$level eq 1"><xsl:if test=". instance of element()"><xsl:comment>d4e208:xslfo.xsl</xsl:comment></xsl:if>


                <fo:marker marker-class-name="current-topic-number">
                  <xsl:variable name="topicref" select="key('map-id', ancestor-or-self::*[contains(@class, ' topic/topic ')][1]/@id)"/>
                  <xsl:if test=". instance of element()">
<xsl:comment>d4e214:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if><xsl:for-each select="$topicref">
                    <xsl:apply-templates select="." mode="topicTitleNumber"/>
                  </xsl:for-each>
                </fo:marker>
                <xsl:apply-templates select="." mode="insertTopicHeaderMarker"/>
              </xsl:if>
              
              <xsl:apply-templates select="*[contains(@class,' topic/prolog ')]"/>
              
              <xsl:call-template name="insertChapterFirstpageStaticContent">
                <xsl:with-param name="type" select="'chapter'"/>
              </xsl:call-template>
              
              <fo:block xsl:use-attribute-sets="topic.title">
                <fo:table>
                  <fo:table-body>
                    <fo:table-row>
                      <fo:table-cell>
                        <fo:block>
                          <xsl:call-template name="pullPrologIndexTerms"/>
                          <xsl:if test=". instance of element()">
<xsl:comment>d4e245:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if><xsl:for-each select="*[contains(@class,' topic/title ')]">
                            <xsl:apply-templates select="." mode="getTitle"/>
                          </xsl:for-each>
                        </fo:block>
                      </fo:table-cell>
                      <fo:table-cell width="80pt">
                        <fo:block start-indent="0px" width="80pt">
                          <xsl:if test="@xtrf"><xsl:if test=". instance of element()"><xsl:comment>d4e256:xslfo.xsl</xsl:comment></xsl:if>


                            <xsl:if test=". instance of element()">
<xsl:comment>d4e258:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if><xsl:choose>
                              <xsl:when test="$editlink.present.only.path.to.topic = 'true'"><xsl:if test=". instance of element()"><xsl:comment>d4e260:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if>


                                <fo:inline text-align="right" white-space="nowrap" color="navy" font-size="8pt" font-weight="normal" width="80pt" font-style="normal">
                                  <xsl:value-of select="editlink:makeRelative(editlink:toUrl($editlink.local.ditamap.path), @xtrf)"/>
                                </fo:inline>
                              </xsl:when>
                              <xsl:otherwise><xsl:if test=". instance of element()"><xsl:comment>d4e268:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if>
                                <fo:basic-link text-align="right" white-space="nowrap" text-decoration="underline" color="navy" font-size="8pt" font-weight="normal" width="80pt" font-style="normal">
                                  <xsl:attribute name="external-destination">
                                    <xsl:value-of select="editlink:compute($editlink.remote.ditamap.url, $editlink.local.ditamap.path, @xtrf, $editlink.web.author.url, $editlink.local.ditaval.path)"/>
                                  </xsl:attribute>
                                  Edit online
                                </fo:basic-link>  
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:if>
                        </fo:block>
                      </fo:table-cell>
                    </fo:table-row>
                  </fo:table-body>
                </fo:table>
              </fo:block>
              
              <xsl:if test=". instance of element()">
<xsl:comment>d4e287:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if><xsl:choose>
                <xsl:when test="$chapterLayout='BASIC'"><xsl:if test=". instance of element()"><xsl:comment>d4e289:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if>
                  <xsl:apply-templates select="*[not(contains(@class, ' topic/topic ') or contains(@class, ' topic/title ') or                     contains(@class, ' topic/prolog '))]"/>
                  <!--xsl:apply-templates select="." mode="buildRelationships"/-->
                </xsl:when>
                <xsl:otherwise><xsl:if test=". instance of element()"><xsl:comment>d4e296:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if>
                  <xsl:apply-templates select="." mode="createMiniToc"/>
                </xsl:otherwise>
              </xsl:choose>
              
              <xsl:apply-templates select="*[contains(@class,' topic/topic ')]"/>
              <xsl:call-template name="pullPrologIndexTerms.end-range"/>
            </fo:block>
          </fo:flow>
        </fo:page-sequence>
      </xsl:when>
      <xsl:otherwise><xsl:if test=". instance of element()"><xsl:comment>d4e310:xslfo.xsl</xsl:comment><xsl:text>
</xsl:text></xsl:if>
        <xsl:next-match/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>