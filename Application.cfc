component output="false" {

	/* **************************** APPLICATION VARIABLES **************************** */
	THIS.name 					= "AngularCF";
	THIS.applicationTimeout		= createTimeSpan(0, 1, 0, 0);
	THIS.clientManagement 		= false;
	THIS.sessionManagement 		= true;
	THIS.sessionTimeout 		= createTimeSpan(0, 1, 0, 0);
	THIS.setClientCookies 		= true;
	THIS.timeout 				= 30; // seconds
	THIS.enablerobustexception 	= false;
	THIS.ormenabled 			= false;

	/* **************************** APPLICATION METHODS **************************** */
	/**
	@hint "Runs when ColdFusion receives the first request for a page in the application."
	*/
	public boolean function onApplicationStart() {

		if(!StructKeyExists(Application,"APIURL")) siteConfig();

		return true;
	}
	
	/**
	@hint "Runs when a request starts."
	@TargetPage "Path from the web root to the requested page."
	*/
	public boolean function onRequestStart(required string TargetPage) {
		param name="URL.ResetConfig" default="false";

		if(!StructKeyExists(Application,"APIURL") || URL.ResetConfig) siteConfig();
		
		return true;
	}

	/**
	@hint "Retrieves configuration information from database and inserts into Application scope"
	*/
	private void function siteConfig() {
		var LOCAL = StructNew();
	
		lock type="exclusive" timeout="10" scope="Application" {
			Application.APIURL		= "http://#CGI.HOST#";
			Application.SiteURL		= "http://#CGI.HOST#";
			Application.SiteCFC		= CreateObject("component", "cfcs.site");
		}

		//Build sitemap.xml
		lock type="exclusive" timeout="5" name="buildSitemap" {
			if(FileExists(ExpandPath("/sitemap.xml"))){
				FileDelete(ExpandPath("/sitemap.xml"));
			}
			
			FileWrite(ExpandPath("/sitemap.xml"), Application.SiteCFC.buildSitemapXML(Application.SiteCFC.getSitemap("/"), true));
		}

		return;
	}
}