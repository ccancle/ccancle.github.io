{# hexo-theme-next/layout/_custom/post-details.swig
add to: themes/hexo-theme-next/layout/_scripts/pages/post-details.swig
#}
<script type="text/javascript" src="{{ url_for(theme.custom) }}/fold_action.js?v={{ version }}"></script>
{% include '../../_custom/post-details.swig' %}
