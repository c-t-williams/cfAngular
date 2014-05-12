<cfcomponent displayname="Site CFC" output="true" hint="AngularCF Site Component">
	<cffunction name="getSitemap" returntype="array">
		<cfargument name="path" type="string" required="true">
		
		<cfset var arrReturn = ArrayNew(1)>

		<cfhttp url="#Application.APIURL#/api/navigation.cfm"></cfhttp>
		
		<cfif StructKeyExists(cfhttp, "status_code") AND cfhttp.status_code EQ "200">
			<cftry>
				<cfset arrReturn = DeserializeJSON(cfhttp.filecontent)>

				<cfcatch type="any"><cfdump var="#cfcatch#"></cfcatch>
			</cftry>
		</cfif>
		
		<cfdump var="#cfhttp.filecontent#">
		
		<cfreturn arrReturn>
	</cffunction>
	
	<cffunction name="getNavigation" returntype="string">
		<cfargument name="path" type="string" required="true">
		<cfargument name="sitemap" type="array" required="true">
		
		<cfset var strReturn = "">
		<cfset var intIndex = 0>

		<cfif ArrayLen(sitemap)>
			<cfset strReturn = strReturn & '<nav role="navigation"><ul>'>
			
			<cfloop from="1" to="#ArrayLen(sitemap)#" index="intIndex">
				<cfif sitemap[intIndex].PATH EQ path>
					<cfset strReturn = strReturn & '<li class="active"><a href="/##!#sitemap[intIndex].PATH#">#sitemap[intIndex].NAME#</a></li>'>
				<cfelse>
					<cfset strReturn = strReturn & '<li><a href="/##!#sitemap[intIndex].PATH#">#sitemap[intIndex].NAME#</a></li>'>
				</cfif>
			</cfloop>
			
			<cfset strReturn = strReturn & '</ul></nav>'>
		</cfif>

		<cfreturn strReturn>
	</cffunction>
	
	<cffunction name="getContent" returntype="string">
		<cfargument name="path" type="string" required="true">
		<cfargument name="breadcrumb" type="string" required="true">
		
		<cfset var strReturn = "">
		<cfset var stcJSON = StructNew()>
	
		<cfhttp url="#Application.APIURL#/api/content.cfm?path=#URLEncodedFormat(path)#"></cfhttp>
		
		<cfif StructKeyExists(cfhttp, "status_code") AND cfhttp.status_code EQ "200">
			<cftry>
				<cfset strReturn = DeserializeJSON(cfhttp.filecontent).CONTENT>
				
				<!--- Check for Breadcrumbs --->
				<cfset strReturn = Replace(strReturn, "<dynamic-breadcrumb></dynamic-breadcrumb>", breadcrumb, "All")>

				<!--- Check for Repeater/Filter --->

				<cfcatch type="any"></cfcatch>
			</cftry>
		</cfif>
	
		<cfreturn strReturn>
	</cffunction>
	
	<cffunction name="getBreadcrumb" returntype="string">
		<cfargument name="path" type="string" required="true">
		<cfargument name="sitemap" type="array" required="true">
	
		<cfset var strReturn = "">
		
		<cfloop from="1" to="#ArrayLen(sitemap)#" index="intIndex">
			<cfif sitemap[intIndex].PATH EQ path>
				<cfset strReturn = strReturn & '<ul>'>
				<cfset strReturn = strReturn & '<li><a href="/##!/">Home</a></li>'>
				<cfset strReturn = strReturn & '<li class="active"><a href="/##!#sitemap[intIndex].PATH#">#sitemap[intIndex].NAME#</a></li>'>
				<cfset strReturn = strReturn & '</ul>'>
			</cfif>
		</cfloop>
		
		<cfreturn strReturn>
	</cffunction>
	
	<cffunction name="buildSitemapXML" returntype="void">
		<cfset var arrSitemap = This.getSitemap("/")>
		<cfset var strFilename = ExpandPath("/sitemap.xml")>
		<cfset var xmlReturn = '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'>
		
		<cfloop from="1" to="#ArrayLen(arrSitemap)#" index="intIndex">
			<cfset xmlReturn &= '	<url>'>	
			<cfset xmlReturn &= '		<loc>#Application.SiteURL#/##!#arrSitemap[intIndex].PATH#</loc>'>
			<cfset xmlReturn &= '	</url>'>
		</cfloop>
		
		<cfset xmlReturn &= '</urlset>'>

		<cfif FileExists(strFilename)>
			<cfset FileDelete(strFilename)>
		</cfif>

		<cffile action="write" file="#strFilename#" output="#xmlReturn#">
	</cffunction>
</cfcomponent>