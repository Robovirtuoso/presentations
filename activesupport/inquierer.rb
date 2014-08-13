Rails.env.production?
#=> 'production'
Rails.env.staging?
Rails.env.foo?

"production".inquiry.staging?

"variant".inquiry.variant?
"variant".inquiry.product?
