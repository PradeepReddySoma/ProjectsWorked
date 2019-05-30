
function writeActxViewer(sViewerVer, sLang, bDrillDown, bExport, bDisplayGroupTree, 
						bGroupTree, bAnimation, bPrint, bRefresh, bSearch, 
						bZoom, bSearchExpert, bSelectExpert, sParamVer) {
	document.write("<OBJECT ID=\"CRViewer\"");
	document.write("CLASSID=\"CLSID:6F0892F7-0D44-41C3-BF07-7599873FAA04\"");
	document.write("WIDTH=\"100%\" HEIGHT=\"99%\"");
	document.write("CODEBASE=\"" + gPath + viewerPath + "ActiveXControls/ActiveXViewer.cab#Version=" + sViewerVer + "\">");
	document.write("<PARAM NAME=\"LocaleID\" VALUE=\"" + sLang + "\">");
	document.write("<PARAM NAME=\"EnableDrillDown\" VALUE=" + bDrillDown + ">");
	document.write("<PARAM NAME=\"EnableExportButton\" VALUE=" + bExport + ">");
	document.write("<PARAM NAME=\"DisplayGroupTree\" VALUE=" + bDisplayGroupTree + ">");
	
	document.write("<PARAM NAME=\"EnableGroupTree\" VALUE=" + bGroupTree +">");
	document.write("<PARAM NAME=\"EnableAnimationControl\" VALUE=" + bAnimation + ">");
	document.write("<PARAM NAME=\"EnablePrintButton\" VALUE=" + bPrint + ">");
	document.write("<PARAM NAME=\"EnableRefreshButton\" VALUE=" + bRefresh + ">");
	document.write("<PARAM NAME=\"EnableSearchControl\" VALUE=" + bSearch + ">");
	
	document.write("<PARAM NAME=\"EnableZoomControl\" VALUE=" + bZoom + ">");
	document.write("<PARAM NAME=\"EnableSearchExpertButton\" VALUE=" + bSearchExpert + ">");
	document.write("<PARAM NAME=\"EnableSelectExpertButton\" VALUE=" + bSelectExpert + ">");
	document.write("</OBJECT>");

	document.write("<OBJECT ID=\"ReportSource\"");
	document.write("CLASSID=\"CLSID:84D35B77-75B4-4ff0-A2DE-6ED1B3EBE036\"");
	document.write("HEIGHT=\"1%\" WIDTH=\"1%\"");
	document.write("CODEBASE=\"" + gPath + viewerPath + "ActiveXControls/ActiveXViewer.cab#Version=" + sViewerVer + "\">");
	document.write("</OBJECT>");

	document.write("<OBJECT ID=\"ViewHelp\"");
	document.write("CLASSID=\"CLSID:9FD60A56-0184-4886-88A7-9943FB0DF9EA\"");
	document.write("HEIGHT=\"1%\" WIDTH=\"1%\"");
	document.write("CODEBASE=\"" + gPath + viewerPath + "ActiveXControls/ActiveXViewer.cab#Version=" + sViewerVer + "\">");
	document.write("</OBJECT>");
	
	document.write("<OBJECT ID=\"ReportParameter\"");
	document.write("CLASSID=\"CLSID:FDE0AFD2-68A3-4E1A-8A35-E2678B49042D\"");
	document.write("HEIGHT=\"1%\" WIDTH=\"1%\"");
	document.write("CODEBASE=\"" + gPath + viewerPath + "ActiveXControls/ActiveXViewer.cab#Version=" + sParamVer + "\">");
	document.write("</OBJECT>");
}

