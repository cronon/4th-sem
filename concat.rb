require 'redcarpet'
def recursive_traversal directory
  Dir.entries(directory)
    .sort
    .delete_if do |f| 
      ['..','.'].include?(f) or File.fnmatch('**.png',f)
    end
    .map{|f| directory+'/'+f}
    .map do |f|
      if File.file?(f)
        File.open(f).each_line.to_a.join + "\n\n"
      else
        recursive_traversal f
      end
    end
    .join
end
if ARGV.include? 'html'
  require 'redcarpet'
  params = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
  options = Hash[*params.map{|p| [p,true]}.flatten]
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,options)
  puts markdown.render(recursive_traversal './mein')
else
  puts recursive_traversal './mein'
end
