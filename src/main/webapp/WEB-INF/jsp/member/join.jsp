<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- JSTL 데이터 포맷 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageTitle" value="회원가입" />
<%@ include file="../part/head.jspf"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
	
<h1 class="con flex-jc-c">회원 가입</h1>

<script>
	var MemberJoinForm__submitDone = false;
	function MemberJoinForm__submit(form) {
		if (MemberJoinForm__submitDone) {
			alert('처리중입니다.');
			return;
		}

		form.loginId.value = form.loginId.value.trim();
		form.loginId.value = form.loginId.value.replaceAll('-', '');
		form.loginId.value = form.loginId.value.replaceAll('_', '');
		form.loginId.value = form.loginId.value.replaceAll(' ', '');

		if (form.loginId.value.length == 0) {
			form.loginId.focus();
			alert('로그인 아이디를 입력해주세요.');

			return;
		}

		if (form.loginId.value.length < 4) {
			form.loginId.focus();
			alert('로그인 아이디 4자 이상 입력해주세요.');

			return;
		}

		form.loginPw.value = form.loginPw.value.trim();

		if (form.loginPw.value.length == 0) {
			form.loginPw.focus();
			alert('로그인 비밀번호를 입력해주세요.');

			return;
		}

		if (form.loginPw.value.length < 5) {
			form.loginPw.focus();
			alert('로그인 비밀번호를 5자 이상 입력해주세요.');

			return;
		}

		if (form.loginPwConfirm.value.length == 0) {
			form.loginPwConfirm.focus();
			alert('로그인 비밀번호 확인을 입력해주세요.');

			return;
		}

		if (form.loginPw.value != form.loginPwConfirm.value) {
			form.loginPwConfirm.focus();
			alert('로그인 비밀번호 확인이 일치하지 않습니다.');

			return;
		}

		form.name.value = form.name.value.trim();

		if (form.name.value.length == 0) {
			form.name.focus();
			alert('이름을 입력해주세요.');

			return;
		}

		form.organName.value = form.organName.value.trim();

		if (form.organName.value.length == 0) {
			form.organName.focus();
			alert('기관명을 입력해주세요.');

			return;
		}

		form.organCode.value = form.organCode.value.trim();

		if (form.organCode.value.length == 0) {
			form.organCode.focus();
			alert('기관코드를 입력해주세요.');

			return;
		}

		form.email.value = form.email.value.trim();

		if (form.email.value.length == 0) {
			form.email.focus();
			alert('이메일을 입력해주세요.');

			return;
		}

		form.cellphoneNo.value = form.cellphoneNo.value.trim();
		form.cellphoneNo.value = form.cellphoneNo.value.replaceAll('-', '');
		form.cellphoneNo.value = form.cellphoneNo.value.replaceAll(' ', '');

		if (form.cellphoneNo.value.length == 0) {
			form.cellphoneNo.focus();
			alert('휴대전화번호를 입력해주세요.');

			return;
		}

		if (form.cellphoneNo.value.length < 10) {
			form.cellphoneNo.focus();
			alert('휴대폰번호를 10자 이상 입력해주세요.');

			return;
		}

		if (isCellphoneNo(form.cellphoneNo.value)) {
			form.cellphoneNo.focus();
			alert('휴대전화번호를 정확히 입력해주세요.');
			
		}

		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = '';
		form.loginPwConfirm.value = '';

		form.submit();
		MemberJoinForm__submitDone = true;
	}
</script>


	<form method="POST" class="table-box con flex-jc-c" action="doJoin" onsubmit="MemberJoinForm__submit(this); return false;">
		<input type="hidden" name="redirectUri" value="/member/login">
		<input type="hidden" name="loginPwReal">
		<table>
			<colgroup>
				<col width="250">
			</colgroup>
			<tbody>
				<tr>
					<th>로그인 아이디</th>
					<td>
						<div class="form-control-box">
							<input type="text" placeholder="로그인 아이디 입력해주세요." name="loginId"	maxlength="30" />
						</div>
					</td>
				</tr>
				<tr>
					<th>로그인 비번</th>
					<td>
						<div class="form-control-box">
							<input type="password" placeholder="로그인 비밀번호를 입력해주세요." name="loginPw" maxlength="30" />
						</div>
					</td>
				</tr>
				<tr>
					<th>로그인 비번 확인</th>
					<td>
						<div class="form-control-box">
							<input type="password" placeholder="로그인 비밀번호 확인을 입력해주세요." name="loginPwConfirm" maxlength="30" />
						</div>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<div class="form-control-box">
							<input type="text" placeholder="이름을 입력해주세요." name="name" maxlength="20" />
						</div>
					</td>
				</tr>
				<tr>
					<th>기관명</th>
					<td>
						<div class="form-control-box">
							<input type="text" placeholder="기관명 입력해주세요." name="organName" maxlength="20" />
						</div>
					</td>
				</tr>
				<tr>
					<th>기관코드</th>
					<td>
						<div class="form-control-box">
							<input type="text" placeholder="기관코드명 입력해주세요." name="organCode" maxlength="20" />
						</div>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<div class="form-control-box">
							<input type="email" placeholder="이메일 입력해주세요." name="email"	maxlength="50" />
						</div>
					</td>
				</tr>
				<tr>
					<th>휴대폰</th>
					<td>
						<div class="form-control-box">
							<input type="tel" placeholder="휴대전화번호를 입력해주세요." name="cellphoneNo"	maxlength="12" />
						</div>
					</td>
				</tr>
				<tr>
					<th>회원가입</th>
					<td class="btn-info">
						<button class="btn btn-primary" type="submit">가입</button>
						<button class="btn btn-info" type="button" onclick="history.back();">취소</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>


<%@ include file="../part/foot.jspf"%>