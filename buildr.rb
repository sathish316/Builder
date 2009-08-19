class Buildr
  def initialize
    @level = 0
    @buffer = ""
  end
  
  def method_missing(tag,*args,&block)
    render(tag, block_given?) do
      unless args.empty?
        args.first
      else
        nest do
          block.call        
        end
      end
    end
  end
  
  def nest(&block)
    @level += 1
    @buffer = ""
    output = "\n" + yield
    @level -= 1
    output
  end
  
  def render(tag, indent_closing, &content)
    @buffer += indent + "<#{tag}>"
    @buffer += yield 
    @buffer += indent if indent_closing 
    @buffer += "</#{tag}>\n"
  end
  
  def indent
    "\t" * @level
  end
end
