/*
table ruler :: http://www.alistapart.com/articles/tableruler 
decorates tables with mouseover/mouseout functions
*/	
	
function tableruler() 
{
	if (document.getElementById && document.createTextNode) 
	{
	    var tables=document.getElementsByTagName('table');
	    for (var i=0;i<tables.length;i++)
	    {
			if(tables[i].className=='adminka') 
			{
				var trs=tables[i].getElementsByTagName('tr');
		        for(var j=1;j<trs.length;j++)		// 1st tr is header
		        {
					trs[j].onmouseover=function(){this.className='highlight';return false}
		            trs[j].onmouseout=function(){this.className='';return false}
				}
			}
		}
	}
}
window.onload=function(){tableruler();}