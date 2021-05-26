# commit🌱



---

## 2021-05-28-⚙️

- header.jsp 메뉴 수정 

- 메인 & header 분리 완료 

  - 메인에서는 투명도 100%
  - 헤더에서는 투명도 50%

- 컨트롤러 elements / generic 추가 

- Default 폰트 교체, 감성 멘트 폰트 추가

- CSS 스타일 수정 

  - 모달 투명도 50%
  - 반응형 수정 
  - 중복 스타일 제거

- javascript 추가

  - modal.js

- 슬라이더 제거

- includes/modal.jsp 추가

  



## 문제점 

- ~~모달창 반응형 사이즈에 따라 위치가 변경되던 문제~~  : 해결 
- ~~모달 반응형에 따라 내부 컨텐츠 사이즈 문제~~ : 해결
- ~~회원가입 내부 간격 조절~~ : 완료 
- ~~width : 1680px 사이즈부터 모달 컨텐츠 늘어나는 문제~~: 해결
  - 템플릿에서 1680px 이상부터 모든 태그,이미지 등 사이즈와 간격이 전부 커짐.
- ~~다른 페이지에서 모달 동작 안하던 문제~~ : 해결 





---

##### 0.01a 

- MVC Model2 디자인 패턴 -> Spring MVC 프로젝트 변경





































----

## DROP

03-17-2021 hot_fix

- Path modified !



##### version: 0.01f

- 비밀번호 수정 페이지 구현
- 비밀번호 수정 테스트 이상 없음
- 회원가입 시 이메일 인증을 한번에 하여 인증번호 입력 구현



---



##### version: 0.01e

- PW찾기 구현 완료 (임시비밀번호 발급- 메일 전송)



---



##### version: 0.01d

- 로그아웃 구현 완료
- ID찾기 구현 완료 





---



**version : 0.01c**

- **회원가입 구현 완료**

- **이메일 인증 구현 완료**

- **로그인 기능 구현 완료** 

- **메인 화면 실시간 시간 구현** 

- **error404 페이지 디자인 및 기능 구현**

  

  



---

### bug fix

-  Failed to load resource: the server responded with a status of 500   
   문제 발생



- HTTP 상태 500 – 내부 서버 오류     
  javax.servlet.ServletException: 서블릿 실행이 예외를 발생시켰습니다.
  org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)  
  문제 발생

---> XML 파일을 인식하지 못하는 문제





---

#### **version : 0.01b**

- IDE CHANGE
- TOMCAT VER - 9.0.43
- HTML -> JSP Build
- WEB Application Build
- DB Build
- servlet

----

##### **version : 0.01a**

- 메인 화면 구현
- 회원가입 로그인 폼 구현
- 비밀번호 찾기 팝업 레이아웃 구현
- Safari & Chrome & Mobile Device 동작 확인