<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>자유게시판 | 모닥불🏕  </title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="shortcut icon" type="image/x-icon" href="/resources/images/icon/title-icon.png">
		<style>
			.content img {
				width: 100% !important;
			}
		</style>
	</head>
	<body class="is-preload">
<%@include file="../includes/header.jsp" %>
<div id="main">
	<!-- Post -->
		<section class="main special" style="margin-top: 30px;">
			<div class="inner banner">
				<header class="major">
					<span class="category">자유게시판</span>
				</header>
			</div>
			<div class="row" style="display:block;">
				<div class="col-6 col-10-medium col-11-small" style="margin: 0 auto;"><h2 style="font-weight: bold;">제목 : ${board.title}</h2></div>
				<div class="col-6 col-10-medium col-11-small" style="margin: 0 auto;">
					<div class="header">
						<h3 style="font-weight: bold; text-align: left; margin: 0 0;">
							No.${board.bno}
						</h3>
						<div style="position: absolute;">
							<span>작성자 : ${board.writer}</span>
						</div>
						<div style="text-align: right;">
							<span>조회수 : ㅇㅇㅇ</span>
						</div>
					</div>
					<div style="margin-bottom: 10px; width: 100%;" class="content">
						${board.content}
						<!-- <textarea rows="" cols=""></textarea> -->
					</div>
				</div>
				<div class="col-6 col-10-medium col-11-small" style="margin: 0 auto 10px auto;">
					<div class="row">
						<div class="col-3" style="text-align:left; text-decoration: none;">
							<a href="#" id="heartIcon" style="font-size:18px;text-decoration: none;"><i style="font-size: 35px;" class="far fa-heart"></i>${board.likeCnt}</a>
						</div>
						<div class="col-9" style="text-align: right;">
							<a href="#" style="font-size: 21px; text-decoration: none;">테드한의 캠핑장 바로가기</a>
						</div>
					</div>
					
				</div>
				
				<!-- 댓글작성칸 -->
				<div class="col-6 col-10-medium col-11-small" style="margin: 0 auto 10px auto;">
					<div class="row">
						<div class="col-9">
							<input type="text">
						</div>
						<div class="col-3" style="padding:0 0;">
							<ul class="actions stacked" style="margin: 0 0;">
								<li>
									<a class="button primary fit" style="border-radius: 6px;">댓글 작성</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
				<!-- 댓글리스트 -->
				<div class="col-6 col-10-medium col-10-small" style="margin: 0 auto;">
					<div>
						<h3 style="font-weight: bold; text-align: left; margin: 0 0;">댓글</h3>
					</div>
					<ul class="alt replies">
						<!-- <li>
							<div style="position: absolute;">
								<h4 style="margin: 0; text-align: left;">작성자: 고희광</h4>
							</div>
							<div style="text-align: right;">
								<h5 style="margin: 0;">12분 전</h5>
							</div>
							<div style="text-align: left;">
								<span>댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.</span>
							</div>
						</li>
						<li>
							<div style="position: absolute;">
								<h4 style="margin: 0; text-align: left;">작성자: 고희광</h4>
							</div>
							<div style="text-align: right;">
								<h5 style="margin: 0;">12분 전</h5>
							</div>
							<div style="text-align: left;">
								<span>댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.</span>
							</div>
						</li> -->
					</ul>
					<div class="paging" style="text-align: center; margin-bottom: 2%;">
									
					</div>
				</div>
			</div>
		</section>
</div>
<jsp:include page="../includes/footer.jsp"/>
<script src="/resources/assets/js/reply.js"></script>
	</body>
	<script>
		$(document).ready(function () {
			var pageNum = 1;
			var bno = "${board.bno}";
			
			$("#heartIcon").on("click", function(e){
				e.preventDefault();
				$(this).find(".fa-heart").toggleClass("far");
				$(this).find(".fa-heart").toggleClass("fas");
			});
			
			
			function showReplyPage(replyCnt){
				var str = "";
				var endNum = Math.ceil(pageNum / 10.0) * 10
				var startNum = endNum - 9;
				var realEnd = Math.ceil(replyCnt / 10.0)
				var divTag = $(".paging");   			
				
				if(endNum > realEnd){
					endNum = realEnd;
				}
				
				var prev = startNum != 1;
				var next = endNum * 10 < replyCnt;
				
				if(matchMedia("screen and (max-width:918px)").matches){
					//918px보다 작을 때
					if(pageNum > 1){
						str += "<a class='changePage' href='" + (pageNum - 1) + "'><code>&lt;</code></a>";
					}
					str += "<code>" + pageNum + "</code>";
					if(pageNum < realEnd){
						str += "<a class='changePage' href='" + (pageNum + 1) + "'><code>&gt;</code></a>";
					}
				}else{
					//918px 이상일 때
					if(prev){
						str += "<a class='changePage' href='" + (startNum - 1) + "'><code>&lt;</code></a>";
					}
					for(let i=startNum; i<=endNum; i++){
						if(i == pageNum){
							str += "<code>" + i + "</code>";
							continue;
						}
						str += "<a class='changePage' href='" + i + "'><code>" + i + "</code></a>";
					}
					if(next){
						str += "<a class='changePage' href='" + (endNum + 1) + "'><code>&gt;</code></a>";
					}
				}
				
				divTag.html(str);
			}
			
			function showList(page){
				console.log
				var replyUL = $(".replies");
				
				replyService.getList({bno:bno, page:page||1},
						function(replyCnt, list){
							var str = "";
							if(list == null || list.length == 0){
								//등록된 댓글이 없습니다.
								if(pageNum > 1) {
									pageNum -= 1;
									showList(pageNum);
								}
								replyUL.html("등록된 댓글이 없습니다.");
								return;
							}
							
							/* <li>
							<div style="position: absolute;">
								<h4 style="margin: 0; text-align: left;">작성자: 고희광</h4>
							</div>
							<div style="text-align: right;">
								<h5 style="margin: 0;">12분 전</h5>
							</div>
							<div style="text-align: left;">
								<span>댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.</span>
							</div>
						</li> */
							for(let i=0, len=list.length; i<len; i++){
								str += "<li data-rno='" + list[i].rno + "'>";
								str += "<div style='position: absolute;'>";
								str += "<h4 style='margin: 0; text-align: left;'>";
								str += "작성자: " + list[i].replyer + "</h4></div><br>";
								/* str += "<div style='text-align: right;'>";
								str += "<h5 style='margin: 0;'>12분 전</h5></div>"; */
								str += "<div style='text-align: left;'>";
								str += "<span>" + list[i].reply + "</span></div>";
								//str += "<strong>" + replyService.displayTime(list[i].replyDate);
								//if(list[i].replyDate != list[i].updateDate){
								//	str += "<br>수정된 날짜 " +replyService.displayTime(list[i].updateDate);
								//}
								str += "</strong><br><a class='modify' href='" + list[i].rno + "'>수정</a>";
								str += "<a class='finish' href='" + list[i].rno + "' style='display:none;'>수정완료</a>";
								str += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
								str += "<a class='remove' href='" + list[i].rno + "'>삭제</a>";
								str += "</div><div class='line'></div></li>";
							}
							replyUL.html(str);
							showReplyPage(replyCnt);
				});
			}

			showList(pageNum);
		});
	</script>
</html>