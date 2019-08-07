this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)


require 'grpc'
require 'list_services_pb'

include ListService

class ListServer < ListService::Service

        def get_lists(list_req, _unused_call)
                List.new(title: "wassup")
        end

end

def main
        s = GRPC::RpcServer.new
        s.add_http2_port('0.0.0.0:50052', :this_port_is_insecure)
        s.handle(ListServer)
        s.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])
end

main
