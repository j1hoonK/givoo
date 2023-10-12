<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="\css\join.css">
    <meta charset="UTF-8">
    <title>기관 수정</title>
</head>
<body>
<h2>기관 수정</h2>

<form action="/auth/org/edit/${org.get().orgId}" method="post" enctype="multipart/form-data">
    <div>
        <label for="orgName">기관명</label>
        <input type="text" id="orgName" name="orgName" value="${org.get().orgName}" required>
    </div>
    <div>
        <label>주소</label>
        <div><input type="text" id="address_kakao" name="address" value="${org.get().orgAddress}" readonly /></div>
    </div>
    <div>
        <label>우편번호</label>
        <input type="text" id="zip" placeholder="우편번호" value="${org.get().zip}" readonly>
    </div>
    <div>
        <label for="orgOwner">대표 이름</label>
        <input type="text" id="orgOwner" name="orgOwner" value=${org.get().orgOwner} required>
    </div>
    <div>
        <label for="orgOwnnumber">고유번호</label>
        <input type="text" id="orgOwnnumber" name="orgOwnnumber" value=${org.get().orgOwnnumber}>
    </div>
    <div>
        <label for="startedUp">설립일</label>
        <input type="date" id="startedUp" name="startedUp" value="" onfocus="setInitialDate()" required>
    </div>
    <div>
        <label for="orgType">기관 유형:</label>
        <div class="org-type-options">
            <!-- 여기에 라디오 박스를 동적으로 생성할 예정입니다. -->
        </div>
    </div>
    <div>
        <label for="orgTell">전화번호</label>
        <input type="text" id="orgTell" name="orgTell" value=${org.get().orgTell} required>
    </div>
    <div>
        <label for="orgInfo">기관 소개</label>
        <textarea id="orgInfo" name="orgInfo"  required>${org.get().orgInfo}</textarea>
    </div>
    <div>
        <label for="homepage">홈페이지</label>
        <input type="text" id="homepage" name="homepage" value=${org.get().hompage} required>
    </div>
    <div>
        <label for="accountNumber">계좌번호</label>
        <input type="text" id="accountNumber" name="accountNumber" value=${org.get().accountNumber} required>
    </div>
    <div>
        <label for="accountHolder">예금주</label>
        <input type="text" id="accountHolder" name="accountHolder" value=${org.get().accountHolder} required>
    </div>
    <div>
        <label for="bankName">은행명</label>
        <div class="bank-options">
            <!-- 은행 선택 라디오 박스를 JavaScript로 동적으로 생성 -->
        </div>
    </div>
    <div>
        <button type="submit" id="join-button">수정하기</button>
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
        var bankNameValue = "${org.get().bankName}";

// orgType 라디오 버튼의 요소를 가져옵니다.
        var bankNameRadio = document.getElementById(bankNameValue);

// orgType 라디오 버튼에 checked 속성을 설정합니다.
        if (bankNameRadio) {
            bankNameRadio.checked = true;
        }


    });

    var orgTypes = ["환경보전", "재난구호", "자선", "시민사회구축", "보건복지", "권익신장", "국제구제", "국제교류협력","종교", "교육문화과학", "기타"];

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
        var orgTypeValue = "${org.get().orgType}";

// orgType 라디오 버튼의 요소를 가져옵니다.
        var orgTypeRadio = document.getElementById(orgTypeValue);

// orgType 라디오 버튼에 checked 속성을 설정합니다.
        if (orgTypeRadio) {
            orgTypeRadio.checked = true;
        }


    });

    window.onload = function(){
        document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
            //카카오 지도 발생
            new daum.Postcode({
                oncomplete: function(data) { //선택시 입력값 세팅
                    document.getElementById("address_kakao").value = data.address; // 주소 넣기
                    document.getElementById("zip").value = data.zonecode;
                }
            }).open();
        });
    }


    var dateStr = '${org.get().startedUp}';
    // 날짜 문자열을 Date 객체로 파싱
    dateStr = dateStr.replace('년', '-').replace('월', '-').replace('일', '');

    // 변환된 날짜 문자열을 Date 객체로 파싱
    var initialDate = new Date(dateStr);

    // 날짜를 입력 필드에 설정
    var input = document.getElementById("startedUp"); //
    input.valueAsDate = initialDate;
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>