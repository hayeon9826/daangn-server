# daangn-server
당근마켓 서비스 서버 개발 과제

### 실서버 테스트 방법

본 프로젝트는 헤로쿠 서버에 배포해두었으며, 어드민을 접속해 데이터를 확인하실 수 있습니다.
<br>

#### 배포 url:
```
https://daangn-server.herokuapp.com/
```

#### 어드민 url:
```
https://daangn-server.herokuapp.com/admin
```

#### 테스트 계정(아이디/비밀번호):
```
test@test / 123qwe
test@2 / 123qwe
```

#### 어드민 계정(아이디/비밀번호):
```
admin@example / password
```
<br><br>

**0. 실서버 테스트 준비**
<br>
https://daangn-server.herokuapp.com/ 에 접속하셔서 회원가입을 진행하거나, 이미 생성된 테스트 계정으로 로그인 합니다.


**1. 중고거래 게시글 작성 api**

메인페이지 + 버튼 혹은 사이드바에 있는 '게시물 생성'을 눌러 게시글을 생성하실 수 있습니다.
<br>
게시글은 사진/제목/내용/위치/가격을 입력해주셔야 생성되며, 로그인을 해야 생성하실 수 있습니다.
<br>
게시물은 바로 메인 페이지에 노출되며, 게시글을 눌러 수정, 삭제를 할 수 있습니다.

**2. 알림 키워드 등록/삭제 api**

메인 페이지에 '키워드 알림' 탭에서 '키워드 관리'눌러줍니다.
<br>
해당 페이지에서 키워드를 입력하면 알림 생성 flash와 함께 키워드가 생성됩니다.
<br>
키워드 우측의 'x' 버튼을 누르면 키워드가 삭제됩니다.

**3. 알림 발송 기능**

키워드를 생성하면, 다른 아이디로 로그인 해서 게시물을 생성합니다. (*자신이 올리는 게시글은 키워드 알림이 생성되지 않습니다.*)
<br>

게시글 생성 후, 제목에 키워드가 포함되는 유저들에게 키워드 알림이 생성됩니다.
<br>

키워드 알림은 게시글이 삭제되면 함께 삭제됩니다.
