<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/content">
    <html>
      <head>
        <title>XML to CSS via XSL</title>
        <style>
          body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            text-align: center;
          }
          .header {
            background-color: green;
            color: white;
            font-size: 24px;
            font-weight: bold;
            padding: 10px;
          }
          .category {
            border: 1px solid #ccc;
            margin: 10px auto;
            width: 60%;
            padding: 10px;
            background-color: #f9f9f9;
          }
          .category-name {
            font-weight: bold;
            font-size: 18px;
            color: green;
            text-decoration: underline;
            margin-bottom: 10px;
          }
          .topic {
            font-size: 14px;
            margin: 2px 0;
          }
          /* Optional: specific topic coloring based on content (if needed) */
          .topic:nth-child(1) { color: black; }
          .topic:nth-child(2) { color: green; }
          .topic:nth-child(3) { color: red; }
          .topic:nth-child(4) { color: blue; }
          .topic:nth-child(5) { color: orange; }
 </style>
      </head>
      <content>
        <div class="header">
          <xsl:value-of select="header"/>
        </div>

        <xsl:for-each select="category">
          <div class="category">
            <div class="category-name">
              <xsl:value-of select="@name"/>
            </div>
            <xsl:for-each select="topic">
              <div class="topic">
                <xsl:value-of select="."/>
              </div>
            </xsl:for-each>
          </div>
        </xsl:for-each>

      </content>
    </html>
  </xsl:template>

</xsl:stylesheet>
