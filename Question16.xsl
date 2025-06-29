<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" indent="yes"/>
  
  <xsl:template match="/">
    <categories>
      <xsl:for-each select="products/product[quantity &gt;= 10]">
        <xsl:sort select="price" data-type="number" order="descending"/>
        <xsl:variable name="category" select="category"/>
        
        <xsl:if test="not(preceding-sibling::product[category=$category])">
          <category name="{$category}">
            <xsl:for-each select="../product[category=$category and quantity &gt;= 10]">
              <product productname="{productname}">
                <price><xsl:value-of select="price"/></price>
                <quantity><xsl:value-of select="quantity"/></quantity>
                <total-price><xsl:value-of select="price * quantity"/></total-price>
              </product>
            </xsl:for-each>
          </category>
        </xsl:if>
      </xsl:for-each>
    </categories>
  </xsl:template>
</xsl:stylesheet>