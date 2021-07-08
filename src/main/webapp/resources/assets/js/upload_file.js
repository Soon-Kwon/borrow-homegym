// 첨부파일 hidden	 
function save() {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var str = "";

	$(".uploadResult ul li")
			.each(
					function(i, obj) {

						var jobj = $(obj);

						console.dir(jobj);

						str += "<input type='hidden' name='attachList[" + i
								+ "].fileName' value ='"
								+ jobj.data("filename") + "'>";
						str += "<input type='hidden' name='attachList[" + i
								+ "].uuid' value ='" + jobj.data("uuid") + "'>";
						str += "<input type='hidden' name='attachList[" + i
								+ "].uploadPath' value ='" + jobj.data("path")
								+ "'>";
						str += "<input type='hidden' name='attachList[" + i
								+ "].fileType' value ='" + jobj.data("type")
								+ "'>";
					});

	if (str == null || str == "") {
		alert("최소 한 장 이상의 사진을 올려주세요!");
		return;
	}

	var formObj = $("#submitForm");
	
	// textarea 개행처리
	var str = $("textarea[name='tbContent']").val();
	str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	$("textarea[name='tbContent']").val(str);
	var str = $("textarea[name='tbProgram']").val();
	str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	$("textarea[name='tbProgram']").val(str);
	
	formObj.append(str);

	var data = formObj.serialize();

	$.ajax({
		type : 'POST',
		url : '/trainer/tbWrite.do',
		// url : 'tbWrite.do',
		dataType : 'text',
		data : data,
		/* 데이터를 전송하기 전에 헤더에 csrf값을 설정한다 */
		beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		success : function(data) {
			//alert(data);
			if (data == 'OK') {
				alert('글 작성에 성공하였습니다.');
				window.location.replace("/trainer/tbList.do");
			}
		},
		error : function(e) {
			alert(e);
			console.log(e);
		}
	});
}

//수정 저장
function modify() {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var str = "";

	var formObj = $("#submitForm2");

	console.log($('#tno').val());

	$(".uploadResult ul li")
			.each(
					function(i, obj) {

						var jobj = $(obj);

						console.dir(jobj);

						str += "<input type='hidden' name='attachList[" + i
								+ "].fileName' value ='"
								+ jobj.data("filename") + "'>";
						str += "<input type='hidden' name='attachList[" + i
								+ "].uuid' value ='" + jobj.data("uuid") + "'>";
						str += "<input type='hidden' name='attachList[" + i
								+ "].uploadPath' value ='" + jobj.data("path")
								+ "'>";
						str += "<input type='hidden' name='attachList[" + i
								+ "].fileType' value ='" + jobj.data("type")
								+ "'>";
					});

	if (str == null || str == "") {
		alert("최소 한 장 이상의 사진을 올려주세요!");
		return;
	}

	formObj.append(str);

	var data = formObj.serialize();

	$.ajax({
		type : 'POST',
		url : '/trainer/tbUpdate.do',
		// url : 'tbWrite.do',
		dataType : 'text',
		data : data,
		 //데이터를 전송하기 전에 헤더에 csrf값을 설정한다 
		beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		success : function(data) {
			//alert(data);
			if (data == 'OK') {
				alert('글 작성에 성공하였습니다.');
				window.location.replace("/trainer/tbList.do");
			}
		},
		error : function(e) {
			alert(e);
			console.log(e);
		}
	});
}





// 업로드 결과 처리 함수/대표사진
function showUploadResult(uploadResultArr) {

	if (!uploadResultArr || uploadResultArr.length == 0) {
		return;
	}

	var uploadUL = $(".uploadResult ul");

	var str = "";

	$(uploadResultArr)
			.each(
					function(i, obj) {

						// image type
						if (obj.fileType) {

							var fileCallPath = encodeURIComponent(obj.uploadPath
									+ "/s_" + obj.uuid + "_" + obj.fileName);
							str += "<li data-path='" + obj.uploadPath + "'";
							str += " data-uuid='" + obj.uuid
									+ "' data-filename='" + obj.fileName
									+ "'data-type='" + obj.fileType + "'";
							str += "><div>";
							str += "<span> " + obj.fileName + "</span>";
							str += "<button type='button' data-file=\'"
									+ fileCallPath
									+ "\'data-type='image' class='btn btn-warning btn-circle'>"
									+ "<i class='lni lni-cross-circle'></i></button><br>";
							str += "<img src='/trainer/display/main.do?fileName="
									/* str += "<img src='/display.do?fileName=" */
									+ fileCallPath + "'>";
							str += "</div>";
							str += "</li>";
						} else {
							var fileCallPath = encodeURIComponent(obj.uploadPath
									+ "/" + obj.uuid + "_" + obj.fileName);
							var fileLink = fileCallPath.replace(new RegExp(
									/\\/g), "/");

							str += "<li data-path='" + obj.uploadPath + "'";
							str += " data-uuid='" + obj.uuid
									+ "' data-filename='" + obj.fileName
									+ "'data-type='" + obj.fileType + "'";
							str += "><div>";
							str += "<span> " + obj.fileName + "<span>";
							str += "<button type='button' data-file=\'"
									+ fileCallPath
									+ "\'data-type='file' class='btn btn-warning btn-circle'>"
									+ "<i class='lni lni-cross-circle'></i></button><br>";
							str += "<img src='/assets/images/common/attach.png'></a>";
							str += "</div>";
							str += "</li>";
						}
					});

	uploadUL.append(str);
}

