<%@ page contentType="text/html;charset=utf-8" %>

<%
session.setAttribute("rid","");
  session.setAttribute("user",null);
%>

<html>
<head>

<%@ include file='head.jsp' %>
<link rel="stylesheet" type="text/css" href="css/index-css.css">

</head>

<body>
  <%@ include file='navbar.jsp' %>

  <div class='part-header'>
    <div class='container padded'>
      <div class='row'>
        <div class='col-md-8'>
          <h1 class='index-heading'>
            やっと
            <br>君に会えた！</h1>
          <a href="register.jsp" class="btn btn-default btn-md index-link" role="button">今すぐ入会！<span class="index-link-cn">马上加入</span></a>
          <a href="#" class="btn btn-default btn-md index-link" role="button">日本語ページはこちらへ</a>
        </div>
      </div>
    </div>
  </div>

  <div class='part-light'>
    <div class='container padded'>
      <div class='row'>
        <div class='col-md-8'>
          <h2 class='text-center'>号外！日协【哔——】的一声完成华丽蜕变！</h2>
          <p>
            　　于2006年5月成立的武汉大学日语协会在迎来自己的十周岁生日之际，放言要改头换面，凭借新会徽、新制度、新理念和指导思想，力求艳压群芳，就此走上巅峰。
          </p>
          <p>
            　　作为武汉大学仅有的五支以外国语言学术交流为主题的校级社团中的一支，也是华中地区历史最为悠久的日语交流协会之一，武大日协横跨宅、腐、萌、小清新、文学、音乐、ACG、美食、文化、风俗、旅游等多领域， 除了一年一度的迎新晚会及红白歌合战外，每月不定期举办常规活动，具体包括日语教学、寿司制作、和服试穿、文化介绍、ACG及影视欣赏、配音比赛等。同时我们也有着自己的坚守，坚持以日语教学为基石，致力于介绍日本风土人情及流行时尚元素，展现一个古典和现代兼具的日本。
          </p>
          <p>　　我们已经重装上阵，再次启程，愿你能与我们一同奔赴远方。</p>
        </div>
        <div class='col-md-4'>
          <img src='images/anniversary-cake-free.png' class='img-responsive center-block'/>
        </div>
      </div>
    </div>
  </div>

  <div class='part-dark'>
    <div class='container padded'>
      <div class='row'>
        <div class='col-md-4'>
          <img src='images/register-chart.png' class='img-responsive center-block'/>
        </div>
        <div class='col-md-8'>
          <h2 class='text-center'>小二！一份会员专享重磅巨制豪华套餐！</h2>
          <p>　　套餐内容：斥巨资打造的精致会员卡一张</p>
          <p>　　填了表、交了费、拿了卡，你就是我们的人了，而且是终身的。</p>
          <p>
            　　凭借会员卡尊享全套服务，除了上述的各种活动可以参加之外，学术性与娱乐性兼具的常规教学更是不容错过。更能满足你想与日本友人交流的愿望，长期提供勾搭留学生、请教外教的机会。不用担心一个人太孤独寂寞冷，这里一定有因为同样的原因怀着同样的心情寻找过来的小伙伴。
          </p>

        </div>
      </div>
    </div>
  </div>

  <div class='part-light'>
    <div class='container padded'>
      <div class='row'>
        <h2 class='text-center'>叮咚！您点的小鲜肉已经配送成功！</h2>
      </div>
      <div class='row'>
        <div class='col-md-4'>
          <img class='center-block' src="images/icon-user.png" width="100"/>
          <h3 class='text-center'>成为会员</h3>
          <p>　　直接戳一下下面的QQ图标，加入我们的会员QQ群。</p>
        </div>
        <div class='col-md-4'>
          <img class='center-block' src="images/icon-worker.png" width="100"/>
          <h3 class='text-center'>一起工作</h3>
        </div>
        <div class='col-md-4'>
          <img class='center-block' src="images/icon-lollipop.png" width="100"/>
          <h3 class='text-center'>更多咨询</h3>
        </div>
      </div>
    </div>
  </div>

  <%@ include file='footer.jsp' %>


</body>
</html>