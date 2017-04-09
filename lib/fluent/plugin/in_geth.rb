#
# Copyright 2017- cicorias
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "fluent/plugin/input"


require 'zlib'
require 'time'
require 'tempfile'

module Fluent
  module Plugin
    class GethInput < Fluent::Plugin::Input
      Fluent::Plugin.register_input("geth", self)

      #helpers :compat_parameters, :parser, :thread
      helpers :thread
      # config_param defines a parameter. You can refer a parameter via @port instance variable
      # :default means this parameter is optional
      #config_param :port, :integer, :default => 8545

      # This method is called before starting.
      # 'conf' is a Hash that includes configuration parameters.
      # If the configuration is invalid, raise Fluent::ConfigError.
      def configure(conf)
        super

        # You can also refer to raw parameter via conf[name].
        #@port = conf['port']
        
      end

      # This method is called when starting.
      # Open sockets or files and create a thread here.
      def start
        super

        geth_client = create_geth_client
        
        @running = true

        #thread_create(:in_s3, &method(:run))

      end

      # This method is called when shutting down.
      # Shutdown the thread and close sockets or files here.
      def shutdown
          @running = false
          
          super
      
      end

      def run
        super
        #foobar
      end


      def emit(record, time)
        tag = "myapp.access"
        #time = Engine.now
        #record = {"message"=>"body"}
        router.emit(tag, time, record)
      end

      private

      
      def setup_client
        options = {}
        options[:port] = @port

      end

      def create_geth_client
        options = setup_client

      end

    end
  end
end


