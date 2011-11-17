# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  

  def product_sort_options
    options_for_select([
      ['', nil],
      ['Newest to Oldest', 'descend_by_date'],
      ['Oldest to Newest', 'ascend_by_date'],
      ['Price: Highest to Lowest', 'descend_by_price'],
      ['Price: Lowest to Highest', 'ascend_by_price'],
      ['Name', 'ascend_by_name']
    ])#, :selected => (@search.nil? ? nil : @search.order.to_s))
  end
  
end
