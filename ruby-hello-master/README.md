# Ruby Sinatra 示例程序

## 项目介绍

本项目是一个简单的 Ruby [Sinatra](http://www.sinatrarb.com) 示例，使用 [Unicorn](http://unicorn.bogomips.org) 作为 web 服务器。目录结构：

```
.
├── Gemfile
├── Gemfile.lock
├── Procfile
├── README.md
├── config.ru
├── hello_world.rb
└── unicorn.rb
```

## 项目要求

如果项目目录下没有 `Gemfile` 和 `Gemfile.lock` 文件，你必须执行 [Bundler](http://bundler.io) 来创建他们，否则项目将无法部署。

[Sinatra](http://www.sinatrarb.com) 和 [Rack](http://rack.github.io) 应用还需要一个 `config.ru` 文件来描述该如何运行你的应用，示例：

```
require "./hello_world"
run HelloWorld.new
```

## 本地测试

1. 执行 `bundle install` 安装所需 gem 包。
2. 执行 `rackup` 即可启动 web 服务器。
3. 访问 <http://localhost:9292> 查看效果。
