def consolidate_cart(cart)
  new = {}
  cart.each do |item|
    if new[item.keys[0]]
      new[item.keys[0]][:count] += 1
    else 
      new[item.keys[0]] = {
        count: 1,
        price: item.values[0][:price],
        clearance: item.values[0][:clearance]
      }
    end
  end
  new
end


def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    if cart.keys.include? coupon[:item]
      if cart[coupon[:item]][:count] >= coupon[:num]
        new_key = "#{coupon[:item]} W/COUPON"
        if cart[new_key]
          cart[new_key][:count] += coupon[:num]
        else 
          cart[new_key] = {
            count: coupon[:num],
            price: coupon[:cost]/coupon[:num],
            clearance: cart[coupon[:item]][:clearance]
          }
  end
  cart[coupon[:item]][:count] -= coupon[:num]
end
end  
end
cart 
end 

def apply_clearance(cart)
  cart.each do |item|
    if cart.keys.include? item[:clearance]
      disc_amount = item[:price] * .20
      item[:price] = (item[:price] - disc_amount).round(2)
    end
    cart
end

def checkout(cart, coupons)
  # code here
end




