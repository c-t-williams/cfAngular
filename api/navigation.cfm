<cfscript>
	arrNavigation = ArrayNew(1);

	stcNavItem = StructNew();
	stcNavItem.name = "Home";
	stcNavItem.path = "/";
	stcNavItem.template = "";
	stcNavItem.children = ArrayNew(1);
	ArrayAppend(arrNavigation, stcNavItem);
	
	stcNavItem = StructNew();
	stcNavItem.name = "Sample page 1";
	stcNavItem.path = "/sample-page-1";
	stcNavItem.template = "";
	stcNavItem.children = ArrayNew(1);
	ArrayAppend(arrNavigation, stcNavItem);

	stcNavItem = StructNew();
	stcNavItem.name = "Sample page 2";
	stcNavItem.path = "/sample-page-2";
	stcNavItem.template = "";
	stcNavItem.children = ArrayNew(1);
	ArrayAppend(arrNavigation, stcNavItem);

	stcNavItem = StructNew();
	stcNavItem.name = "Partial Override Page";
	stcNavItem.path = "/partial-override-page";
	stcNavItem.template = "sample-partial.html";
	stcNavItem.children = ArrayNew(1);
	ArrayAppend(arrNavigation, stcNavItem);

</cfscript><cfoutput>#SerializeJSON(arrNavigation)#</cfoutput>