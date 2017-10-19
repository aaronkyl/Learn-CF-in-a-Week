<cfcomponent>
    <cffunction name="convertStringToASCII" output="false" returntype="string" hint="Convert String to ASCII String" access="public">
        <cfargument name="stringToBeConverted" type="string" required="true" />
        <cfset var convertedString="" />
        <cfloop from="1" to="#len(arguments.stringToBeConverted)#" index="i">
            <cfset convertedString &= '&##' & asc(mid(arguments.StringToBeConverted,i,1)) & ';' />
        </cfloop>
        <cfreturn convertedString />
    </cffunction>
</cfcomponent>