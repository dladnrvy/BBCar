<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>    
    
    
    
<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
    font-size: 18px;
}
    
h2 {
    font-size: 55px !important;
}    
    
/*---------- 글쓰기 폼 ---------*/    

#title, select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=submit] {
  background-color: #6258a4;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  width: 100%;
  margin: 30px 0;
}

input[type=submit]:hover {
  background-color: #413A6D;
  width: 100%;    
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
    margin: 120px auto;
}

#subject {
	resize: none;
}


/*------글읽기 폼 -------*/
#detail_form .btn {
  background-color: #6258a4;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
    width: 15%;
}   
    
#detail_form .btn:first-child{
    margin-left: 65%;
    margin-right: 3%;
}

#detail_form .btn_wrap{
    padding: 20px;
    margin-top: 50px;
}    
/*
    #detail_form p {
        font-size: 24px;
    }
    #detail_form #detail_cont {
        font-size: 28px;
    }*/
    
    
    
/*------사이드 바 -------*/
.sidenav {
  height: 100%;
  width: 200px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 50px;
  padding-left: 20px;
}

.sidenav a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.main {
  margin-left: 210px; /* Same as the width of the sidenav */
  /*font-size: 28px*/; /* Increased text to enable scrolling */
  padding: 0px 10px;
  margin-bottom: 80px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
    
    
/*---------- 테이블 ----------*/    
    #board_list_table>thead,
    #board_list_table>tbody {
        text-align: center;
    }
    
    #board_list_table>tbody td:nth-child(2){
        text-align: left;
    }
    #board_list_table th:first-child {
        width: 7%;
    }    
    #board_list_table th:nth-child(2){
        width: 57%;
    }
    
    #table_list{
        width: 100%;
    }
    
    #board_list_table tbody td:nth-child(3),
    #board_list_table tbody td:nth-child(5) {
        /*font-size: 24px;*/
        vertical-align: middle;
    }
    
    #board_list_table > tbody a.listTitle {
        display: block;
        cursor: pointer;
    }
    
    
    
    
/*---------- button ----------*/    

#myBtn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  background-color: #413A6D;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 4px;
}

#myBtn:hover {
  background-color: #6258a4;
}    

    
/*-------- search box ------------*/    
#searchbox {
    clear: both;
    margin: auto;
    margin-bottom: 100px;
    margin-top: 80px;
    max-width: 500px;
    /*float: right;*/
}
form.example input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 80%;
  background: #f1f1f1;
}

form.example button {
  float: left;
  width: 20%;
  padding: 10px;
  background: #413A6D;
  color: white;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none;
  cursor: pointer;
}

form.example button:hover {
  background: #0b7dda;
}

form.example::after {
  content: "";
  clear: both;
  display: table;
}    
    
    
    
    
/*--------- pagenation ----------*/
.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
}

.pagination a.active {
  background-color: #413A6D;
  color: white;
}    
    
.pagination {
    display: inline-block;    
    margin: 0 auto;
    max-width: 600px;
}    
#paginationBox ul>li    {
    float: left;
}
#paginationBox {
    max-width: 450px;
    margin: 0 auto;
}    
    
    
    
</style>
</head>
<body>

<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>

<div class="sidenav">
  <a href="#about">About</a>
  <a href="#services">Services</a>
  <a href="#clients">Clients</a>
  <a href="#contact">Contact</a>
</div>

<div class="main" id="detail_form">
    <div class="container">
          <h2 id="detail_title"></h2>
          <p id="detail_writer">작성자 </p>
          <p id="detail_time">작성시간 </p>
          <p id="detail_hit">조회수 </p>
          <p id="detail_cont"></p>
        
        <c:if test="${loginInfo.id}">
	        <div class="btn_wrap">
	            <span class="btn">수정</span>
	            <span class="btn">삭제</span>
	        </div>        
        </c:if>
    </div>    
</div>

     
<!--글쓰기 폼-->    
<div class="main" id="writing_form">    
    <h2>글쓰기</h2>
    <div class="container">
      <form action="/action_page.php">
        <label for="title">제목</label>
        <input type="text" id="title" name="title" placeholder="제목을 입력해주세요..">

        <label for="subject">내용</label>
        <textarea id="subject" name="subject" placeholder="내용을 입력해 주세요.." style="height:550px"></textarea>

        <input type="submit" value="글쓰기">
      </form>
    </div>
</div>    
    
    
    
<div class="main">
	<h2>FAQ 게시판</h2>
	<p>Resize the browser window to see the effect.</p>
	
	<div class="row">
        <!-- 테이블 리스트--> 
        <div id="table_list" class="">
            <table class="table table-hover" id="board_list_table">
                <thead class="">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                        
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
	</div>
	
	
	    
	<!--page nation-->    
	<div id="paginationBox">
	    <ul class="pagination">
	    </ul>
	</div>    
	    
	    <!--search box-->
	<form class="example" action="" id="searchbox">
	  <input type="text" placeholder="Search.." name="search2"><button type="submit"><i class="fa fa-search"></i></button>
	</form>
    
