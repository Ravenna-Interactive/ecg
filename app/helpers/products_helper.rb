module ProductsHelper
  
  def product_sort_options
    options_for_select([
      ['', nil],
      ['Newest to Oldest', 'descend_by_updated_at'],
      ['Oldest to Newest', 'ascend_by_updated_at'],
      ['Price: Highest to Lowest', 'descend_by_price'],
      ['Price: Lowest to Highest', 'ascend_by_price'],
      ['Name', 'ascend_by_name']
    ])#, :selected => (@search.nil? ? nil : @search.order.to_s))
  end
  
end
