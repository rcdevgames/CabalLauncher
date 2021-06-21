/*###################### ie의 PNG 이미지 표현 함수 ###########################*/
function setPng24(obj) {
    obj.width=obj.height=1;
    obj.className=obj.className.replace(/\bpng24\b/i,'');
    obj.style.filter =
    "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+ obj.src +"',sizingMethod='image');"
    obj.src='image/blank.html';
    return '';
}

/*###################### rollover ###########################*/
function rollover(imgsrc){
		var imgtxt = imgsrc.src;
		imgsrc.src = imgtxt.replace("_off","_on");
	}
	
	function rollout(imgsrc){
		var imgtxt = imgsrc.src;
		imgsrc.src = imgtxt.replace("_on","_off");
	}

/*###################### flash ###########################*/
function FlashLoad(sUrl, nWidth, nHeight)
{
    document.writeln('<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="mFlash" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="' + nWidth + '" height="' + nHeight + '"> <param name="allowScriptAccess" value="always" /><param name="movie" value="' + sUrl + '"><PARAM NAME="Menu" VALUE="false"><param name="quality" value="high"><PARAM name="wmode" value="transparent"><embed src="' + sUrl + '" quality="high" pluginspage="https://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="' + nWidth + '" height="' + nHeight + '" ></embed></object>');
}

function FlashLoadUniqueName(name,sUrl, nWidth, nHeight) {
    document.writeln('<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="' + name + '" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="' + nWidth + '" height="' + nHeight + '"> <param name="allowScriptAccess" value="always" /><param name="movie" value="' + sUrl + '"><PARAM NAME="Menu" VALUE="false"><param name="quality" value="high"><PARAM name="wmode" value="transparent"><embed src="' + sUrl + '" quality="high" pluginspage="https://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="' + nWidth + '" height="' + nHeight + '" ></embed></object>');
}

function FlashTpmodeLoad(sUrl, nWidth, nHeight)
{
	document.writeln('<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="mFlash" codebase="https://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="'+nWidth+'" height="'+nHeight+'"><param name="movie" value="'+sUrl+'"><PARAM NAME="Menu" VALUE="false"><param name="quality" value="high"><PARAM name="wmode" value="transparent"><embed src="'+sUrl+'" quality="high" pluginspage="https://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent" width="'+nWidth+'" height="'+nHeight+'"></embed></object>');  	
}

function OpaqueFlashLoad(sUrl, nWidth, nHeight)
{
	document.writeln('<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="mFlash" codebase="https://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="'+nWidth+'" height="'+nHeight+'"><param name="movie" value="'+sUrl+'"><PARAM NAME="Menu" VALUE="false"><param name="quality" value="high"><PARAM name="wmode" value="transparent"><embed src="'+sUrl+'" quality="high" pluginspage="https://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="opaque" width="'+nWidth+'" height="'+nHeight+'"></embed></object>');  	
}

function BGMLoad(sUrl, nWidth, nHeight) {
    return "";
}

function ObjectLoad(sID, sUrl)
{	
	document.writeln('<OBJECT ID="'+sID+'" width="0" height="0" codebase="'+sUrl+'" CLASSID="CLSID:FD1B28AD-5024-45E8-9013-54B8FDB9D740" VIEWASTEXT></OBJECT>');
}
function MovieLoad(sUrl, nWidth, nHeight)
{
	document.writeln('<object width="'+nWidth+'" height="'+nHeight+'" classid="clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95" name="WSMediaPlayer" id="WSMediaPlayer" style="FILTER: xray()"  VIEWASTEXT> '+
	' <param name="Filename" value="'+sUrl+'"> ' +
	' <PARAM NAME="ShowControls" VALUE="true"> ' +
	' <PARAM NAME="Menu" VALUE="false"> ' +
	' <PARAM NAME="AutoRewind" VALUE="True"> ' +
	' <PARAM NAME="AutoStart" VALUE="-1"> ' +
	'<param name="allowScriptAccess" value="always" />' +
	' <embed src="'+ sUrl + '" width="'+nWidth+'" height="'+nHeight+' style="FILTER: xray()"></embed></object> ' )
}

function MovieLoadToDiv(sUrl, nWidth, nHeight) {
    return ('<object width="' + nWidth + '" height="' + nHeight + '" classid="clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95" name="WSMediaPlayer" id="WSMediaPlayer" style="FILTER: xray()"  VIEWASTEXT> ' +
	' <param name="Filename" value="' + sUrl + '"> ' +
	' <PARAM NAME="ShowControls" VALUE="true"> ' +
	' <PARAM NAME="Menu" VALUE="false"> ' +
	' <PARAM NAME="AutoRewind" VALUE="True"> ' +
	' <PARAM NAME="AutoStart" VALUE="-1"> ' +
	'<param name="allowScriptAccess" value="always" />' +
	' <embed src="' + sUrl + '" width="' + nWidth + '" height="' + nHeight + ' style="FILTER: xray()"></embed></object> ')
}

/*###################### flash ###########################*/
function flashWrite(url, w, h, vars, win, alt, id) {
    if (vars == null) vars = "";
    if (win == null) win = "opaque";

    var objStr = "     <object ";

    if (/MSIE/.test(navigator.userAgent)) {
        objStr += "classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'  codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0'";
        objStr += "     id='" + id + "' style='width:" + w + "px; height:" + h + "px;'>";
        objStr += "    <param name='base' value='.' >";
        objStr += "    <param name='showLiveConnect' value='true' >";
        objStr += "    <param name='allowScriptAccess' value='always' >";
        objStr += "    <param name='movie' value='" + url + "' >";
        objStr += "    <param name='FlashVars' value='" + vars + "' >";
        objStr += "    <param name='wmode' value='" + win + "' >";
        objStr += "    <param name='menu' value='false' >";
        objStr += "    <param name='quality' value='high' >";
        objStr += "    <p" + ">" + alt + "</" + "p>";
        objStr += "  </" + "object>";
    }
    else {
        objStr = '<embed src="' + url + '" quality="high" wmode="' + win + '" FlashVars="' + vars + '"';
        objStr += ' width="' + w + '" height="' + h + '" name="' + id + '" id="' + id + '" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />';
    }
    document.write(objStr);
}

/*###################### flash ###########################*/
function flashWriteToDiv(url, w, h, vars, win, alt, id) {

    if (vars == null) vars = "";
    if (win == null) win = "opaque";

    var objStr = "     <object ";

    if (/MSIE/.test(navigator.userAgent)) {
        objStr += "classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'  codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0'";
        objStr += "     id='" + id + "' style='width:" + w + "px; height:" + h + "px;'>";
        objStr += "    <param name='base' value='.' >";
        objStr += "    <param name='showLiveConnect' value='true' >";
        objStr += "    <param name='allowScriptAccess' value='always' >";
        objStr += "    <param name='movie' value='" + url + "' >";
        objStr += "    <param name='FlashVars' value='" + vars + "' >";
        objStr += "    <param name='wmode' value='" + win + "' >";
        objStr += "    <param name='menu' value='false' >";
        objStr += "    <param name='quality' value='high' >";
        objStr += "    <p" + ">" + alt + "</" + "p>";
        objStr += "  </" + "object>";
    }
    else {
        objStr = '<embed src="' + url + '" quality="high" wmode="' + win + '" FlashVars="' + vars + '"';
        objStr += ' width="' + w + '" height="' + h + '" name="' + id + '" id="' + id + '" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />';
    }
    return objStr;
}