</div>
    
    
   
    
    
    
    
<script>
// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 800 || document.documentElement.scrollTop > 800) {
    document.getElementById("myBtn").style.display = "block";
  } else {
    document.getElementById("myBtn").style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}
</script>
   
</body>
</html> 


<script>

    $(document).ready(function(){
        getList(1);
    });
    
    function getList(page){
        
        $('#detail_form').css('display','none');
        $('#writing_form').css('display','none');
        
        var url = '';
        url += '?page=' + page;
        
        $.ajax({
            url:'http://13.209.40.5:8080/driver/faq/list'+url,
            /* url:'http://localhost:8080/driver/faq/list'+url, */
            type:'GET',
            contentType : 'application/json;charset=utf-8',
            success:function(data){
                var list = data.list;
                var pagination = data.pagination;
                console.log('성---공');
                
                //게시글리스트 테이블에 넣기
                postsOfBoardList(list);
                //페이지버튼
                paginationBtn(pagination);
            }
        });
    }
    

//게시글 리스트 만들기
function postsOfBoardList(list) {
    var output = '';
                
    for(var i = 0; i<list.length; i++){
        var no = list[i].faq_idx;
        var title = list[i].title;
        var nickname = list[i].nickname;
        var regDate = list[i].time;
        var hit = list[i].hit;

        output += '<tr>\n';
        output += '     <td>'+no+'</td>\n';
        output += '     <td><a class="listTitle" onclick="showDetailPost('+no+')">'+title+'</a></td>\n';
        output += '     <td>'+nickname+'</td>\n';
        output += '     <td>'+hit+'</td>\n';
        output += '     <td>'+regDate+'</td>\n';
        output += '</tr>\n';

//      console.log('output'+i+'\n', output);
    }

    $('#board_list_table tbody').html(output);
                
}
    
//페이지 박스 버튼만들기    
function paginationBtn(pagination) {
    var prev = pagination.prev //이전범위로    
    var next = pagination.next; //다음범위로
    
    var startPage = pagination.startPage;
    var page = pagination.page; //현재페이지번호
//    var range = pagination.range; //현재 범위
    
    var rangeSize = pagination.rangeSize;
    var pageCnt = pagination.pageCnt;
    /*var rangeSize = pagination.rangeSize;*/
    
    var prevRange = startPage - rangeSize;
    var nextRange = startPage + rangeSize;
    
//    console.log('startpage 타입' , typeof(startPage) ); number
//    console.log('prev 타입' , typeof(prev)); boolean
//    console.log('prev 값' , prev); 
//    console.log('next 값' , next);
    
    var output = '';
    
    if(prev){
        output += '<li class="page-item"><a class="page-link" onclick="getList('+prevRange+')">이전</a></li>';
    }
    
    //오우예,,
    for(var i = startPage ; i < startPage+rangeSize ; i++){
        
        if(pageCnt+1 > i){
            if(page == i){
                output += '<li class="page-item"><a class="page-link active" onclick="getList('+i+')">'+(pageCnt-i+1)+'</a></li>';

            }else{
                output += '<li class="page-item"><a class="page-link" onclick="getList('+i+')">'+(pageCnt-i+1)+'</a></li>';
            }
        } else {
            break;
        }
        
    }
//    console.log('range 현재 ' , range);
    console.log('page 현재 ' , page);
    console.log('pageCnt 현재 ' , pageCnt);
    console.log('startPage 현재 ' , startPage);
    
    if(next){
        output += '<li class="page-item"><a class="page-link" onclick="getList('+nextRange+')">다음</a></li>';
    }
    
    $('#paginationBox ul').html(output);
}

    
//자세한 글 보기
function showDetailPost(no) {
    $.ajax({
        url:'http://13.209.40.5:8080/driver/faq/'+no,
/*         url:'http://localhost:8080/driver/faq/'+no, */
        type:'GET',
        contentType : 'application/json;charset=utf-8',
        success:function(data){
            console.log('성---공');
            
            var no = data.faq_idx;
            var writer = data.d_idx;
            var nickname = data.nickname;
            var title = data.title;
            var content = data.cont;
            var time = data.time;
            var hit = data.hit;
            
            distributePosts('detail_title', title);
            distributePosts('detail_writer', nickname);
            distributePosts('detail_time', time);
            distributePosts('detail_hit', '작성시간 ' + hit);
            distributePosts('detail_cont', '조회수 ' + content);
            
        }
    });
    $('#detail_form').css('display','block');
}    
    
function distributePosts(elementName, msg) {
    var element = document.getElementById(elementName);
    element.innerHTML = msg;
}
</script>







