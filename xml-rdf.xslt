<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
  xmlns:base="http://inspire.ec.europa.eu/schemas/base/3.3"
  xmlns:bu-base="http://inspire.ec.europa.eu/schemas/bu-base/4.0"
  xmlns:bu-core2d="http://inspire.ec.europa.eu/schemas/bu-core2d/4.0"
  xmlns:bu-ext2d="http://inspire.ec.europa.eu/schemas/bu-ext2d/4.0"
  xmlns:dbo="http://dbpedia.org/ontology/"
  xmlns:f="http://opendata.cz/xslt/functions#"
  xmlns:gml="http://www.opengis.net/gml/3.2"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:schema="http://schema.org/"
  xmlns:wfs="http://www.opengis.net/wfs/2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  exclude-result-prefixes="f">
  
  <!-- Global parameters -->
  
  <xsl:param name="ns">https://linked.opendata.cz/resource/</xsl:param>
  
  <!-- Functions -->
  
  <!-- Convert text into IRI-safe slug. -->
  <xsl:function name="f:slugify">
    <xsl:param name="text"/>
    <xsl:value-of select="encode-for-uri(lower-case($text))"/>
  </xsl:function>
  
  <!-- Output -->
  
  <xsl:output encoding="UTF-8" indent="yes" method="xml" normalization-form="NFC" />
  <xsl:strip-space elements="*"/>
  
  <!-- Templates -->
  
  <xsl:template match="/wfs:FeatureCollection">
    <rdf:RDF><xsl:apply-templates/></rdf:RDF>
  </xsl:template>
  
  <xsl:template match="wfs:member/bu-ext2d:Building">
    <xsl:variable name="identifier" select="bu-base:inspireId/base:Identifier"/>
    <xsl:variable name="id" select="$identifier/base:localId"/>
    <xsl:variable name="iri-slug"
                  select="concat(f:slugify($identifier/base:namespace), '/', f:slugify($id))"/>
    <dbo:Building rdf:about="{concat($ns, 'building/', $iri-slug)}">
      <schema:identifier><xsl:value-of select="$id"/></schema:identifier>
      <xsl:apply-templates>
        <xsl:with-param name="iri-slug" select="$iri-slug" tunnel="yes"/>
      </xsl:apply-templates>
    </dbo:Building>
  </xsl:template>
  
  <xsl:template match="bu-core2d:geometry2D/bu-base:BuildingGeometry2D/bu-base:geometry">
    <xsl:param name="iri-slug" tunnel="yes"/>
    <schema:geo>
      <schema:GeoShape rdf:about="{concat($ns, 'geo-shape/', $iri-slug)}">
        <schema:polygon>
          <xsl:value-of select="gml:Polygon/gml:exterior/gml:LinearRing/gml:posList"/>
        </schema:polygon>
      </schema:GeoShape>
    </schema:geo>
  </xsl:template>
  
  <!-- Catch-all empty template -->
  <xsl:template match="text()|@*" mode="#all"/>
</xsl:stylesheet>
