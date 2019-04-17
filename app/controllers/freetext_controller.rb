

class FreetextController < ApplicationController

	def cloud

		@poll = PollEverywhere::FreeTextPoll.get(params[:id])

		@results = JSON.parse(@poll.results)

		@grouped_results = {}

		@lowest_result = 0
		@highest_result = 0

		@results.each do |result|
			old_value = 0
			unless @grouped_results[result["humanized_value"]].nil?
				old_value = @grouped_results[result["humanized_value"]]
			end
			old_value = old_value + 1
			@grouped_results[result["humanized_value"]] = old_value

			if old_value > @highest_result
				@highest_result = old_value
			end

			if @lowest_result == 0 || old_value < @lowest_result
				@lowest_result = old_value
			end
		end

	end

	def list

		@poll = PollEverywhere::FreeTextPoll.get(params[:id])

		@results = JSON.parse(@poll.results)

		@results = @results.sort_by { |k| -k["id"] }

		# @results.each do |result|
		# 	old_value = 0
		# 	unless @grouped_results[result["humanized_value"]].nil?
		# 		old_value = @grouped_results[result["humanized_value"]]
		# 	end
		# 	old_value = old_value + 1
		# 	@grouped_results[result["humanized_value"]] = old_value

		# 	if old_value > @highest_result
		# 		@highest_result = old_value
		# 	end

		# 	if @lowest_result == 0 || old_value < @lowest_result
		# 		@lowest_result = old_value
		# 	end
		# end

	end

end