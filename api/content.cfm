<cfsilent>
	<cfparam name="url.path" default="">

	<cfset stcReturn = StructNew()>
	<cfset stcReturn.success = false>
	<cfset stcReturn.content = "">
	<cfset stcReturn.path = url.path>

	<cfswitch expression="#url.path#">
		<cfcase value="/">
			<cfsavecontent variable="stcReturn.content">
				<article>
					<h1>Homepage</h1>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tempor pulvinar augue a pulvinar. Aliquam arcu lacus, aliquet nec blandit quis, placerat sit amet purus. Ut commodo augue vitae volutpat vestibulum. Sed tincidunt ipsum ac enim luctus dapibus. Mauris quis dolor in mauris sollicitudin dignissim. Donec ornare eleifend sodales. Quisque in turpis non eros sollicitudin egestas. Ut vitae risus ac nibh laoreet ultricies. Phasellus semper mauris nec leo malesuada, sed faucibus neque rhoncus.</p>

					<p>Vivamus interdum nibh et nulla egestas, in sodales mi tempus. Cras et pulvinar enim, cursus condimentum urna. Sed fringilla imperdiet nibh, quis congue enim dapibus non. Donec est neque, elementum ac gravida eget, tristique ut ligula. Integer semper sem feugiat leo fringilla tincidunt. Integer luctus risus arcu, nec tincidunt nunc consequat at. Etiam feugiat posuere fringilla. Pellentesque mauris purus, interdum sed lobortis non, eleifend vel risus. Sed tempor, eros sit amet commodo mollis, nisl sem consequat mauris, ac ullamcorper nibh nisi eu dui. Curabitur egestas nisl nec iaculis pellentesque. Pellentesque vitae sodales nulla.</p>

					<p>Nam dignissim, ligula vel fringilla posuere, elit orci condimentum elit, et gravida sem orci quis neque. Sed sagittis urna augue, ut molestie ligula bibendum a. Fusce ultrices, massa at aliquet gravida, elit nulla tempus velit, non gravida risus lacus et risus. In hac habitasse platea dictumst. Proin fermentum elit quam. Proin commodo metus ut imperdiet elementum. Quisque scelerisque adipiscing quam consequat elementum. Ut feugiat, ligula eu ullamcorper elementum, tellus metus consequat urna, dictum dapibus ipsum augue dictum elit. Vivamus dapibus quis justo nec ultricies. Nulla condimentum facilisis elit a tincidunt.</p>
				</article>
			</cfsavecontent>
		</cfcase>
		<cfcase value="/sample-page-1">
			<cfsavecontent variable="stcReturn.content">
				<nav role="breadcrumbs" ng-controller="DynamicBreadcrumbDrtv">
					<dynamic-breadcrumb></dynamic-breadcrumb>
				</nav>		
				
				<article>
					<h1>Sample page 1</h1>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tempor pulvinar augue a pulvinar. Aliquam arcu lacus, aliquet nec blandit quis, placerat sit amet purus. Ut commodo augue vitae volutpat vestibulum. Sed tincidunt ipsum ac enim luctus dapibus. Mauris quis dolor in mauris sollicitudin dignissim. Donec ornare eleifend sodales. Quisque in turpis non eros sollicitudin egestas. Ut vitae risus ac nibh laoreet ultricies. Phasellus semper mauris nec leo malesuada, sed faucibus neque rhoncus.</p>

					<p>Vivamus interdum nibh et nulla egestas, in sodales mi tempus. Cras et pulvinar enim, cursus condimentum urna. Sed fringilla imperdiet nibh, quis congue enim dapibus non. Donec est neque, elementum ac gravida eget, tristique ut ligula. Integer semper sem feugiat leo fringilla tincidunt. Integer luctus risus arcu, nec tincidunt nunc consequat at. Etiam feugiat posuere fringilla. Pellentesque mauris purus, interdum sed lobortis non, eleifend vel risus. Sed tempor, eros sit amet commodo mollis, nisl sem consequat mauris, ac ullamcorper nibh nisi eu dui. Curabitur egestas nisl nec iaculis pellentesque. Pellentesque vitae sodales nulla.</p>

					<p>Nam dignissim, ligula vel fringilla posuere, elit orci condimentum elit, et gravida sem orci quis neque. Sed sagittis urna augue, ut molestie ligula bibendum a. Fusce ultrices, massa at aliquet gravida, elit nulla tempus velit, non gravida risus lacus et risus. In hac habitasse platea dictumst. Proin fermentum elit quam. Proin commodo metus ut imperdiet elementum. Quisque scelerisque adipiscing quam consequat elementum. Ut feugiat, ligula eu ullamcorper elementum, tellus metus consequat urna, dictum dapibus ipsum augue dictum elit. Vivamus dapibus quis justo nec ultricies. Nulla condimentum facilisis elit a tincidunt.</p>
				</article>
			</cfsavecontent>
		</cfcase>
		<cfcase value="/sample-page-2">
			<cfsavecontent variable="stcReturn.content">
				<nav role="breadcrumbs" ng-controller="DynamicBreadcrumbDrtv">
					<dynamic-breadcrumb></dynamic-breadcrumb>
				</nav>
				
				<article>
					<h1>Sample page 2</h1>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tempor pulvinar augue a pulvinar. Aliquam arcu lacus, aliquet nec blandit quis, placerat sit amet purus. Ut commodo augue vitae volutpat vestibulum. Sed tincidunt ipsum ac enim luctus dapibus. Mauris quis dolor in mauris sollicitudin dignissim. Donec ornare eleifend sodales. Quisque in turpis non eros sollicitudin egestas. Ut vitae risus ac nibh laoreet ultricies. Phasellus semper mauris nec leo malesuada, sed faucibus neque rhoncus.</p>

					<p>Vivamus interdum nibh et nulla egestas, in sodales mi tempus. Cras et pulvinar enim, cursus condimentum urna. Sed fringilla imperdiet nibh, quis congue enim dapibus non. Donec est neque, elementum ac gravida eget, tristique ut ligula. Integer semper sem feugiat leo fringilla tincidunt. Integer luctus risus arcu, nec tincidunt nunc consequat at. Etiam feugiat posuere fringilla. Pellentesque mauris purus, interdum sed lobortis non, eleifend vel risus. Sed tempor, eros sit amet commodo mollis, nisl sem consequat mauris, ac ullamcorper nibh nisi eu dui. Curabitur egestas nisl nec iaculis pellentesque. Pellentesque vitae sodales nulla.</p>

					<p>Nam dignissim, ligula vel fringilla posuere, elit orci condimentum elit, et gravida sem orci quis neque. Sed sagittis urna augue, ut molestie ligula bibendum a. Fusce ultrices, massa at aliquet gravida, elit nulla tempus velit, non gravida risus lacus et risus. In hac habitasse platea dictumst. Proin fermentum elit quam. Proin commodo metus ut imperdiet elementum. Quisque scelerisque adipiscing quam consequat elementum. Ut feugiat, ligula eu ullamcorper elementum, tellus metus consequat urna, dictum dapibus ipsum augue dictum elit. Vivamus dapibus quis justo nec ultricies. Nulla condimentum facilisis elit a tincidunt.</p>
				</article>
			</cfsavecontent>
		</cfcase>
		<cfcase value="/partial-override-page">
			<cfset stcReturn.title = "This is a sample partial">
			<cfset stcReturn.subtitle = "Using the navigation overrides">
			<cfset stcReturn.content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tempor pulvinar augue a pulvinar. Aliquam arcu lacus, aliquet nec blandit quis, placerat sit amet purus. Ut commodo augue vitae volutpat vestibulum. Sed tincidunt ipsum ac enim luctus dapibus. Mauris quis dolor in mauris sollicitudin dignissim. Donec ornare eleifend sodales. Quisque in turpis non eros sollicitudin egestas. Ut vitae risus ac nibh laoreet ultricies. Phasellus semper mauris nec leo malesuada, sed faucibus neque rhoncus.</p>">
		</cfcase>
		<cfdefaultcase>
			<cfsavecontent variable="stcReturn.content">
				<nav role="breadcrumbs" ng-controller="DynamicBreadcrumbDrtv">
					<dynamic-breadcrumb></dynamic-breadcrumb>
				</nav>
				
				<article>
					<h1>Page not found (404)</h1>
					<h2>Well, this is awkward...</h2>
					<p>I am just guessing, but I think that the page you are looking for cannot actually be found.</p>
					<p>Sorry :-(</p>
				</article>
			</cfsavecontent>
		</cfdefaultcase>
	</cfswitch>
</cfsilent><cfoutput>#SerializeJSON(stcReturn)#</cfoutput>