<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>Accidentes</title>
                <style>

                     html, body {
                        height: 100%;
                      }
                      div{
                        padding-right: 15px;
                        padding-left: 15px;
                        padding-bottom: 30px;

                    }
                    th{text-align: center;}

                      #tableContainer-1 {
                        height: 100%;
                        width: 80%;
                        display: table;
                      }
                      #tableContainer-2 {
                        vertical-align: middle;
                        display: table-cell;
                        height: 100%;
                      }
                </style>
            </head>
            <body>
                <div class="tableContainer-1">
                    <div class="tableContainer-2">
                        <h1 class="text-center">Accidentes de bicicletas en Reino Unido</h1>
                        <table class="table table-bordered table-striped table-responsive mx-10px">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Index</th>
                                    <th scope="col">N_vehicules</th>
                                    <th scope="col">N_casualties</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Time</th>
                                    <th scope="col">Week_day</th>
                                    <th scope="col">Speed limit</th>
                                    <th scope="col">Road Conditions</th>
                                    <th scope="col">Road Type</th>
                                    <th scope="col">Weather Conditions</th>
                                    <th scope="col">Light Conditions</th>
                                    <th scope="col">Biker gender</th>
                                    <th scope="col">Biker age group</th>
                                    <th scope="col">Biker severity injury</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:apply-templates select="/accidents"/>
                            </tbody>
                        </table>
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="/accidents">
        <xsl:for-each select="Accident">
            <xsl:sort select="Date" order="ascending"/>
            <tr>
                <th scope="col"><xsl:value-of select="position()"/></th>
                <td><xsl:value-of select="@Accident_Index"/></td>
                <td><xsl:value-of select="N_vehicules"/></td>
                <td><xsl:value-of select="N_casualties"/></td>
                <td><xsl:value-of select="Date"/></td>
                <td><xsl:value-of select="Time"/></td>
                <td><xsl:value-of select="Week_day"/></td>
                <td><xsl:value-of select="Conditions/Speed_limit"/></td>
                <td><xsl:value-of select="Conditions/Road_conditions"/></td>
                <td><xsl:value-of select="Conditions/Road_type"/></td>
                <td><xsl:value-of select="Conditions/Weather_conditions"/></td>
                <td><xsl:value-of select="Conditions/Light_conditions"/></td>
                <td><xsl:value-of select="Biker/biker_gender"/></td>
                <td><xsl:value-of select="Biker/biker_age_group"/></td>
                <td><xsl:value-of select="Biker/biker_severity_injury"/></td>
            </tr>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
