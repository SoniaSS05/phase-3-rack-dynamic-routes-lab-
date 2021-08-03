class Application

    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
  
      if req.path=="/testing"
        resp.write "Route not found"
        resp.status = 404
      elsif req.path.match(/items/) 
        item = req.path.split('/')[2]
        item_find = @@items.find {|it| it.name == item}
        if item_find
            resp.status = 200
            resp.write "#{item_find.price}"
        else
            resp.status = 400
            resp.write "Item not found"
        end
       
      end
  
      resp.finish
    end
  end 