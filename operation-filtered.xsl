<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Opération bancaire</title>
            </head>
            <body>
                <h1>Relevé d'opération bancaire de type CREDIT</h1>
                <ul>
                    <li>Compte N°<xsl:value-of select="releve/@RIB"/></li>
                    <li>Date d'extraction: <xsl:value-of select="releve/dateReleve"/></li>
                </ul>
                <table border="1" width="90%">
                    
                    <tr>
                        <th>Date</th>
                        <th>Type</th>
                        <th>Description</th>
                        <th>Montant</th>
                    </tr>
                    <xsl:for-each select="releve/operations/operation[@type='CREDIT']">
                        <tr>
                            <td><xsl:value-of select="@date"/></td>
                            <td><xsl:value-of select="@type"/></td>
                            <td><xsl:value-of select="@description"/></td>
                            <td><xsl:value-of select="@montant"/></td>
                        </tr>
                    </xsl:for-each>
                    
                </table>
            </body>
        </html>
        
    </xsl:template>
</xsl:stylesheet>