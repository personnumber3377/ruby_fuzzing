do
    remove_const :Other if defined? ::TestModule::Other
    module Other
      def other
      end