var url = location.href;
var tmp1 = url.split("?")[1];
var tmp2 = tmp1.split(/[&|=]/);
var temp;
var dataNamePart = {
	"name" : $.query.get('name'),
	"part" : $.query.get('part')
};
console.log(dataNamePart);
var count = 0;
var href = "setSpecificWeightInfo1.jsp?" + tmp1 + "&";

$(document)
		.ready(
				function() {
					// alert(JSON.stringify(data));
					$
							.ajax({
								dataType : "json",
								type : "POST",
								url : "servlet/gettm",
								data : dataNamePart,
								success : function(jsonObject) {
									var s = "<table border='1'>";
									s += "<tr><td><font size='4'>检验项目</font></td><td><font size='4'>检验内容</font></td></tr>";
									$.each(jsonObject, function(key, value) {// element是data.emp
										// json数组之中的数据
										if (count % 1 == 0) {
											s += "<tr>";
										}
										s += "<td width=\"150\">"
												+ "<font size='4'>" + key
												+ "</font>" + "</td>";
										/*
										 * s += "<td>"+"<a
										 * href=\"shezhitiaomujutixinxi2.jsp?"+tmp2+"&"+value+
										 * "\">"+value+"</td>";
										 */
										/* value = encodeURI(value); */
										/* value = decodeURI(value); */
										/* href += value; */
										temp = value;
										temp = encodeURI(temp);
										s += "<td width=\"350\">" + "<a href="
												+ href + "content=" + temp
												+ " \">" + "<font size='4'>"
												+ value + "</font>" + "</td>";
										count++;
									});
									s += "</table>";
									$("#result").html(s);
								},
								complete : function() {
								},
								global : true,
								error : function() {
									alert("错误");
								}
							});
				});
