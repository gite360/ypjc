/*显示gettask接口数据*/
$(document).ready(function(){
            /* var t = $("#endtime").val(); */
            /* var data = {"date":t}; */
            
            var data = null; 
            var count = 0;
            var buttonId;
            var specimenNo;//样品编号
            var specimenName;
            var hrefToAddPart = "addPart0.jsp?";
            $.ajax({
              dataType:"json",
              type: "POST",
              url: "servlet/gettask",
              data: data,
              success: function(jsonObject){
            	  
                  var s = "<table border='1'  height='100'>";
                 s += "<tr><td width='130'><font size='4'>样品编号</font></td><td width='300'><font size='4'>样品名称</font></td><td width='100'><font size='4'>标准编号</font></td><td width='80'>添加部件</td><td width='60'><font size='4'>样品数量</font></td><td width='60'><font size='4'>创建日期</font></td><td width='100'><font size='4'>状态</font></td></tr>";
                   $.each(jsonObject,function(key,value){
                     if(count%6 == 0){
                    	s+="<tr>";
                        s += "<td>"+"<font size='4'>"+value+"</font>"+"</td>";
                        specimenNo = value;
                     }
                     else if(count%6 == 2){
						s += "<td>"+"<a href=\"selectItems0.jsp?no="+specimenNo+"&standard="+value+"\">"+value+"</td>";
						s += "<td><a href="+hrefToAddPart+"no="+specimenNo+"&specimenName="+specimenName+"&standardName="+value+"\>添加</td>";
                     }
                     else{
                    	 if(count%6 == 1){
                    		 specimenName = value;
                    	 }
                         s += "<td>"+value+"</td>";
                     }   
                      
                    count++;
                   });  
                   s += "</table>";
                   $("#result").html(s);  
              },
              
              error: function(){
                  alert("没有收到后台的数据！");
              },
              complete:function(){
              },
              global:true,
            });
         /* }); */
   $("button").click(function(){
	   
   });
            
            
});