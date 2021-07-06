/*
 * 리뷰작성시 사용되는 즉시실행함수
 * ajax호출을 담당한다.
 * review는 사용자가 작성한 리뷰의 정보를 받고, callback과 error로 받은 함수를 결과로 알려준다.*/
	var reviewService = (function(){
		
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
	
	// 리뷰 등록시 호출되는 add함수
	function add(review, callback, error){
		
		$.ajax({
			type: 'post',
			url: '/reviews/new.do',
			data: JSON.stringify(review),
			contentType: "application/json; charset=utf-8",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
            },
			success: function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	// 리뷰 목록을 보여줄때 호출되는 getList함수
	function getList(param, callback, error){
		
		// param으로 게시물번호와 페이지를 객체로 전달받아 json 목록을 호출한다.
		var hId = param.hId;
		var page = param.page || 1;
		
		$.getJSON("/reviews/pages/" + hId + "/" + page + ".do",
				function(data){
			if(callback){
				// 댓글 목록만 가져올 경우에 사용 callback(data);
				callback(data.reviewCnt, data.list);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();				
			}
		});
	}
	
	// 리뷰 삭제
	function remove(reviewId, callback, error){
		
		$.ajax({
			type: 'delete',
			url: '/reviews/' + reviewId + '.do',
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
            },
			success: function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr, status, err){
				if(error){
					error(err);
				}
			}
		});
	}
	
	// 리뷰 수정
	function update(review, callback, error){
		
		$.ajax({
			type: 'put',
			url: '/reviews/' + review.reviewId + '.do',
			data: JSON.stringify(review),
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
            },
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr, status, err){
				if(error){
					error(err);
				}
			}
		});
	}
	
	// 특정 리뷰 한 개 정보 가져오기
	function get(reviewId, callback, error){
		
		$.get("/reviews/" + reviewId + ".do", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	// 리뷰 평점 
	function getScore(hId, callback, error){
		
		$.get("/homegym/score/" + hId + ".do", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				console.log(err);
				error();
			}
		});
	}

	// 시간 처리
	function displayTime(timeValue){
	
		var today = new Date();
		var gap = today.getTime() - timeValue; // 24시간 안에 쓴 글인지 확인
		
		var dateObj = new Date(timeValue);
		var str = "";
		
		if(gap < (1000 * 60 * 60 * 24)){
			
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			//var ss = dateObj.getSeconds(); // 초 단위는 안보여주기
			
			return [(hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi].join('');
				//':', (ss > 9 ? '' : '0')+ ss].join('');
		}else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth()는 0이 1월을 의미
			var dd = dateObj.getDate();
			
			return [yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd].join('');
		}
	};
	
	return{
		add: add,
		getList: getList,
		remove: remove,
		update: update,
		get: get,
		getScore: getScore,
		displayTime: displayTime
	};
})();