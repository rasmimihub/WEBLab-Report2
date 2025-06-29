<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/students">
        <students>
            <xsl:apply-templates select="student"/>
        </students>
    </xsl:template>

    <xsl:template match="student">
        <student reg_no="{@reg_no}">
            <name><xsl:value-of select="name"/></name>
            <symbol_number><xsl:value-of select="symbol_number"/></symbol_number>
            <marks>
                <xsl:apply-templates select="marks/subject"/>
            </marks>
            <total_marks><xsl:value-of select="total_marks"/></total_marks>
            <percentage><xsl:value-of select="percentage"/></percentage>
        </student>
    </xsl:template>

    <xsl:template match="subject">
        <subject name="{@name}">
            <xsl:value-of select="."/>
        </subject>
    </xsl:template>
</xsl:stylesheet>