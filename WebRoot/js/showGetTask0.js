/*显示gettask接口数据*/
$(document).ready(function(){
            /* var t = $("#endtime").val(); */
            /* var data = {"date":t}; */
            
            var data = null; 
            var count = 0;
            var buttonId;
            var specimenNo;//样品编号
            $.ajax({
              dataType:"json",
              type: "POST",
              url: "servlet/gettask",
              data: data,
              success: function(jsonObject){
            	  
                  var s = "<table border='1'  height='100'>";
                 s += "<tr><td>添加部件</td><td width='140'><font size='4'>样品编号</font></td><td width='350'><font size='4'>样品名称</font></td><td width='100'><font size='4'>标准编号</font></td><td width='100'><font size='4'>样品数量</font></td><td width='100'><font size='4'>创建日期</font></td><td width='100'><font size='4'>状态</font></td></tr>";
                   $.each(jsonObject,function(key,value){
                     
                     if(count%6 == 0){
                        s+="<tr>";
                        s += "<td><button id=\"addPart\">添加</button></td>";
                        s += "<td>"+"<font size='4'>"+value+"</font>"+"</td>";
                        specimenNo = value;
                     }
                     else if(count%6 == 2){
						s += "<td>"+"<a href=\"selectItems0.jsp?no="+specimenNo+"&standard="+value+"\">"+value+"</td>";
                     }
                     else{
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