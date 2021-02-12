# daangn-server
당근마켓 서비스 서버 개발 과제

***

### 실서버 테스트 방법

본 프로젝트는 헤로쿠 서버에 배포했으며, 관리자 페이지로 접속해 데이터를 확인하실 수 있습니다.
<br>

#### 사이트 url:
```
https://daangn-server.herokuapp.com/
```

#### 관지라 페이지 url:
```
https://daangn-server.herokuapp.com/admin
```

<img width="70%" alt="admin_user" src="https://user-images.githubusercontent.com/38210233/107744817-b66ace00-6d56-11eb-8dbb-fad3578b8dca.png">

#### 테스트 계정(아이디/비밀번호):
```
test@test / 123qwe
test@2 / 123qwe
```

#### 어드민 계정(아이디/비밀번호):
```
admin@example / password
```

***

**0. 실서버 테스트 준비**

https://daangn-server.herokuapp.com/ 에 접속하셔서 회원가입을 진행하거나, 이미 생성된 테스트 계정으로 로그인 해주세요.


<img src="https://user-images.githubusercontent.com/38210233/107745061-0e093980-6d57-11eb-80ef-f5b49bd32d2e.jpeg" width="35%">  <img src="https://user-images.githubusercontent.com/38210233/107742134-d2b83c00-6d51-11eb-816f-5b4afaba8096.jpeg" width="35%">

**1. 중고거래 게시글 작성 api**

* 메인페이지 하단에 띄워져 있는 '+' 버튼, 혹은 사이드바에 있는 '게시물 생성' 링크를 눌러 게시글 생성페이지로 이동합니다.

<img src="https://user-images.githubusercontent.com/38210233/107742171-e06dc180-6d51-11eb-80b2-415404bf39b2.jpeg" width="35%">

* 게시글 생성 페이지에서 중고 거래 게시물을 생성해주세요.

* 게시글은 사진/제목/내용/위치/가격을 입력해주셔야 생성되며, 로그인을 해야 생성하실 수 있습니다.

<img src="https://user-images.githubusercontent.com/38210233/107742204-f67b8200-6d51-11eb-9ce5-a4a536030255.png" width="35%">



* 생성된 게시물은 바로 메인 페이지에 노출되며, 게시글을 눌러 상세페이지에서 수정 및 삭제를 할 수 있습니다.


<img src="https://user-images.githubusercontent.com/38210233/107745061-0e093980-6d57-11eb-80ef-f5b49bd32d2e.jpeg" width="35%">  <img src="https://user-images.githubusercontent.com/38210233/107742253-0bf0ac00-6d52-11eb-9b77-05b2e1de5eee.png" width="35%">



**2. 알림 키워드 등록/삭제 api**

* 메인 페이지에 '키워드 알림' 탭에서 '키워드 관리'를 클릭해주세요.

<img src="https://user-images.githubusercontent.com/38210233/107742333-304c8880-6d52-11eb-82ee-b8fed5e50a68.jpeg" width="35%">  <img src="https://user-images.githubusercontent.com/38210233/107742533-891c2100-6d52-11eb-9ecc-e711cf29c962.jpeg" width="35%">


[키워드 생성]

* 해당 페이지에서 상단 입력창에 키워드를 입력하면 "키워드를 추가했습니다" 라는 flash와 함께 키워드가 생성됩니다.

* 생성된 키워드는 "알림 받을 키워드" 아래에 차례로 추가됩니다.

<img src="https://user-images.githubusercontent.com/38210233/107742550-9507e300-6d52-11eb-8390-92236241183e.jpeg" width="35%">  <img src="https://user-images.githubusercontent.com/38210233/107742568-9f29e180-6d52-11eb-85e8-87048a2838cc.jpeg" width="35%">

[키워드 삭제]

* 같은 페이지에서 키워드 삭제를 진행하실 수 있습니다.

* 각 키워드 우측의 'x' 버튼을 누르면 "키워드를 삭제했습니다" 라는 flash와 함께 키워드가 삭제됩니다.

<img src="https://user-images.githubusercontent.com/38210233/107742595-acdf6700-6d52-11eb-88d8-01f7814903d5.jpeg" width="35%">


**3. 키워드 알림 발송 기능**

* 기존 계정으로 키워드를 생성한 후, 다른 아이디로 로그인 해서 키워드를 포함한 제목의 게시물을 생성합니다.

(ex. test@test 계정으로 '노트북' 입력 후, test@2 계정에서 '노트북' 이라는 제목으로 게시물 생성. test@test 계정의 키워드 알림 확인)

(*자신이 올리는 게시글은 키워드 알림이 생성되지 않습니다.*)


* 게시글을 생성하면, 키워드가 게시글 제목에 포함되는 유저들에게 키워드 알림이 생성됩니다.

<img src="https://user-images.githubusercontent.com/38210233/107742648-cbddf900-6d52-11eb-98ed-d50b7f466200.png" width="35%">


* 해당 기능은 관리자 페이지에서 직접 게시물을 생성해 테스트 해보셔도 됩니다.

* 또한, 키워드 알림은 게시글이 삭제되면 함께 삭제됩니다.

***

감사합니다.

혹시 기타 문의사항이 있으면 hayeonkim226@gmail.com 으로 연락 부탁드립니다.
