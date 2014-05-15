## Приложение А
```css
/ app/views/pages/cap.html.slim
doctype html
html lang="en" xmlns="http://www.w3.org/1999/xhtml" 
  head
    meta content="width=device-width, initial-scale=1.0" name="viewport" /
    title= content_for?(:title) ? yield(:title) : "Smart Reserve"
    meta content=(content_for?(:description) ? yield(:description) : "Smart Reserve") name="description" /
    = stylesheet_link_tag "application", "data-turbolinks-track" => true
    = stylesheet_link_tag "//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
    = javascript_include_tag "application", "data-turbolinks-track" => true
    link href="http://fonts.googleapis.com/css?family=PT+Sans:400,700,400italic,700italic" rel="stylesheet" type="text/css" /
    = csrf_meta_tags
    = favicon_link_tag
    meta content="7562595b0d9d7730" name="yandex-verification" /
  body style="font-family:'PT Sans', sans-serif"
    .col-md-8.col-md-offset-2 style="margin-top:15px" 
      #translate.text style="height:0px;top:20px" 
        | Рус |
        a href="#"  Eng
      .row
        .col-md-6
          img alt="Логотип" src=asset_path('temp-1.jpg') style="float:left" /
        .col-md-6
          #table1 style="float:right;margin-top:20px" 
            .market-wrapper
              #as.market_icon
            .market-wrapper
              #gplay.market_icon
            .market-wrapper
              #mp.market_icon
      #row2.row
        .col-md-7
          #video12
            iframe allowfullscreen="" frameborder="0" mozallowfullscreen="" src="//player.vimeo.com/video/91982795" webkitallowfullscreen="" 
        .col-md-4.btn-group style="margin-top:-5px;height:365px;" 
          div
            p.text
              | Зарегистрируйтесь и получите возможность первыми протестировать систему SmartReserve
          = form_for(User.new, remote: true, url: '/users', method:'POST', authenticity_token: true) do |f|
            input#user_email.btn.btn-block.text name="user[email]" placeholder=("Ваш E-mail") style="border-color:black;cursor:text" type="email" /
            = link_to "Зарегистрироваться", '#', remote: true, onclick: "sign_up_call()", class: 'btn btn-block text'
            javascript:
              var sign_up_call = function(){
                $.ajax({
                  url: "#{remote_sign_up_path}.js",
                  data: 'email='+$("#user_email")[0].value,
                  method: "GET",
                  accept: 'text/javascript',
                  dataType: 'script'
                })
              }
            /input.btn.btn-block.text name="button" data-remote="true" onclick="window.location.href='/users/sign_up?email='+$('#user_email')[0].value" type="submit" value="Зарегистрироваться" /
            /! input type="button" class="btn btn-block" value="Вход" name="button" onclick="window.location.href='/users/sign_in'"
            input name="user[password]" type="hidden" value="123456" /
            input name="user[phone]" type="hidden" value="+375290123456" /
            div style="position:absolute;bottom:0;width:90%" 
              input.btn.btn-block.text name="testingService" onclick="window.location.href='/home'" type="submit" value=("Тестировать сервис") /
        .col-md-1
          #table2 style=("float:right; padding:0px;width:45px") 
            a href="https://www.facebook.com/pages/Smart-Reserve/302094899944486" rel="nofollow" 
              #fb.sn_icon
            a href="http://twitter.com/smartreserve" rel="nofollow" 
              #twitter.sn_icon
            a href="http://vk.com/smartreserve" rel="nofollow" 
              #vk.sn_icon
            a href="http://www.youtube.com/user/smartreserve" 
              #yt.sn_icon
            a href="https://plus.google.com/107353192218206361990/posts" rel="publisher" 
              #gp.sn_icon
            a href="" rel="publisher" 
              #fs.sn_icon
      .row-fluid
        #text2.span12.text style=("text-align:justify;background-color: #ffffff;padding:0;width:99.9%") 
          | Сервис SmartReserve предоставляет возможность бронирования столиков в заведениях Вашего города в режиме онлайн в течение нескольких минут. Организуйте свой досуг или деловую встречу, без дорогостоящих звонков и ожиданий на телефонной линии.
          p style="text-align:center;font-size:16pt"  SmartReserve - Ваше время в Ваших руках!
        .row
          .col-md-4 style="height:86px" 
            p.text style="position:absolute;bottom:0;font-size:9pt" 
              | SmartReserve @ 2014
              br/
              a href="mailto:info@smartreserve.by" 
                | info@smartreserve.by
          .col-md-8 style="float:right" 
            a href="#" 
              img src=asset_path('temp-10.png') style="float:right" /
    div style="display:none" 
      - %w[fb.png gplay.png  mp.png yt.png as.png gp.png vk.png twitter.png fs.png].each do |i|
        img src=asset_path(i) /
    /! Yandex.Metrika counter
    javascript:
       (function (d, w, c) {
       (w[c] = w[c] || []).push(function() {
       try {
       w.yaCounter24458147 = new Ya.Metrika({id:24458147,
       webvisor:true,
       clickmap:true,
       trackLinks:true,
       accurateTrackBounce:true});
       } catch(e) { }
       });
      
       var n = d.getElementsByTagName("script")[0],
       s = d.createElement("script"),
       f = function () { n.parentNode.insertBefore(s, n); };
       s.type = "text/javascript";
       s.async = true;
       s.src = (d.location.protocol == "https:" ? "https:" : "http:") + "//mc.yandex.ru/metrika/watch.js";
             if (w.opera == "[object Opera]") {
       d.addEventListener("DOMContentLoaded", f, false);
       } else { f(); }
       })(document, window, "yandex_metrika_callbacks");
    noscript
      div
        img alt="" src="//mc.yandex.ru/watch/24458147" style=("position:absolute; left:-9999px;") /
    /! /Yandex.Metrika counter
```
```scss
/* app/assets/stylesheets/pages.scss */
//= depend_on_asset 'mp_b.png'
//= depend_on_asset 'yt_b.png'
//= depend_on_asset 'yt.png'
.breadcrumbs-span {
  color: blue;
  font-size: 13px;
}
.breadcrumbs-span a{
  text-decoration:underline;
}

.team-slider{
  #team_slider_ul{
    margin-top:30px;
  }
  .teammate{
    height:200px;
    width:190px;

    .caption{
      text-align:center;
    }
    .pic{
      width:130px;
      height:130px;
      border-radius: 500px;
      border: 5px solid #ec5c5c;
      cursor:pointer;
      margin: 0 auto;
      background-image: url('<%= asset_url("team/cat.png") %>');
    }
    .pic:hover + .caption{
      display:none;
    }
    div.pic:hover{
      width:190px;
      height:190px;
      margin-top: -30px;
      // margin-left: -15px;
      background-image: url('<%= asset_url("team/cat-bigger.png") %>');
    }
  }
}

.about{
  .advantage {
    list-style-image: url('<%= asset_url "pages/red-disc-marker.png" %>');
    padding-left:16px;
    margin:0;
  }
}
.bold{
  font-weight: bold;
}
.text{
  font-size: 11pt;
  font-family: 'PT Sans' sans-serif;
  color: black;
  color: black;
}

.market-wrapper{
  display: inline;
  padding-left: 8px;
}
.market_icon {
  height: 38px;
  width: 132px;
  display:inline-block;
}

#mp {
  background-image: url("<%= asset_url('mp_b.png') %>");
}
#mp:hover {
  background-image: url("<%= asset_url('mp.png') %>");
}

#as {
  background-image: url("<%= asset_url('as_b.png') %>");
}
#as:hover {
  background-image: url("<%= asset_url('as.png') %>");
}

#gplay {
  background-image: url("<%= asset_url('gplay_b.png') %>");
  margin-left: -1px;
}
#gplay:hover {
  background-image: url("<%= asset_url('gplay.png') %>");
}

.sn_icon{
  width: 31px;
  height: 31px;
  background-size:cover;
  display: inline-block;
}

#fb{
  background-image: url("<%= asset_url('fb_b.png') %>");
}
#fb:hover {
  background-image: url("<%= asset_url('fb.png') %>");
}
#twitter{
  background-image: url("<%= asset_url('twitter_b.png') %>");
}
#twitter:hover {
  background-image: url("<%= asset_url('twitter.png') %>");
}
#vk{
  background-image: url("<%= asset_url('vk_b.png') %>");
}
#vk:hover {
  background-image: url("<%= asset_url('vk.png') %>");
}
#yt{
  background-image: url("<%= asset_url('yt_b.png') %>");
}
#yt:hover {
  background-image: url("<%= asset_url('yt.png') %>");
}
#gp{
  background-image: url("<%= asset_url('gp_b.png') %>");
}
#gp:hover {
  background-image: url("<%= asset_url('gp.png') %>");
}
#fs{
  background-image: url("<%= asset_url('fs_b.png') %>");
}
#fs:hover {
  background-image: url("<%= asset_url('fs.png') %>");
}

#head {
  margin: 40px 17% 0 17%;
  max-width:70%;
  margin-left: 20%;
}

#head2 {
  width: 42%;
  margin-left: 18%;
}

#regLink {
  width:5%;

}

#row2 {
  margin-top: 30px;
}

.input {
  height: 35px;
  font-size: 16pt;
  margin: 3px;
  width:100%;
  background-color: #ffffff;
}

.btn-block.btn.text {
  background-color: #ffffff;
  border-color: #ed1b24;
  height: 36px;
}

#table1 a:hover{
  text-decoration: none;
}
#table1 a{
  text-decoration: none;
}

#table2 a:hover{
  text-decoration: none;
}
#table2 a{
  text-decoration: none;
}

#text2 {
  margin-top: 30px;
  max-width: 100%;
}

#lowerLogo{
  padding: 0;
}

#video12 iframe {
  width: 100%;
  height: 360px;
  padding:0;
  }
  
 #end {
  margin-top: 30px;
}

#span1 {
  border: 1px solid;
  border-radius: 5px;
  text-align: center;
}
#translate {
  position: relative;
  margin-top: -35px;
  font-size: 13pt;
  float:right;
}
```