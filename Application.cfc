<cfcomponent displayname="Application" output="true" hint="AngularCF Application File">

	<!--- Set up the application. --->
	<cfset THIS.Name 				= "AngularCF" />
	<cfset THIS.ApplicationTimeout 	= CreateTimeSpan( 0, 1, 0, 0 ) />
	<cfset THIS.SessionManagement 	= true />
	<cfset THIS.SessionTimeout 		= CreateTimeSpan( 0, 1, 0, 0 ) />
	<cfset THIS.SetClientCookies 	= true />

	<!--- Define the page request properties. --->
	<cfsetting requesttimeout="20" showdebugoutput="false" enablecfoutputonly="false" />

	 <cffunction name="OnApplicationStart" access="public" returntype="boolean" output="false" hint="Fires when the application is first created.">
		<cfset Application.APIURL		= "http://#CGI.HOST#" />
		<cfset Application.SiteURL		= "http://#CGI.HOST#" />
		<cfset Application.SiteCFC		= CreateObject("component", "cfcs.site") />

		<cfreturn true />
	</cffunction>
</cfcomponent>