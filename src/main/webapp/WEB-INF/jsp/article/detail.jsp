<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- JSTL 데이터 포맷 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageTitle" value="${board.name} 게시물 상세내용" />
<%@ include file="../part/head.jspf"%>

<!-- 토스트 UI -->
<%@ include file="/WEB-INF/jsp/part/toastUiEditor.jspf"%>

<h1 class="con flex-jc-c">${board.name} 게시물 상세내용</h1>
	
<div class="article-detail-box con">
	<table>
		<colgroup>
			<col class="table-first-col">
		</colgroup>
		<tbody>
			<tr>
				<th>번호</th>
				<td>${article.id}</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td>${article.regDate}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${article.forPrintTitle}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${article.forPrintBody}</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="article-detail-box con flex">
	<script type="text/x-template">${article.bodyForXTemplate}</script>
	<div class="toast-editor toast-editor-viewer con flex-jc-c"></div>
</div>

<div class="btn-box con margin-top-20">
	<c:if test="${article.extra.actorCanModify}">
		<a class="btn"	href="${board.code}-modify?id=${article.id}&listUrl=${Util.getUriEncoded(listUrl)}">수정</a>
	</c:if>
	<c:if test="${article.extra.actorCanDelete}">
		<a class="btn" href="${board.code}-doDelete?id=${article.id}" onclick="if ( confirm('삭제하시겠습니까?') == false ) return false;">삭제</a>
	</c:if>
	<a href="${listUrl}" class="btn">리스트</a>
</div>

<%@ include file="../part/foot.jspf"%>