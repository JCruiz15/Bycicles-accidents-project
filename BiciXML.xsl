<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes" />

    <xsl:template match="/">
        <Accidentes>
            <xsl:apply-templates select="//accidents" />
        </Accidentes>
    </xsl:template>

    <xsl:template match="accidents">
        <xsl:for-each select="Accident">
            <xsl:sort select="Date" order="ascending"></xsl:sort>
            <Accidente>
                <xsl:attribute name="ID">
                    <xsl:value-of select="@Accident_Index"></xsl:value-of>
                </xsl:attribute>

                <Detalles>

                    <Fecha>
                        <xsl:value-of select="Week_day" /> - <xsl:value-of select="Date" /> - <xsl:value-of select="Time" />       
                    </Fecha>

                    <Vehiculos_involucrados>
                        <xsl:value-of select="N_vehicules" />        
                    </Vehiculos_involucrados>

                    <Damnificados> <xsl:value-of select="N_casualties" /> </Damnificados>

                </Detalles>

                <Condiciones>

                    <Tipo_Via>
                        <xsl:value-of select="Conditions/Road_type" />
                    </Tipo_Via>

                    <Limite_Velocidad>                        
                        <xsl:value-of select="Conditions/Speed_limit" />
                    </Limite_Velocidad>

                    <Via_Estado>
                        <xsl:value-of select="Conditions/Road_condition" />
                    </Via_Estado>

                    <Clima>
                        <xsl:value-of select="Conditions/Weather_conditions" />
                    </Clima>

                    <Luminosidad>
                        <xsl:value-of select="Conditions/Light_conditions" />
                    </Luminosidad>
                
                </Condiciones>

                <Ciclista>
                    <Genero>                   
                         <xsl:value-of select="Biker/biker_gender" />
                    </Genero>

                    <Edad>
                        <xsl:value-of select="Biker/biker_age_group" />
                    </Edad>

                    <Grado_Lesion>
                        <xsl:value-of select="Biker/biker_severity_injury" />
                    </Grado_Lesion>
                </Ciclista>
            </Accidente>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
