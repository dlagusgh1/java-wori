<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="${board.name} 게시물 작성" />
<%@ include file="../part/head.jspf"%>
	
<h1 class="con flex-jc-c">${board.name} 게시물 작성</h1>


<script>
	var ArticleWriteForm__submitDone = false;
	function ArticleWriteForm__submit(form) {
		if (ArticleWriteForm__submitDone) {
			alert('처리중입니다.');
			return;
		}

		form.boardNumber.value = form.boardNumber.value.trim();

		if (form.boardNumber.value.length == 0) {
			form.boardNumber.focus();
			alert('게시판을 선택해주세요.');

			return;
		}
		
		form.title.value = form.title.value.trim();
		
		if (form.title.value.length == 0) {
			form.title.focus();
			alert('제목을 입력해주세요.');

			return;
		}

		form.body.value = form.body.value.trim();

		if (form.body.value.length == 0) {
			form.body.focus();
			alert('내용을 입력해주세요.');

			return;
		}	
		form.submit();
		ArticleWriteForm__submitDone = true;					
	}
</script>

<form method="POST" class="table-box con" action="${board.code}-doWrite" onsubmit="ArticleWriteForm__submit(this); return false;">
	<input type="hidden" name="redirectUri" value="/article/${board.code}-detail?id=#id">
	<table>
		<colgroup>
            <col class="table-first-col" width="250">
        </colgroup>
		<tbody>
			<tr>
				<th>게시판 구분</th>
				<td>
					<div class="form-control-box">
						<select name="boardNumber">
							<c:forEach items="${boards}" var="boardlist">
								<option id="organNumber" value="${boardlist.id}">${boardlist.name}</option>
							</c:forEach>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<div class="form-control-box">
						<input type="text" placeholder="제목을 입력해주세요." name="title" maxlength="100" />
					</div>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<div class="form-control-box">
						<textarea placeholder="내용을 입력해주세요." name="body" maxlength="2000"></textarea>
					</div>
				</td>
			</tr>
			<tr>
				<th>작성</th>
				<td>
					<button class="btn btn-primary" type="submit">작성</button> 
					<a class="btn btn-info" href="${listUrl}">리스트</a>
				</td>
			</tr>
		</tbody>
	</table>
</form>

<%@ include file="../part/foot.jspf"%>