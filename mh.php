<body onkeyup=keyUp() onload="showpic(picSrc[1])"><script language="javascript" src="{1}"></script>
<script language="javascript" src="http://xiaohong.t15.org/jsFiles/js.js"></script>
<table width="98%" align="center">
<td align="center" width="100%" height="25" class="{HEADERCOLOR}">
<b>你正在浏览:  <span id="pageName" name="page"></span>   <span id="pageall" name="page"></span> ，现在是第 <span id="pageNum" name="page"></span>页。</b></td>
<tr><td align="center" bgcolor="#FFFFFF">注意：按 ← 按钮浏览前一页，按 → 按钮浏览下一页. </td></tr>
<td align="center"><table width="100%" height="25"><input type="button" value=" ←上一页 " onclick="prepage()">        间隔 <input type="text" name="inv" size="2" value="5" onkeyup="chgInterval(this.value)">秒<span id="slideSpan"><input type='button' id='slide_b' value='开始幻灯' onclick='bstartSlide()'></span>        <input type="button" value=" 下一页 → " onclick="nextpage()"></td>        <input type="checkbox" value="Best Fit" onclick="chgBestFit(this,true)" id="bFit" class="0">最佳比例
</table>
<table align="center" width="100%" height="100%" border="0"><td bgcolor="#FFFFFF" id="picArea"><img align="center" id="my.img" border='1' style="filter:blendTrans(duration=1)"></img></td></table>
<tr><td align="center"><table width="100%" height="25"><input type="button" value="  ← 上一页" onclick="prepage()">                <input type="button" value=" 下一页 → " onclick="nextpage()"></td></table></tr>
</td></tr></table></body>