<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title>Book List</title>
            </head>
            <body>
                <h2>Book Information</h2>
                <table border="1">
                    <tr>
                        <th>Title</th>
                        <th>Year</th>
                        <th>Author</th>
                        <th>Editor</th>
                        <th>Publisher</th>
                        <th>Price</th>
                    </tr>
                    <xsl:apply-templates select="bib/book"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="book">
        <tr>
            <td><xsl:value-of select="title"/></td>
            <td><xsl:value-of select="@year"/></td>
            <td>
                <xsl:for-each select="author">
                    <xsl:value-of select="."/><br/>
                </xsl:for-each>
            </td>
            <td>
                <xsl:if test="editor">
                    <xsl:value-of select="editor/name"/> 
                    <xsl:if test="editor/affiliation">
                        (<xsl:value-of select="editor/affiliation"/>)
                    </xsl:if>
                </xsl:if>
            </td>
            <td><xsl:value-of select="publisher"/></td>
            <td><xsl:value-of select="price"/></td>
        </tr>
    </xsl:template>

</xsl:stylesheet>