xml.instruct! :xml, :version => "1.0"

xml.rss "version" => "2.0" do
 xml.channel do

   xml.title       "happymediumv2.herokuapp.com posts"
   xml.link        url_for :only_path => false, :controller => 'posts'
   xml.description "happymediumv2.herokuapp.com posts"

   @rss.each do |post|
     xml.item do
       xml.title       post.title
       xml.pubDate     post.created_at.to_s(:rfc822)
       xml.link        url_for :only_path => false, :controller => 'posts', :action => 'show', :id => post.id
       xml.description post.body
       xml.guid        url_for :only_path => false, :controller => 'posts', :action => 'show', :id => post.id
     end
   end

 end
end