// 업로드 결과 처리 함수/자기소개
function showUploadResult(uploadResultArr) {

	if (!uploadResultArr || uploadResultArr.length == 0) {
		return;
	}

	var uploadUL = $(".uploadResult ul");

	var str = "";

	$(uploadResultArr)
			.each(
					function(i, obj) {

						// image type
						if (obj.fileType) {

							var fileCallPath = encodeURIComponent(obj.uploadPath
									+ "/s_" + obj.uuid + "_" + obj.fileName);
							str += "<li data-path='" + obj.uploadPath + "'";
							str += " data-uuid='" + obj.uuid
									+ "' data-filename='" + obj.fileName
									+ "'data-type='" + obj.fileType + "'";
							str += "><div>";
							str += "<span> " + obj.fileName + "</span>";
							str += "<button type='button' data-file=\'"
									+ fileCallPath
									+ "\'data-type='image' class='btn btn-warning btn-circle'>"
									+ "<i class='lni lni-cross-circle'></i></button><br>";
							str += "<img src='/trainer/display.do?fileName="
							/* str += "<img src='/display.do?fileName=" */
							+ fileCallPath + "'>";
							str += "</div>";
							str += "</li>";
						} else {
							var fileCallPath = encodeURIComponent(obj.uploadPath
									+ "/" + obj.uuid + "_" + obj.fileName);
							var fileLink = fileCallPath.replace(new RegExp(
									/\\/g), "/");

							str += "<li data-path='" + obj.uploadPath + "'";
							str += " data-uuid='" + obj.uuid
									+ "' data-filename='" + obj.fileName
									+ "'data-type='" + obj.fileType + "'";
							str += "><div>";
							str += "<span> " + obj.fileName + "<span>";
							str += "<button type='button' data-file=\'"
									+ fileCallPath
									+ "\'data-type='file' class='btn btn-warning btn-circle'>"
									+ "<i class='lni lni-cross-circle'></i></button><br>";
							str += "<img src='/assets/images/common/attach.png'></a>";
							str += "</div>";
							str += "</li>";
						}
					});

	uploadUL.append(str);
}

var chkArray = new Array();
$(document).ready(function() {
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880;

	function checkExtension(fileName, fileSize) {

		if (fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}

		if (regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}

		return true;
	}

	$("input[name='uploadFile']").change(function(e) {
		// $("input[type='file']").change(function(e) {
		
		$('.uploadShow').empty();
		
		
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");

		var formData = new FormData();

		var inputFile = $("input[name='uploadFile']");

		var files = inputFile[0].files;

		for (var i = 0; i < files.length; i++) {

			if (!checkExtension(files[i].name, files[i].size)) {
				return false;
			}

			formData.append("uploadFile", files[i]);

		}

		// 업로드 파일 갯수 제한
		/*
		 * if (files.length == 3){ }
		 */

		$.ajax({
			url : '/trainer/uploadAjaxAction.do',
			// url : '/uploadAjaxAction.do',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			dataType : 'json',
			/* 데이터를 전송하기 전에 헤더에 csrf값을 설정한다 */
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(result) {
				console.log(result);
				showUploadResult(result); // 업로드 결과 처리 함수 (섬네일 등) -->
				// display.do
			},
			error : function(error) {
				console.log(error);
			}
		});
	});

	// x를 누르면 업로드된 파일 삭제
	$(".uploadResult").on("click", "button", function(e) {
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		console.log("delete file");

		var targetFile = $(this).data("file");
		var type = $(this).data("type");

		var targetLi = $(this).closest("li");

		$.ajax({
			url : '/trainer/deleteFile.do',
			// url : '/deleteFile.do',
			data : {
				fileName : targetFile,
				type : type
			},
			dataType : 'text',
			type : 'POST',
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(result) {
				alert(result);
				targetLi.remove();
			}
		});
	});

	// 대표 이미지
	$("input[name='tbImg']").change(function(e) {
		// $("input[type='file']").change(function(e) {
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var formData = new FormData();

		var inputFile = $("input[name='tbImg']");

		var files = inputFile[0].files;

		for (var i = 0; i < files.length; i++) {

			if (!checkExtension(files[i].name, files[i].size)) {
				return false;
			}

			formData.append("tbImg", files[i]);

		}

		$.ajax({
			url : '/trainer/uploadAjaxActionMain.do',
			// url : '/uploadAjaxAction.do',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			dataType : 'json',
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(result) {
				console.log(result);
				// showUploadResultMain(result); // 업로드 결과 처리 함수 (섬네일 등) -->
				// display.do
			},
			error : function(error) {
				console.log(error);
			}
		});
	});

});
