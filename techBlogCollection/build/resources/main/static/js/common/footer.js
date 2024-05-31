// XMLHttpRequest 객체 생성
const xhr = new XMLHttpRequest();

// 불러올 파일의 경로 설정
const url = "footer.html";

// 파일 로드 완료 시 처리할 콜백 함수
xhr.onreadystatechange = function() {
    if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
            // 파일을 성공적으로 로드한 경우
            document.getElementById("footerContent").innerHTML = xhr.responseText;
        } else {
            // 파일을 로드하는 중에 오류가 발생한 경우
            console.error("Failed to load file.");
        }
    }
};

// 파일을 비동기적으로 로드
xhr.open("GET", url, true);
xhr.send();