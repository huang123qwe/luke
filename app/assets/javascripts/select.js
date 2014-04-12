/* 维度端前端网整理 http://www.weiduduan.com */
//var jq = $s.noConflict();
var selects = document.getElementsByTagName('select');
var isIE = (document.all && window.ActiveXObject && !window.opera) ? true : false;
function $s(id) {
	return document.getElementById(id);
}
function stopBubbling (ev) {	
	ev.stopPropagation();
}
function rSelects() {
	for (i=0;i<selects.length;i++){
		selects[i].style.display = 'none';
		select_tag = document.createElement('div');
			select_tag.id = 'select_' + selects[i].name;
			select_tag.className = 'select_box';
		selects[i].parentNode.insertBefore(select_tag,selects[i]);
		select_info = document.createElement('div');	
			select_info.id = 'select_info_' + selects[i].name;
			select_info.className='tag_select';
			select_info.style.cursor='pointer';
		//select_tag.appendChild(select_info);
		var p = document.getElementById('select_选择目的地');
		p.appendChild(select_info);
		select_ul = document.createElement('ul');	
			select_ul.id = 'options_' + selects[i].name;
			select_ul.className = 'tag_options';
			select_ul.style.position='absolute';
			select_ul.style.display='none';
			select_ul.style.zIndex='999';
		select_tag.appendChild(select_ul);
		//document.body.appendChild(select_ul);
		rOptions(i,selects[i].name);
		mouseSelects(selects[i].name);
		if (isIE){
			selects[i].onclick = new Function("clickLabels3('"+selects[i].name+"');window.event.cancelBubble = true;");
		}
		else if(!isIE){
			selects[i].onclick = new Function("clickLabels3('"+selects[i].name+"')");
			selects[i].addEventListener("click", stopBubbling, false);
		}		
	}
}

function rOptions(i, name) {
	var options = selects[i].getElementsByTagName('option');
	var abs = document.getElementById('options_选择目的地');
	var sba = document.getElementById('select_info_选择目的地');
	var options_ul = 'options_' + name;
	for (n=0;n<selects[i].options.length;n++){	
		option_li = document.createElement('li');
			option_li.style.cursor='pointer';
			option_li.className='open';
		//$s(options_ul).appendChild(option_li);
		abs.appendChild(option_li);
        //document.body.appendChild(option_li);
		option_text = document.createTextNode(selects[i].options[n].text);
		option_li.appendChild(option_text);
        
		option_selected = selects[i].options[n].selected;

		if(option_selected){
			option_li.className='open_selected';
			option_li.id='selected_' + name;
			//$s('select_info_' + name).appendChild(document.createTextNode(option_li.innerHTML));
			//document.body.appendChild(document.createTextNode(option_li.innerHTML));
			sba.appendChild(document.createTextNode(option_li.innerHTML));
		}
		
		option_li.onmouseover = function(){	this.className='open_hover';}
		option_li.onmouseout = function(){
			if(this.id=='selected_' + name){
				this.className='open_selected';
			}
			else {
				this.className='open';
			}
		} 
	
		option_li.onclick = new Function("clickOptions("+i+","+n+",'"+selects[i].name+"')");
	}
}

function mouseSelects(name){
	var sincn = 'select_info_' + name;
    var abs = document.getElementById('select_info_选择目的地');
	$s(sincn).onmouseover = function(){ if(this.className=='tag_select') this.className='tag_select_hover'; }
	$s(sincn).onmouseout = function(){ if(this.className=='tag_select_hover') this.className='tag_select'; }

	if (isIE){
		$s(sincn).onclick = new Function("clickSelects('"+name+"');window.event.cancelBubble = true;");
	}
	else if(!isIE){
		$s(sincn).onclick = new Function("clickSelects('"+name+"');");
		abs.addEventListener("click", stopBubbling, false);
		//$s('select_info_' +name).each(function(){
    //this.addEventListener("click",stopBubbling,false);
//});
	}

}

function clickSelects(name){
	var sincn = 'select_info_' + name;
	var sinul = 'options_' + name;	
	for (i=0;i<selects.length;i++){	
		if(selects[i].name == name){				
			if( $s(sincn).className =='tag_select_hover'){
				$s(sincn).className ='tag_select_open';
				$s(sinul).style.display = '';
			}
			else if( $s(sincn).className =='tag_select_open'){
				$s(sincn).className = 'tag_select_hover';
				$s(sinul).style.display = 'none';
			}
		}
		else{
			if($s('select_info_' + selects[i].name)){
				$s('select_info_' + selects[i].name).className = 'tag_select';
				$s('options_' + selects[i].name).style.display = 'none';
			}
		}
	}

}


function clickOptions(i, n, name){		
	var li = $s('options_' + name).getElementsByTagName('li');

	$s('selected_' + name).className='open';
	$s('selected_' + name).id='';
	li[n].id='selected_' + name;
	li[n].className='open_hover';
	$s('select_' + name).removeChild($s('select_info_' + name));

	select_info = document.createElement('div');
		select_info.id = 'select_info_' + name;
		select_info.className='tag_select';
		select_info.style.cursor='pointer';
	$s('options_' + name).parentNode.insertBefore(select_info,$s('options_' + name));

	mouseSelects(name);

	$s('select_info_' + name).appendChild(document.createTextNode(li[n].innerHTML));
	$s( 'options_' + name ).style.display = 'none' ;
	$s( 'select_info_' + name ).className = 'tag_select';
	selects[i].options[n].selected = 'selected';

}

window.onload = function(e) {
	bodyclick = document.getElementsByTagName('body').item(0);
	rSelects();
	bodyclick.onclick = function(){
		for (i=0;i<selects.length;i++){
			if($s('select_info_' + selects[i].name))
				$s('select_info_' + selects[i].name).className = 'tag_select';
			//$s('options_' + selects[i].name).style.display = 'none';
			var opt = document.getElementById('options_选择目的地');
			opt.style.display = 'none';
			//$s('options_' + selects[i].name).css('display','none');
		}
	}
} /* 维度端前端网整理 http://www.weiduduan.com */