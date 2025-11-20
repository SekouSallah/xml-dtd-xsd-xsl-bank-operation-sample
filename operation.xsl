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
                <h1>Relevé d'opération bancaire</h1>
                <ul>
                    <li>Compte N°<xsl:value-of select="releve/@RIB"/></li>
                    <li>Date d'extraction: <xsl:value-of select="releve/dateReleve"/></li>
                </ul>
                
                <table border="1" width="90%">
                    <h3>Liste des opérations de <xsl:value-of select="releve/operations/@dateDebut"/> au <xsl:value-of select="releve/operations/@dateFin"/></h3>
                    <tr>
                        <th>Date</th>
                        <th>Type</th>
                        <th>Description</th>
                        <th>Montant</th>
                    </tr>
                    <xsl:for-each select="releve/operations/operation">
                        <tr>
                            <td><xsl:value-of select="@date"/></td>
                            <td><xsl:value-of select="@type"/></td>
                            <td><xsl:value-of select="@description"/></td>
                            <td><xsl:value-of select="@montant"/></td>
                        </tr>
                    </xsl:for-each>
                    <tr>
                        <td colspan="3"><b>Total crédit</b></td>
                        <td colspan="1"><b><xsl:value-of select="sum(releve/operations/operation[@type='CREDIT']/@montant)"/></b></td>
                    </tr>
                    <tr>
                        <td colspan="3"><b>Total débit</b></td>
                        <td colspan="1"><b><xsl:value-of select="sum(releve/operations/operation[@type='DEBIT']/@montant)"/></b></td>
                        
                    </tr>
                </table>
            </body>
        </html>
        
    </xsl:template>
</xsl:stylesheet>