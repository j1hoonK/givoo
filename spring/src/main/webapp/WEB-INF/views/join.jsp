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

<form action="members/join/org" method="post" enctype="multipart/form-data">
  <div>
    <label for="username">아이디</label>
    <input type="text" id="username" name="username" required>
    <button type="button" onclick="checkUsername()">중복 검사</button>
  </div>
  <div id="username-result"></div>
  <div>
    <label for="password">비밀번호</label>
    <input type="password" id="password" name="password" required>
  </div>
  <div>
    <label for="confirmPassword">비밀번호 확인</label>
    <input type="password" id="confirmPassword" name="confirmPassword" required>
    <div id="password-match-result"></div>
  </div>
  <div>
    <label for="orgName">기관명</label>
    <input type="text" id="orgName" name="orgName" required>
  </div>
  <div>
    <label>주소</label>
    <div><input type="text" id="address_kakao" name="address" readonly /></div>
  </div>
  <div>
    <label>상세 주소</label>
    <div><input type="text" name="address_detail" /></div>
  </div>
  <div>
    <label>우편번호</label>
    <input type="text" id="zip" name="zip" placeholder="우편번호" readonly>
  </div>
  <div>
    <label for="orgOwner">대표 이름</label>
    <input type="text" id="orgOwner" name ="orgOwner" required>
  </div>
  <div>
    <label for="orgOwnnumber">고유번호</label>
    <input type="text" id="orgOwnnumber" name="orgOwnnumber">
  </div>
  <div>
    <label for="startedUp">설립일</label>
    <input type="date" id="startedUp" name="startedUp" required>
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
    <h3>기부금목록</h3>
    <!-- 기부금목록 추가 버튼을 추가합니다. -->
    <button type="button" id="add-donation-button" class="add-button">기부금목록 추가</button>
    <div id="donation-list">
      <!-- 동적으로 추가될 입력 필드는 여기에 들어갑니다. -->
    </div>
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
    <button type="submit" id="join-button">가입하기</button>
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
    radioInput.name = "bankName";
    radioInput.value = bankName;
    radioInput.required = true;
    radioInput.id=bankName;

    radioLabel.textContent = bankName;
    radioLabel.htmlFor =bankName;

    radioDiv.appendChild(radioInput);
    radioDiv.appendChild(radioLabel);
    bankOptionsDiv.appendChild(radioDiv);
  });

  var orgTypes = ["환경보전", "재난구호", "자선", "시민사회구축", "보건복지", "권익신장", "국제구제","종교", "국제교류협력", "교육문화과학", "기타"];

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


  function checkUsername() {
    var usernameInput = document.getElementById("username");
    var username = usernameInput.value;
    // AJAX 요청을 생성합니다.
    fetch("/members/joinCheck/" + username)
            .then(function (response) {
              if (!response.ok) {
                throw new Error("Network response was not ok");
              }
              return response.json(); // JSON 형식으로 파싱
            })
            .then(function (data) {
              var resultDiv = document.getElementById("username-result");

              // 서버로부터 받은 결과를 표시합니다.
              if (data.isUsernameTaken) {
                resultDiv.innerHTML = "이미 사용 중인 아이디입니다.";
              } else {
                resultDiv.innerHTML = "사용 가능한 아이디입니다.";
              }
            })
            .catch(function (error) {
              console.error("There was a problem with the fetch operation: " + error.message);
            });
  }

  function checkPasswordMatch() {
    var passwordInput = document.getElementById("password");
    var confirmPasswordInput = document.getElementById("confirmPassword");
    var passwordMatchResultDiv = document.getElementById("password-match-result");
    var joinButton = document.getElementById("join-button");

    var password = passwordInput.value;
    var confirmPassword = confirmPasswordInput.value;

    if (password === confirmPassword) {
      passwordMatchResultDiv.innerHTML = "비밀번호가 일치합니다.";
      passwordMatchResultDiv.style.color = "green";
      joinButton.disabled = false; // 비밀번호가 일치하면 버튼 활성화
    } else {
      passwordMatchResultDiv.innerHTML = "비밀번호가 일치하지 않습니다.";
      passwordMatchResultDiv.style.color = "red";
      joinButton.disabled = true; // 비밀번호가 일치하지 않으면 버튼 비활성화
    }
  }

  // 비밀번호 일치 여부를 실시간으로 확인
  var passwordInput = document.getElementById("password");
  var confirmPasswordInput = document.getElementById("confirmPassword");

  passwordInput.addEventListener("keyup", checkPasswordMatch);
  confirmPasswordInput.addEventListener("keyup", checkPasswordMatch);

  // 기부금목록 추가 버튼 이벤트 처리
  // 기부금 목록 추가 버튼 클릭 이벤트 처리
  var donations = []; // 기부금 목록을 담을 배열

  document.getElementById("add-donation-button").addEventListener("click", function () {
    var donationList = document.getElementById("donation-list");
    var donationField = document.createElement("div");
    donationField.classList.add("donation-field");
    var index = donationList.children.length + 1;
    donationField.innerHTML = `<label for="donation${index}">기부금 ${index}</label>
    <input type="text" id="donation${index}" name="donationsType[]">
    <button type="button" class="remove-donation-button">삭제</button>`;
    donationList.appendChild(donationField);

    // 삭제 버튼 클릭 이벤트 처리
    var removeButtons = donationList.getElementsByClassName("remove-donation-button");
    for (var i = 0; i < removeButtons.length; i++) {
      removeButtons[i].addEventListener("click", function () {
        var parentDiv = this.parentElement;
        donationList.removeChild(parentDiv);
        updateDonationLabels(); // 기부금 레이블 다시 업데이트
        updateDonationsArray();
      });
    }

    updateDonationLabels(); // 기부금 레이블 업데이트
    updateDonationsArray();
  });

  // 기부금 레이블 업데이트
  function updateDonationLabels() {
    var donationFields = document.getElementsByClassName("donation-field");
    for (var i = 0; i < donationFields.length; i++) {
      var label = donationFields[i].querySelector("label");
      label.textContent = "기부금 " + (i + 1);
    }
  }

  // 기부금 배열 업데이트
  function updateDonationsArray() {
    var donationFields = document.querySelectorAll("input[name='donationsType[]']");
    donations = Array.from(donationFields).map(function (field) {
      return field.value;
    });
  }
  window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
      //카카오 지도 발생
      new daum.Postcode({
        oncomplete: function(data) { //선택시 입력값 세팅
          document.getElementById("address_kakao").value = data.address; // 주소 넣기
          document.getElementById("zip").value = data.zonecode;
          document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
        }
      }).open();
    });
  }
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>
