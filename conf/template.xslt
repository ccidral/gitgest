<?xml version="1.0" ?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#160;"> ]>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
	<xsl:template match="/">
		<xsl:apply-templates select="report"/>
	</xsl:template>

    <xsl:template match="report">
		<html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
        </head>
		<body style="font-family:Helvetica,Arial,sans-serif;background-color:#eee;padding:1em;">
        <div style="margin:2em auto;padding:1em;width:800px;background-color:white;border:1px solid #ccc;border-radius:1em;">
            <p>Latest commits</p>
    		<xsl:apply-templates select="repository"/>
        </div>
		</body>
		</html>
    </xsl:template>

    <xsl:template match="repository">
		<h1 style="font-size: 1.2em;color: #555;margin:1em 0 0.3em 0;padding:1em 0 0 0;border-top:1px solid #ccc;"><xsl:value-of select="@name"/></h1>
	    <xsl:apply-templates select="branch"/>
	</xsl:template>

    <xsl:template match="branch">
		<p><span style="font-family:Monaco,'Lucida Console',monospace;display:inline-block;background-color:#0c0;color:white;padding:0.2em 0.5em;border-radius:0.3em;">&#8611; <xsl:value-of select="@name"/></span></p>
        <table style="font-family:Helvetica,Arial,sans-serif;'">
		    <xsl:apply-templates select="commit"/>
        </table>
	</xsl:template>

	<xsl:template match="commit">
        <tr>
            <td style="vertical-align:top;">
                <span style="color:white;font-family:Monaco,'Lucida Console',monospace;font-size:0.8em;display:inline-block;background-color:orange;border-radius:0.3em;padding:0.2em 0.4em;">
                    <xsl:value-of select="abbrevhash"/>
                </span>
            </td>
            <td style="vertical-align:top;width:9em;">
                <xsl:variable name="dt" as="xs:dateTime" select="xs:dateTime(concat(
                    substring(date,0,11),'T',
                    substring(date,12,8),
                    substring(date,21,3),':',
                    substring(date,24,2)
                ))"/>
                <span>&nbsp;</span>
                <span style="color:#999;"><xsl:value-of select="format-dateTime($dt, '[D01]/[M01]/[Y0001] [H01]:[m01]')"/></span>
                <span>&nbsp;</span>
            </td>
            <td style="vertical-align:top;">
                <span style="color:#66e;"><xsl:value-of select="author"/></span>
                <span>&nbsp;</span>
            </td>
            <td style="vertical-align:top;">
                <xsl:if test="refdesc != ''">
                    <span style="display:inline-block;background-color:#f77;color:white;font-size:0.7em;padding:0.2em 0.3em;border-radius:0.2em;font-family:Monaco,'Lucida Console',monospace;"><xsl:value-of select="refdesc"/></span>
                    <span>&nbsp;</span>
                </xsl:if>
                <xsl:variable name="messageLength" select="string-length(message)"/>
                <xsl:variable name="messageMaxLength" select="200"/>
                <xsl:choose>
                  <xsl:when test="$messageLength > $messageMaxLength"><xsl:value-of select="substring(message,0,$messageMaxLength)"/>...</xsl:when>
                  <xsl:otherwise><xsl:value-of select="message"/></xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>
	</xsl:template>
</xsl:stylesheet>
