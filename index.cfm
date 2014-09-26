<cfsilent>
	<cfset seo_replacement 	= false />
	<cfset seo_navigation 	= "<dynamic-nav></dynamic-nav>" />
	<cfset seo_content	 	= "<div ng-view id='views'></div>" />
	
	<cfif StructKeyExists(url, "_escaped_fragment_")>
		<cfset seo_replacement = true />
		
		<!--- Get Navigation Information Once --->
		<cfset seo_sitemap = Application.SiteCFC.getSitemap(url._escaped_fragment_)>
		
		<!--- Get Navigation --->
		<cfset seo_navigation = Application.SiteCFC.getNavigation(url._escaped_fragment_, seo_sitemap)>
		
		<!--- Generate Breadcrumb String --->
		<cfset seo_breadcrumb = Application.SiteCFC.getBreadcrumb(url._escaped_fragment_, seo_sitemap)>
		
		<!--- Get Current Page Content --->
		<cfset seo_content = Application.SiteCFC.getContent(url._escaped_fragment_,seo_breadcrumb)>
	</cfif>
</cfsilent><!doctype html>
<html <cfif not seo_replacement>class="no-js" ng-app="angularCFApp"</cfif>>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

        <title>AngularCF</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Place favicon.ico and apple-touch-icon(s) in the root directory -->
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
		<link rel="icon" href="/favicon.ico" type="image/x-icon">

        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/main.css">
		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">

        <script src="js/vendor/modernizr-2.7.1.min.js"></script>
		
		<!--- jQuery --->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		
		<!-- Angular JS -->
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular.min.js"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular-route.js"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.14/angular-animate.min.js"></script>
		
		<!-- Central App/Controller -->
		<script type="text/javascript" src="/app/app.js"></script>
		<script type="text/javascript" src="/app/controllers.js"></script>
		<script type="text/javascript" src="/app/services.js"></script>
		<script type="text/javascript" src="/app/directives.js"></script>
		
		<script>
		  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

		  ga('create', 'UA-XXXXXXXX-X', 'sitename.com');
		</script>
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
		
		<div class="container">
			<header role="banner" id="header" ng-controller="DynamicNavigationDrtv">
				<cfoutput>#seo_navigation#</cfoutput>
			</header>
			
			<div id="content">
				<section role="main">
					<cfoutput>#seo_content#</cfoutput>
				</section>
			</div>
		</div>
    </body>
</html>
