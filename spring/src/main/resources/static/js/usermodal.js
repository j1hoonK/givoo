
    // 모달 창 열기
function openModal(user) {
    console.log(user)
    console.log(data)

    document.getElementById("modalUserId").textContent = user.userId;
    document.getElementById("modalUserName").textContent = user.userName;
    document.getElementById("modalUserEmail").textContent = user.userEmail;
    document.getElementById("modalUserTell").textContent = user.userTell;
    document.getElementById("modalUserAddress").textContent = user.userAddress;
    document.getElementById("modalUserNname").textContent = user.userNname;
    document.getElementById("modalUserNumberFirst").textContent = user.userNumberFirst;
    document.getElementById("modalUserImage").textContent = user.userImage;
    document.getElementById("modalLoginType").textContent = user.loginType;
    document.getElementById("userModal").style.display = "block";
}

// Edit 버튼 클릭 시 수정 폼으로 이동 (이 부분은 필요에 따라 구현)
function openEditForm() {
    var userId = document.getElementById("modalUserId").textContent;
}

// Delete 버튼 클릭 시 삭제 요청을 서버로 보내는 로직을 추가
function deleteUser() {
    var userId = document.getElementById("modalUserId").textContent;

}

// 모달 창 닫기
function closeModal() {
    document.getElementById("userModal").style.display = "none";
}

// 테이블 행 클릭 시 모달 열기
var tableRows = document.querySelectorAll(".user-row");
tableRows.forEach(function (row) {
    row.addEventListener("click", function () {
        var userId = row.getAttribute("data-user-id");
    });
});