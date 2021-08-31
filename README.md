# Moreco
영화 추천 웹 사이트

<br>

## 개요
회원인 경우에만 이용할 수 있는 moreco는 Movie Recommend의 줄임말로 관리자가 감명 깊게 본 영화들을 

장르 별로 추천해 주고 회원들은 이를 통해 댓글과 비슷한 형태의 감상평, 별점 등을 기록할 수 있는 

서비스를 제공하는 웹 페이지이다.

<br>

## 기술 스택
+ HTML5
+ CSS3
+ Java
+ Java Script
+ JSP
+ Bootstrap5.0
+ MySQL

<br>

## 구현 기술
#### I. 회원가입, 로그인, 회원 정보 찾기
+ 아이디 (5~20자) (필수)
+ 비밀번호 (6~13자) (필수)
+ 주민등록번호(앞자리 6자, 뒷자리 7자), 이름 (필수)
+ 개인 정보 수집 동의 (필수)
+ 아이디 중복체크 기능
+ 비밀번호, 비밀번호 확인 동일 유무
+ 주민번호 앞자리 정보를 통해 연령 판별
+ 주민번호 뒷자리 정보를 통해 성별 판별
+ 아이디 찾기, 비밀번호 찾기

<br>

#### II. 메인 페이지
+ 영화 정보 등록 버튼 (관리자가 아닌 경우 디스플레이 되지 않음)
+ 회원 정보 드롭 다운
  + 회원 정보 조회 및 변경 (회원 정보, 비밀번호 변경, 이름 변경, 회원 탈퇴)
  + 로그아웃 기능
  <br>
+  좌측 사이드바
  + 영화 장르 (클릭 시 해당 장르의 영화 목록 디스플레이 됨)
    + 각각의 영화마다 회원들이 평가한 별점 값의 평균을 계산하여 영화 제목 아래쪽에 별 모양 형태로 디스플레이 됨
    + 한 화면에 8개 이상의 목록이 존재하는 경우 다음 페이지로 넘어가도록 페이징 처리

  + Q&A 게시판
    + 게시글 읽기, 쓰기, 수정, 삭제
    + 게시글 조회수
    + 작성자만 해당 게시글 수정 삭제할 수 있도록 처리 
    + 한 화면에 10개 이상의 글이 존재하는 경우 페이징 처리
    + 등록된 게시글이 없는 경우 ‘등록된 글이 없습니다’ 형태로 디스플레이 됨
    + 답글은 관리자만 작성할 수 있도록 처리
    

+ 추천하는 각각의 영화는 이미지, 영화 제목, 별점으로 디스플레이 됨


<br>

#### III. 선택한 영화 페이지
+ 선택한 영화의 제목, 감독, 줄거리, 이미지 등을 테이블 형태로 디스플레이
+ 회원들이 작성할 수 있는 해당 영화의 감상평, 별점 등록 기능 구현
+ 자신이 등록한 감상평만 삭제 가능하도록 처리

<br>

#### IV. 영화 정보 등록 (관리자)
+ 관리자가 영화 정보 (영화의 제목, 감독, 줄거리, 이미지) 를 작성할 수 있는 형태로 디스플레이 됨 (이미지는 파일 첨부 형태로 등록)
+ 파일 첨부 시 확장자 체크 (이미지 파일만 가능)
+ 이미지 파일 크기 10MB 이하만 등록 가능하도록 처리
+ 영화 등급 입력 시 전체/12세/15세/18세 관람가만 등록 가능하도록 처리

<br>


## 화면 구성

### 1. 로그인 페이지
![login](https://user-images.githubusercontent.com/85788300/131472709-ab78198a-2811-481b-9766-8c0be1f8f87b.png)

### 2. 메인 페이지
![main](https://user-images.githubusercontent.com/85788300/131472765-20147d3e-806a-4841-a7f1-320a94f02324.png)

### 3. 영화 페이지
![movieInfo](https://user-images.githubusercontent.com/85788300/131472802-7489c9ad-c8ec-4ff8-8058-a4647f7c6fbf.png)

### 4. 문의 게시판 페이지
![qna_after](https://user-images.githubusercontent.com/85788300/131472859-57cf6315-f76a-439f-b24c-d0744db354ea.png)

