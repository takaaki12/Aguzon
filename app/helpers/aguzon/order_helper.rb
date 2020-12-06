module Spree
  module Aguzon::OrderHelper
    # include TruncateHtmlHelper

    def truncated_product_description(product)
      truncate_html(raw(product.description))
    end

    def order_just_completed?(order)
      flash[:order_completed] && order.present?
    end

    def current_pricing_options
      Spree::Config.pricing_options_class.from_context(self)
    end
  end
end
