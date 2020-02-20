function showpic(url) {
	var oImg = document.getElementById("my.img");
    document.all.pageName.innerHTML = "<font color=\"#2047E6\">"+pageName +"</font>";
	document.all.pageall.innerHTML = "共<font color=red>" + pageCount +"</font>页";
	document.all.pageNum.innerHTML = "<font color=\"#FF9900\">"+ pageNum +"</font>";
	if (document.all){oImg.filters.blendTrans.apply();}
	if (document.all){oImg.filters.blendTrans.play();}
	MM_p[-1].src = picDir+url;
	chgBestFit(document.getElementById("bFit"),false);
	oImg.src = MM_p[-1].src;
	preNum = (pageNum > 1)?(pageNum - 1):pageCount;
	nextNum = (pageNum < pageCount)?(pageNum + 1):1;
	MM_p[0].src = picDir + picSrc[preNum];
	MM_p[1].src = picDir + picSrc[nextNum];
}

function nextpage() {
	pageNum = nextNum;
	picUrl = picSrc[pageNum];
	showpic(picUrl);
}

function prepage() {
	pageNum = preNum;
	picUrl = picSrc[pageNum];
	showpic(picUrl);
}

function startSlide() {
	nextpage();
	if (oInterval=="")
	oInterval = setInterval("startSlide()", interval);
}

function stopSlide() {
	window.clearInterval(oInterval);
	oInterval = "";
}

function bstartSlide() {
	document.all.slideSpan.innerHTML = "<input type='button' id='slide_b' value='停止幻灯' onclick='bstopSlide()'>";
	startSlide();
}

function bstopSlide() {
	document.all.slideSpan.innerHTML = "<input type='button' id='slide_b' value='开始幻灯' onclick='bstartSlide()'>";
	stopSlide();
}

function chgInterval(inv) {
	stopSlide();
	inv = parseFloat(inv);
	if(inv && (inv >0)) {
		interval = inv* 1000;
	}
	bstartSlide();
}

function keyUp(){
	switch(window.event.keyCode) {
		case 37:	prepage();	break;
		case 39:	nextpage();break;
	}
}

function bestFit(obj,chg) {
	var fited = false;
	var oImg = document.getElementById("my.img");
	var bWidth, bHeight;
	 bWidth = screen.availWidth-50;
	 bHeight = screen.availHeight-300;
	var nWidth, bHeight;
	nWidth = MM_p[-1].width;
	nHeight = MM_p[-1].height;
	picRate = nWidth/nHeight;
	if(chg) {
		if(nWidth > bWidth){
			oImg.width = bWidth;
			oImg.heith = bWidth / picRate;
			fited = true;
		}
		if(nHeight > bHeight){
			oImg.height = bHeight;
			oImg.width = bHeight * picRate;
			fited = true;
		}
	}
	if(fited == false) {
		oImg.width = nWidth;
		oImg.height = nHeight;
	}
}

function chgBestFit(obj, chgtip) {
	var chg;
	if(chgtip) {
		if(obj.value == "最佳比例") obj.value = "原始比例";
		else obj.value = "最佳比例";
	}
	{
		if(obj.value == "最佳比例") chg = true;
		else chg = false;
	}
	bestFit(obj,chg);
}