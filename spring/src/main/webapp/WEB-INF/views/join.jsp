<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="\css\join.css">
  <meta charset="UTF-8">
  <title>회원 가입</title>
</head>
<body>
<h2>회원 가입</h2>

<form action="/org/join" method="post" enctype="multipart/form-data">
  <div>
    <label for="username">아이디</label>
    <input type="text" id="username" name="username" required>
  </div>
  <div>
    <label for="password">비밀번호</label>
    <input type="password" id="password" name="password" required>
  </div>
  <div>
    <label for="orgName">기관명</label>
    <input type="text" id="orgName" name="orgName" required>
  </div>
  <div>
    <label for="orgOwner">대표 이름</label>
    <input type="text" id="orgOwner" name="orgOwner" required>
  </div>
  <div>
    <label for="orgType">기관 유형:</label>
    <div class="org-type-options">
      <!-- 여기에 라디오 박스를 동적으로 생성할 예정입니다. -->
    </div>
  </div>
  <div>
    <label for="orgTell">전화번호</label>
    <input type="text" id="orgTell" name="orgTell" required>
  </div>
  <div>
    <label for="orgInfo">기관 소개</label>
    <textarea id="orgInfo" name="orgInfo" required></textarea>
  </div>
  <div>
    <label for="homepage">홈페이지</label>
    <input type="text" id="homepage" name="homepage" required>
  </div>
  <div>
    <label for="accountNumber">계좌번호</label>
    <input type="text" id="accountNumber" name="accountNumber" required>
  </div>
  <div>
    <label for="accountHolder">예금주</label>
    <input type="text" id="accountHolder" name="accountHolder" required>
  </div>
  <div>
    <label for="bankName">은행명</label>
    <div class="bank-options">
      <!-- 은행 선택 라디오 박스를 JavaScript로 동적으로 생성 -->
    </div>
  </div>
  <div>
    <label for="file">파일 첨부:</label>
    <input type="file" id="file" name="file">
  </div>
  <div>
    <button type="submit">가입하기</button>
  </div>
</form>

<script>
  // 은행 목록
  var bankList = ["카카오뱅크", "국민", "농협", "신한", "우리", "하나", "IBK기업", "새마을금고", "대구", "부산", "토스뱅크", "케이뱅크", "우체국", "SC제일", "신협", "광주", "경남", "수협", "전북", "씨티", "저축은행", "제주", "산업", "산림조합", "BOA", "중국공상", "HSBC", "도이치", "BNP", "JP모간"];

  // 은행 선택 라디오 박스를 동적으로 생성
  var bankOptionsDiv = document.querySelector(".bank-options");

  bankList.forEach(function (bankName, index) {
    var radioDiv = document.createElement("div");
    radioDiv.classList.add("bank-option");

    var radioInput = document.createElement("input");
    var radioLabel = document.createElement("label");

    radioInput.type = "radio";
    radioInput.name = "bank";
    radioInput.value = bankName;
    radioInput.required = true;
    radioInput.id=bankName;

    radioLabel.textContent = bankName;
    radioLabel.htmlFor =bankName;

    radioDiv.appendChild(radioInput);
    radioDiv.appendChild(radioLabel);
    bankOptionsDiv.appendChild(radioDiv);
  });

  var orgTypes = ["환경보전", "재난구호", "자선", "시민사회구축", "보건복지", "권익신장", "국제구제", "국제교류협력", "교육문화과학", "기타"];

  // 라디오 박스 생성
  var orgTypeOptionsDiv = document.querySelector(".org-type-options");

  orgTypes.forEach(function (orgType) {
    var radioDiv = document.createElement("div");
    radioDiv.classList.add("org-type-option");

    var radioInput = document.createElement("input");
    var radioLabel = document.createElement("label");

    radioInput.type = "radio";
    radioInput.name = "orgType";
    radioInput.value = orgType;
    radioInput.required = true;
    radioInput.id=orgType;
    radioLabel.textContent = orgType;
    radioLabel.htmlFor =orgType;
    radioDiv.appendChild(radioInput);
    radioDiv.appendChild(radioLabel);
    orgTypeOptionsDiv.appendChild(radioDiv);
  });
</script>
</body>
</html>