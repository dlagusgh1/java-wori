<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- JSTL 데이터 포맷 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageTitle" value="관리자 메뉴" />
<%@ include file="../part/head.jspf"%>

<style>	
	.adminMenu-box ul li {
		margin-bottom: 50px;
	}
	
	.adminMenu-box ul li a {
		font-size: 1.5rem;
		font-weight: bold;
	}
	.adminMenu-box ul li:hover {
		color: #4BAF4B;
	}
</style>

<div class="adminMenu-box con">
	<ul>
		<li>
			<a href="organWrite">
				<div>
					<p><i class="fas fa-arrow-right"></i> 기관 정보 등록</p>
				</div>
			</a>
		</li>
		<li>
			<a href="articleManage">
				<div>
					<p><i class="fas fa-arrow-right"></i> 게시물 관리 </p>
				</div>
			</a>
		</li>
		<li>
			<a href="organWrite">
				<div>
					<p><i class="fas fa-arrow-right"></i> 기관 정보 등록</p>
				</div>
			</a>
		</li>
	</ul>
</div>

<%@ include file="../part/foot.jspf"%>