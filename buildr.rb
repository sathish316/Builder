class Buildr
  
  def method_missing(tag,*args,&block)
    content = args.empty? ? yield : args.first
    render(tag,content) 
  end
  
  def render(tag, content)
    buffer = ""
    buffer += "<#{tag}>"
    buffer += content 
    buffer += "</#{tag}>"
  end
end
