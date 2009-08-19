class Buildr
  def initialize
    @level = 0
    @buffer = ""
  end
  
  def method_missing(tag,*args,&block)
    render(tag) do
      unless args.empty?
        args.first 
      else
        @level += 1
        @buffer = ""
        output = yield
        @level -= 1
        output
      end
    end
  end
  
  def render(tag, &content)
    @buffer += "<#{tag}>"
    @buffer += yield 
    @buffer += "</#{tag}>"
  end
end
