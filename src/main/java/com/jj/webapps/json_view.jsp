﻿<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page
		import="com.jj.job.optimizer.*"
		import="java.util.List"
%>
<%
	String jsonString = "{\n" +
			"    \"l8\": {\n" +
			"        \"l1_1\": [\n" +
			"            \"l1_1_1\",\n" +
			"            \"l1_1_2\"\n" +
			"        ],\n" +
			"        \"l1_2\": {\n" +
			"            \"l1_2_1\": 121\n" +
			"        }\n" +
			"    },\n" +
			"    \"l2\": {\n" +
			"        \"l2_1\": null,\n" +
			"        \"l2_2\": true,\n" +
			"        \"l2_3\": {}\n" +
			"    }\n" +
			"}";
	HiveQueryLogParser hqlp = new HiveQueryLogParser();
	List<String> log = hqlp.FileToList("D:\\hivelog.txt");
	String contents = hqlp.LogParser(log);
	jsonString = contents;
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
	<title>JSON Visualization</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta name="robots" content="index,follow" />

	<meta name="description"
		content="Simple, easy method to visually inspect a JSON-encoded string." />

	<meta name="keywords"
		content="json,visualize,pretty print,developer tool" />

	

	<link rel="stylesheet" type="text/css"
		href="./js/reset-fonts.css" />

	<link rel="stylesheet" type="text/css"
		href="./js/base.css" />

	<link rel="stylesheet" type="text/css" href="./js/default.css" />

	<script type="text/javascript"
		src="./js/yuiloader-dom-event.js"></script>

	<script type="text/javascript"
		src="./js/json-min.js"></script>

	<script type="text/javascript" src="./js/default-min.js"></script>

</head>
<body>

	<h1>
		<a href="http://www.json.org/"
			title="JavaScript Object Notation">JSON</a> Visualization
	</h1>

	<menu style="
		margin: 0px 0px 1em 0px;
		padding: 0px;
		float: left;
		width: 12em;">

		<h3 style="margin-top: 0px;">Input</h3>

		<p>
			<label>
				<input type="radio" name="jsonParser"
					id="jsonStrict" value="1" checked="checked" /> Strict JSON
			</label><br />

			<label>
				<input type="radio" name="jsonParser"
					id="jsonEval" value="0" /> Eval
			</label>
		</p>

		<h3>Output</h3>

		<p id="jsonOutputSet">
			<label>
				<input type="radio" name="jsonOutStyle"
					id="json2HTML" value="1" checked="checked" /> HTML
			</label><br />

			<label>
				<input type="radio" name="jsonOutStyle"
					id="json2JSON" value="0" /> JSON
			</label>

		</p>

		<h3>Options:</h3>

		<p id="jsonOptionSet" class="HTML">

			<label id="jsonTrunc_label">
				<input type="checkbox" id="jsonTrunc"
					value="1" checked="checked" /> Truncate long strings
			</label><br />

			<label id="jsonDate_label">
				<input type="checkbox" id="jsonDate"
					value="1" checked="checked" /> Detect encoded dates
			</label><br />

			<label id="jsonData_label">
				<input type="checkbox" id="jsonData"
					value="1" checked="checked" /> Detect data structures
			</label><br />

			<label id="jsonSpace_label">
				<input type="checkbox" id="jsonSpace" value="1" />
				Preserve whitespace
			</label>
		</p>

		<h3>Actions:</h3>

		<p>
			<button id="cmdRender">Render</button><br />
			<span id="loadCommands">
				<a id="cmdLoad">Load</a>
				<span id="reloadCommand">
					/ <a id="cmdReload">Reload</a>
				</span>
			</span>
			<span id="loadMessage" style="display: none;">
				Loading...
			</span><br />
			<a id="cmdValidate">Validate</a><br />
			<a id="cmdClear">Clear</a><br />
			<a id="cmdEncode">Re-encode</a><br />
			<a id="cmdRemoveCRLF">Remove Line Breaks</a><br />
			<a id="cmdDecodeURI">Decode URI</a><br />
			<a id="cmdTrim2JSON">Trim non-JSON</a><br />
			<span id="htmlCommands">
				<a id="cmdCollapse">Collapse</a> /
				<a id="cmdExpand">Expand</a> All<br />
			</span>
			<a id="cmdHelp" href="help.htm" target="help">Help</a><br />
			<a id="cmdBeer" href="beer.htm" target="beer">Beer Fund</a>
		</p>

		<code id="jsonLocation"></code>

	</menu>

	<div style="padding-left: 13em;">
		<h2 style="margin-top: 0px; font-size: 108%;">
			<label for="jsonInput">Input:</label>
			<small id="jsonSize"></small>
		</h2>
		<textarea id="jsonInput"
			rows="10" cols="50"
			placeholder="Paste your JSON here"
			spellcheck="false"
			autofocus="autofocus"
			><%=jsonString%></textarea>
<script type="text/javascript">
var jsonInput = "{
    "l8": {
        "l1_1": [
            "l1_1_1",
            "l1_1_2"
        ],
        "l1_2": {
            "l1_2_1": 121
        }
    },
    "l2": {
        "l2_1": null,
        "l2_2": true,
        "l2_3": {}
    }";
    
</script>
<!--input id="jsonInput" type="hidden" value = "\{1,2\}"></input-->

		<h2 style="font-size: 108%;">Output:</h2>
		<output
			style="display: block;"
			for="jsonInput cmdValidate"
			id="jsonValidateOutput"></output>
		<output
			style="display: block;"
			for="jsonInput jsonStrict jsonEval json2HTML json2JSON jsonTrunc jsonDate jsonData jsonSpace"
			id="jsonOutput"></output>
	</div>

	<footer>
		<address class="vcard" style="clear: both;">
			<span class="fn">Chris Nielsen</span><br />
			<a class="email" href="mailto:nielsen.chris@gmail.com">
				nielsen.chris@gmail.com
			</a>
		</address>

		<p>
			<small><time pubdate="pubdate">2011-03-30</time>: Collapse /
			Expand All functionality<br />
			See also: <a href="/regex/default.htm">Regular Expressions</a> and
			<a href="/xml/default.htm">XML Utilities</a></small>
		</p>
	</footer>


	<script type="text/javascript">
		if (
			window.location.hostname.substring(0, 6).toLowerCase() !== 'local.'
		) {
			var _gaq = _gaq || [];
			_gaq.push(['_setAccount', 'UA-5037510-1']);
			_gaq.push(['_trackPageview']);
			_gaq.push(['_trackPageLoadTime']);

			(function () {
				var s, ga = document.createElement('script');
				ga.type = 'text/javascript';
				ga.async = true;
				ga.src =
					((document.location.protocol === 'https:') ?
						'https://ssl' : 'http://www') +
						'.google-analytics.com/ga.js';
				s = document.getElementsByTagName('script')[0];
				s.parentNode.insertBefore(ga, s);
			}());
		}
	</script>

</body>
</html>
