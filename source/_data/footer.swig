<div class="translate-style">
繁/简：<a id="translateLink" href="javascript:translatePage();">繁体
</a>
</div>
<script type="text/javascript" src="/js/tw_cn.js"></script>
<script type="text/javascript">
var defaultEncoding = 2; //网站编写字体是否繁体，1-繁体，2-简体
var translateDelay = 0; //延迟时间,若不在前, 要设定延迟翻译时间, 如100表示100ms,默认为0
var cookieDomain = "https://tding.top/"; //Cookie地址, 一定要设定, 通常为你的网址
var msgToTraditionalChinese = "繁体"; //此处可以更改为你想要显示的文字
var msgToSimplifiedChinese = "简体"; //同上，但两处均不建议更改
var translateButtonId = "translateLink"; //默认互换id
translateInitilization();
</script>

{# 页脚站点运行时间统计 #} {% if theme.footer.ages.enable %}
<script src="https://cdn.jsdelivr.net/npm/moment@2.22.2/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/moment-precise-range-plugin@1.3.0/moment-precise-range.min.js"></script>
<script>
  function timer() {
    var ages = moment.preciseDiff(moment(),moment({{ theme.footer.ages.birthday }},"YYYYMMDD"));
    ages = ages.replace(/years?/, "年");
    ages = ages.replace(/months?/, "月");
    ages = ages.replace(/days?/, "天");
    ages = ages.replace(/hours?/, "小时");
    ages = ages.replace(/minutes?/, "分");
    ages = ages.replace(/seconds?/, "秒");
    ages = ages.replace(/\d+/g, '<span style="color:{{ theme.footer.ages.color }}">$&</span>');
    div.innerHTML = `{{ __('footer.age')}} ${ages}`;
  }
  var div = document.createElement("div");
  //插入到copyright之后
  var copyright = document.querySelector(".copyright");
  document.querySelector(".footer-inner").insertBefore(div, copyright.nextSibling);
  timer();
  setInterval("timer()",1000)
</script>
{% endif %}
