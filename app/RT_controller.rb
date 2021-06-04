# router determines which controller to use and controller is responsible for performing the task in request -> fetch or savedata from model -> use views to create HTML o/p

# makes the model data available to the view
# saves or updates user data to the model.

#controller naming convention
# pluralization of the last word in the controller's name

#ruby class -> inherites methods from ApplicationController

# application receives a request, the routing will determine which controller and action to run, then Rails creates an instance of that controller and runs the method with the same name as the action.

# Parameters
# 2 types of parameters -> query string, POST data.
# query string ->  everything after "?" in the URL
# POST data -> only be sent as part of an HTTP POST request

GET "/orders?ids[]1&ids[]2&ids[]7" for ::1 at 2021-05-19 11:24:39 +0530
#  Processing by OrdersController#index as HTML
# Parameters: {"ids"=>[{"1"=>nil, "2"=>nil, "7"=>nil}]}


params = ActionController::Parameters.new(product_categories: {name: "watches"})
=> #<ActionController::Parameters {"product_categories"=>{"name"=>"watches"}} permitted: false>

permitted = params.require(:product_categories).permit(:name)
=> #<ActionController::Parameters {"name"=>"watches"} permitted: true>

> permitted.has_key?(:name)
=> true
> permitted.has_key?(:email)
=> false

params = ActionController::Parameters.new(products: {name: "xyz", product_category_id: 7, price: 2000, tax: 10})
=> #<ActionController::Parameters {"products"=>{"name"=>"xyz", "product_category_id"=>7, "price"=>2000, "tax"=>10}} permitt...

per = params.require(:products).permit(:product_category_id, :name)
=> #<ActionController::Parameters {"product_category_id"=>7, "name"=>"xyz"} permitted: true>
per.has_key?(:price)
=> false
> per.permitted?
=> true
> per.has_key?(:name)
=> true
> per.has_key?(:tax)
=> false

#parameter can be declared as an array of permitted scalars by mapping it to an empty array
p = ActionController::Parameters.new(tags: ["rails", "ruby"])
#  => #<ActionController::Parameters {"tags"=>["rails", "ruby"]} permitted: false>
p.permit(tags: [])
=> #<ActionController::Parameters {"tags"=>["rails", "ruby"]} permitted: true>

p = ActionController::Parameters.new({
2.7.2 :237 >     category: { 
2.7.2 :237 >        name: "Sports",
2.7.2 :238 >        product: [{
2.7.2 :239 >          name: "shoe",
2.7.2 :240 >          quantity: 1
2.7.2 :241 >         }]
2.7.2 :242 >      }
2.7.2 :243 > })
  => #<ActionController::Parameters {"category"=>{"name"=>"Sports", "product"=>[{"name"=>"shoe", "quantity"=>1}]} permitted: false>

  per = p.permit(category: [ :name, { product: :name } ] )
  => #<ActionController::Parameters {"category"=>#<ActionController::Parameters {"name"=>"Sports", "product"=>[#<ActionContro...
 2.7.2 :270 > per[:category][:name]
  => "Sports"

  per.permitted?
 => true

 per[:category][:product][0][:name]
 => "shoe"
> per[:category][:product][0][:quantity]
 => nil

#permit in a key that points to a hash, it won't allow all the hash. You also need to specify which attributes inside the hash should be permitted

params = ActionController::Parameters.new({
       person: {
         contact: {
           email: "none@test.com",
           phone: "555-1234"
         }
       }
     })
   => #<ActionController::Parameters {"person"=>{"contact"=>{"email"=>"none@test.com", "phone"=>"555-1234"}}} permitted: false>
  > params.require(:person).permit()
   => #<ActionController::Parameters {} permitted: true>
  
    > params.require(:person).permit(:contact)
   => #<ActionController::Parameters {} permitted: true>
   > params.require(:person).permit(contact: :phone)
   => #<ActionController::Parameters {"contact"=>#<ActionController::Parameters {"phone"=>"555-1234"} permitted: true>} permitted: true>
   > params.require(:person).permit(contact: [:phone, :email])
   => #<ActionController::Parameters {"contact"=>#<ActionController::Parameters {"phone"=>"555-1234", "email"=>"none@test.com"} permitted: true>} permitted: true>

# permitted?  -> returns true if parameter is permitted

p = ActionController::Parameters.new
 => #<ActionController::Parameters {} permitted: false>
2.7.2 :294 > p.permitted?
 => false
2.7.2 :295 > p.permit
 => #<ActionController::Parameters {} permitted: true>
2.7.2 :296 > p.permitted?
 => false
2.7.2 :297 > p.permit!
 => #<ActionController::Parameters {} permitted: true>
2.7.2 :298 > p.permitted?
 => true

#require 
 > ActionController::Parameters.new(product: {name: "abc"}).require(:product)
 => #<ActionController::Parameters {"name"=>"abc"} permitted: false>

 ActionController::Parameters.new.require(:product)
 ActionController::Parameters.new(product: {}).require(:product)
 ActionController::Parameters.new(product: nil).require(:product)
 ActionController::Parameters.new(product: "\n").require(:product)

 # above 4 lines raises
 # ActionController::ParameterMissing (param is missing or the value is empty: product)

 #Filters -> methods that run 'before', 'after', or 'around' the controller actiion

 #before filters -> before_action