this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'item_services_pb'
require 'list_services_pb'

def main
  begin
    #list_stub = ListService::Stub.new('localhost:50052', :this_channel_is_insecure)
    #list = list_stub.get_lists( List.new(title: "list_title") )
    #p "List: #{ list.title}"

    item_stub = ItemService::Stub.new('localhost:50051', :this_channel_is_insecure)
    item = item_stub.get_items( Item.new(title: "item_title") )
    p "Item: #{ item.title }"
  rescue Exception => e
    p e
  end
end

main
