do
    class << self
      def subseq
        super.instance_eval(& Overlaid)
      end