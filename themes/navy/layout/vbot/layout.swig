<!DOCTYPE html>
<html lang="{{ page.lang }}">
{{ partial('vbot/partial/head') }}
<body>
  <div id="container">
    {{ partial('vbot/partial/header') }}
    {{ body }}
    {{ partial('vbot/partial/footer') }}
  </div>
  <div id="mobile-nav-dimmer"></div>
  {{ partial('vbot/partial/mobile_nav') }}
  {{ partial('vbot/partial/after_footer') }}
</body>
</html>