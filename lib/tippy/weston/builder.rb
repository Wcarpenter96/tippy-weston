module Tippy
    module Weston
        class Builder

            def initialize(total:, gratuity:)
                @total = total
                @gratuity = gratuity
            end

            def generate
                if number_based?
                    return total_accumulator
                end
                string_based
            end

            private

            def total_accumulator(gratuity = @gratuity)
                @total += @total * ( gratuity.to_f / 100)
            end

            def number_based?
                @gratuity.is_a?(Numeric) || (@gratuity.integer?)
            end

            def string_based
                case @gratuity.downcase
                when 'high'
                    total_accumulator(25.0)
                when 'standard'
                    total_accumulator(20.0)
                when 'low'
                    total_accumulator(15.0)
                else
                    total_accumulator(20.0)
                end
            end
        end
    end
end