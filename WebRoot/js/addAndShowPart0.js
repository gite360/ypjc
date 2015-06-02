function selectFunction() {// 下拉框
	/*
	 * standardNum = requestURLParameter('standardName'); standardNum =
	 * standardNum.split(",");
	 */
	standardNum = requestURLParameter('standardName').split(",");
	/* alert(standardNum1.length); */
	var s;
	$.each(standardNum, function(key, value) {
		s += "<option value=\"" + value + "\">" + value + "</option>";
	});
	return s;
}

var specimenName = requestURLParameter('specimenName');
var specimenNo = requestURLParameter('no');

function savePart() {// 保存部件

	var s1 = new Array();
	var s2 = new Array();
	/*
	 * $('#table1 tr td').each (function (){
	 * alert($("input[type='text']").val()); });
	 */
	$("input[type='text']").each(function() {
		/* alert(this.value); */
		if (this.value != "") {
			s1.push(this.value);
		}

		/* s1 += this.value; */
	});

	$("select").each(function() {
		/* alert(this.value); */
		/* s2 += this.value; */
		s2.push(this.value);
	});
	/* alert(s1.length); */
	/* alert(s2); */
	/* $("input[type='text']", $("#aaa")) */
	for (x in s1) {
		/* alert(NUM(x)+1); */
		x = parseInt(x);
		if (x % 2 == 0) {
			/*
			 * var y = x; y+=1; alert(y);
			 */
			var partInfo = {
				"no" : specimenName,
				"name" : specimenNo,
				"part" : s1[x],
				"num" : s1[x + 1],
				"standard" : s2[x]
			};
			/* alert(JSON.stringify(partInfo)); */
			$.ajax({
				dataType : "json",
				type : "POST",
				url : "servlet/setpart",
				data : partInfo,
				success : function(jsonObject) {
					if (jsonObject.status == "success") {
						alert("保存成功!");
					}
					if (jsonObject.status == "fail") {
						alert(jsonObject.status);
					}
				},

				error : function() {
					alert("没有收到后台的数据！");
				},
				complete : function() {
				},
				global : true,
			});
		}
		/* x++; */

	}
}

function showPart() {
	var data = null;
	var count = 1;
	var buttonId;

	var temp;
	$.ajax({
		dataType : "json",
		type : "POST",
		url : "servlet/getSpecimenPart",
		data : data,
		success : function(jsonObject) {
			var s;
			var partName;
			$(".showPartTr").remove();
			/*
			 * $.each($(".showPartTr"),function(){ alert("aa"); this.remove();
			 * });
			 */

			$.each(jsonObject, function(key, value) {
				if (count % 6 == 0) {
					s += "<td>" + value + "</td>";
					$(".showPart").parent().parent().after(s);
					s = null;
				} else if (count % 6 == 1) {

					s += "<tr class=\"showPartTr\">";
					s += "<td>" + value + "</td>";
					/*
					 * specimenNo = value; s += "<td>"+"<a
					 * href=\"selectItems0.jsp?no="+specimenNo+"&standard="+value+"\">"+value+"</td>";
					 * s += "<td><a
					 * href="+hrefToAddPart+"no="+specimenNo+"&specimenName="+specimenName+"&standardName="+value+"\>添加</td>";
					 */
				} else if (count % 6 == 5) {
					var hrefToselectItems = "selectItems0.jsp"
							+ $.query.empty().set("no", specimenNo).set("name",
									specimenName).set("part", partName).set(
									"standard", value).toString();
					/* alert(hrefToselectItems); */
					s += "<td><a href=" + hrefToselectItems + "\>" + value
							+ "</td>";
				} else if (count % 6 == 3) {
					s += "<td>" + value + "</td>";
					partName = value;
				} else {
					/*
					 * if(count%6 == 1){ specimenName = value; }
					 */
					s += "<td>" + value + "</td>";
				}
				count++;
			});
			/* $("#result").html(s); */
		},

		error : function() {
			alert("没有收到后台的数据！");
		},
		complete : function() {
		},
		global : true,
	});
}

/*
 * function addTr(){//添加行 $('#table1
 * tr:last').find("#addTr").parent().parent().after( "<tr><td>"+specimenNo+"</td><td>"+specimenName+"</td><td><input
 * type=\"text\" id=\"partName\" style=\"width:100px\"/></td><td><input
 * type=\"text\" id=\"partNo\" style=\"width:50px\"/></td><td><select
 * id=\"select0\">"+selectFunction()+"</select></td><td><input
 * type=\"button\" id=\"addTr\" onclick = \"addTr()\" value = \"添加部件\"/></td></tr>" ); }
 */

/*
 * function addTr(){//添加行 $('#table1
 * tr').eq(-2).find("#addTr").parent().parent().after( "<tr><td>"+specimenNo+"</td><td>"+specimenName+"</td><td><input
 * type=\"text\" id=\"partName\" style=\"width:100px\"/></td><td><input
 * type=\"text\" id=\"partNo\" style=\"width:50px\"/></td><td><select
 * id=\"select0\">"+selectFunction()+"</select></td><td><input
 * type=\"button\" id=\"addTr\" onclick = \"addTr()\" value = \"添加部件\"/><input
 * type=\"button\" id=\"deleteTr\" onclick = \"deleteTr()\" value = \"删除部件\"/></td></tr>" ); }
 */

/*
 * function deleteTr(){//删除行 $("#deleteTr").parent().parent().remove(); }
 */

$(document)
		.ready(
				function() {

					$("#tablePart")
							.on(
									"click",
									".addTr",
									function() {// 添加行
										$(this)
												.parent()
												.parent()
												.after(
														"<tr><td>"
																+ specimenNo
																+ "</td><td>"
																+ specimenName
																+ "</td><td><input type=\"text\" id=\"partName\" style=\"width:100px\"/></td><td><input type=\"text\" id=\"partNo\" style=\"width:50px\"/></td><td><select id=\"select0\">"
																+ selectFunction()
																+ "</select></td><td><input type=\"button\" class=\"addTr\" value = \"添加部件\"/></td><td><input type=\"button\" class=\"deleteTr\" value = \"删除部件\"/></td></tr>");
									});

					$("#tablePart").on("click", ".deleteTr", function() {// 删除行
						$(this).parent().parent().eq(0).remove();
					});
				});