<header id="banner" class="wrapper">
  <div class="inner">
    <h2 id="banner-title">{{ page.subtitle }}</h2>
    <div id="banner-start">
        {{ page.description }}
    </div>
  </div>
</header>
<div id="content-wrap">
  <div class="wrapper">
    <div class="inner">
      {{ page.content }}
      <ul id="intro-cmd-wrap">
        <li class="intro-cmd-item">mkdir vbot</li>
        <li class="intro-cmd-item">cd vbot</li>
        <li class="intro-cmd-item">composer require "hanson/vbot:v2.0-rc5"</li>
        <li class="intro-cmd-item">php vendor/bin/vbot run:example --session=vbot</li>
      </ul>
      <div id="intro-get-started-wrap">
        <a href="docs/" id="intro-get-started-link">{{ __('index.get_started') }}</a>
      </div>
    </div>
  </div>
</div>