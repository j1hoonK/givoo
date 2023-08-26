# 기부

커밋 메세지 규칙  ex) [new] main 화면 추가 (#111) -> [type] 변경내용 (issues번호)

feat: 새로운 기능을 추가하거나 기존의 기능을 요구 사항 변경으로 변경한 경우
기능 추가와 수정을 나누어서 쓰고 싶은 경우 아래 처럼 2개로 나누어서 타입을 지정할 수 있다.

new: 새로운 기능을 추가 한 경우

improve: 기존 기능을 수정 한 경우, 요구 사항이 변경되어 수정된 경우에도 improve 타입으로 한다.

fix: 기능상 버그 픽스를 했을 경우

docs: 문서(주석)의 추가/수정의 경우, 직접적인 코드의 변화 없이 순수하게 문서(주석)만 추가/수정했을 경우

style: UI를 추가/변경 하거나 스타일 관련 작업을 했을 경우

refactor: 기능의 변화가 아닌 코드를 리팩토링했을 경우, 코드 리뷰 등으로 로직(기능)의 변화 없이 단순 함수 내부에서만 사용하는 이름을 변경하였거나, 코드 pretty 등을 적용했을 경우

test: 테스트 코드를 별도로 추가하거나, 변경했을 경우, 만약 기능을 추가하면서 테스트 코드를 동시에 작성했으면 feat 타입으로 사용

chore: 기능/테스트 코드, 문서, 스타일, 리팩토링을 제외한, 배포, 빌드 등과 같이 프로젝트의 기타 작업들에 대해 추가/수정했을 경우, lint 등의 적용으로 코드 스타일을 수정 했을 때도 chore 사용

release: 릴리스를 하기 위해 패키지 버전을 올리거나, 릴리스 버전 커밋을 찍기 위한 경우
