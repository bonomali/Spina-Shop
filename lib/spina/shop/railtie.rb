require 'spina/shop/view_helpers'

module Spina
  module Shop
    class Railtie < Rails::Railtie

      initializer "spina_shop.view_helpers" do
        ActiveSupport.on_load(:action_view) { include Spina::Shop::ViewHelpers } 
      end

      initializer "spina_shop.register_plugin" do
        Spina::Plugin.register do |plugin|
          plugin.name = "Shop"
          plugin.namespace = "shop"
        end
      end

      initializer "spina_shop.assets.precompile" do |app|
        app.config.assets.precompile += %w(spina/admin/shop.js spina/admin/shop.css)
      end

    end
  end
end