// XMLHttpRequest 객체 생성
const xhrHeader = new XMLHttpRequest();
const xhrFooter = new XMLHttpRequest();

// 불러올 파일의 경로 설정
// 스프링 부트에서는 '/'로 시작하는 경로는 프로젝트 루트를 기준으로 합니다.
const headerUrl = "html/common/header.html";
const footerUrl = "html/common/footer.html";

// 헤더 파일 로드 완료 시 처리할 콜백 함수
xhrHeader.onreadystatechange = function () {
    if (xhrHeader.readyState === XMLHttpRequest.DONE) {
        if (xhrHeader.status === 200) {
            // 파일을 성공적으로 로드한 경우
            document.getElementById("headerContent").innerHTML = xhrHeader.responseText;
        } else {
            // 파일을 로드하는 중에 오류가 발생한 경우
            console.error("Failed to load header file.");
        }
    }
};

// 푸터 파일 로드 완료 시 처리할 콜백 함수
xhrFooter.onreadystatechange = function () {
    if (xhrFooter.readyState === XMLHttpRequest.DONE) {
        if (xhrFooter.status === 200) {
            // 파일을 성공적으로 로드한 경우
            document.getElementById("footerContent").innerHTML = xhrFooter.responseText;
        } else {
            // 파일을 로드하는 중에 오류가 발생한 경우
            console.error("Failed to load footer file.");
        }
    }
};

// 파일을 비동기적으로 로드
xhrHeader.open("GET", headerUrl, true);
xhrFooter.open("GET", footerUrl, true);
xhrHeader.send();
xhrFooter.send();

