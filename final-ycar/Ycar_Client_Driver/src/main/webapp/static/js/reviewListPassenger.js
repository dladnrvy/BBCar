$(document).ready(function(){

	//현재 세션에서 p_idx 구하기
    var p_idx = $('#p_idx').val();
	
    //리뷰 리스트 로딩 
    reviewList(p_idx);

	//수정 폼 모달 보이기 
	$('#editReviewModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget); 
	  
	  var rv_idx = button.data('id');
	  var nickname = button.data('nickname'); 
	  var star = button.data('star');
	  var content = button.data('content'); 
	  
	  var modal = $(this);
	  modal.find('#eRv_idx').val(rv_idx);
	  modal.find('#eNickname').val(nickname);
	  modal.find('#eStarRate').val(star); 
	  modal.find('#eContent').val(content);
	  modal.find('#eP_idx').val(p_idx);
	  
	})
	
	//수정 폼 모달 숨기기
	$('#editReviewModal').on('hide.bs.modal', function (e) {
		$(this).find('.modal-body form')[0].reset(); 
			//폼 초기화 : 이후 다시 열어도 폼이 비워져 있도록!
	});
	
})

//나의 후기 리스트 출력 + //내가 작성한 후기 리스트 출력 
function reviewList(p_idx) {
	$.ajax({
		url: 'http://localhost:8080/par/review/passenger/'+p_idx,
		type: 'GET',
		success : function(data) {
			console.log('첫번쩨 리스트 성공'+data);
			
			var output ='';
			var html ='';
			
			for(var i=0; i<data.length; i++) {
				
				//리스트에 내용 없을때
				if(data[i].writer=="운전자" && data[i].content != null) {
					
					output += '<div class="col-sm-6">';
					output += '<div class="card">';
					output += '<div class="card-header">★';
					output += data[i].star;
					output += '</div>';
					output += '<div class="card-body">';
					output += '<blockquote class="blockquote mb-0">';
					output += '<p>'+data[i].content+'</p>';
					output += '<footer class="blockquote-footer"><cite title="Source Title">'+data[i].d_nickname+'</cite></footer>';
					output += '</blockquote>';
					output += '</div>';
					output += '</div>';
					output += '</div>';	
				} else if(data[i].writer=="탑승자" && data[i].content != null) {
					
					html += '<div class="col-sm-6">';
					html += '<div class="card">';
					html += '<div class="card-header">★';
					html += data[i].star;
					html += '</div>';
					html += '<div class="card-body">';
					html += '<blockquote class="blockquote mb-0">';
					html += '<p>'+data[i].content+'</p>';
					html += '<footer class="blockquote-footer"><cite title="Source Title">'+data[i].p_nickname+'</cite></footer>';
					html += '<button data-toggle="modal" data-target="#editReviewModal" data-id="'+data[i].rv_idx+'" data-nickname="'+data[i].p_nickname+'" data-star="'+data[i].star+'" data-content="'+data[i].content+'" class="btn btn-primary rvBtn">리뷰수정</button>';
					html += '<button onclick="deleteReview('+data[i].rv_idx+', '+p_idx+')" class="btn btn-primary rvBtn">리뷰삭제</button>';
					html += '</blockquote>';
					html += '</div>';
					html += '</div>';
					html += '</div>';		
				} else {
					
				}
			}
			$('#reviewListByDrivers').html(output);
			$('#reviewWrittenByMe').html(html);
		}, 
		error : function(e) {
			console.log('후기 리스트 실패'+e);
		}
	})
}

//후기 수정
function editReview() {
	var rv_idx = $('#eRv_idx').val();
	var p_idx = $('#eP_idx').val();
	console.log('리뷰 수정 시작 01'+rv_idx);
	
	$.ajax({
		url : 'http://localhost:8080/par/review/passenger/'+rv_idx,
		type: 'PUT',
		data : JSON.stringify({
			rv_idx : rv_idx,
			p_idx : p_idx,
			content : $('#eContent').val(),
			star : $('#eStarRate').val()
		}),
		contentType : 'application/json;charset=utf-8;',
		success : function(data) {
			alert(data+'개의 후기가 수정 성공인디?');
			$('#editReviewModal').modal('hide');
			reviewList(p_idx);
		},
		error : function(e) {
			console.log('수정 실패얌 ㅠㅠ');
		}
	})
	
}

//내가 작성한 후기 삭제
function deleteReview(rv_idx, p_idx) {
	
	if(confirm('삭제한 후기는 복구가 불가능합니다. 정말 삭제하시겠습니까?')) {
		$.ajax({
			url : 'http://localhost:8080/par/review/passenger/'+rv_idx+'/p_idx/'+p_idx,
			type: 'DELETE',
			/*contentType : 'applicaion/json;charset=utf-8;',
			data : JSON.stringify({
				p_idx : p_idx
			}),*/
			success : function(data) {
				console.log('탑승자의 후기 삭제 성공'+data);
				if(data>0) {
					alert(data+'개의 후기가 성공적으로 삭제되었습니다.');
					reviewList(p_idx);
				}
			},
			error : function(e) {
				console.log('탑승자의 후기 삭제 실패 ㅠㅠ'+e);
				alert('후기 삭제에 실패하였습니다!');
				reviewList(p_idx);
			}
		})
	}
	
}

