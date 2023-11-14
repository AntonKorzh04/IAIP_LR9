require 'json'

class LuckyNumbersController < ApplicationController
    def input
    end

   def view
      @result = []
      0.upto(params[:numbers_count].to_i) do |i|
          number = ('0' * (6 - i.to_s.length)) + i.to_s
          @result.append(number) if (number[0..2].each_char.map(&:to_i).reduce(:+) == number[3..5].each_char.map(&:to_i).reduce(:+))
      end

      @result_hash = {}
        @result.each_with_index do |number, index|
        @result_hash[index.to_s] = number.to_s
      end
      @result_hash.to_json

      respond_to do |format|
        format.html
        format.json {render json: @result_hash}
      end
   end
end
