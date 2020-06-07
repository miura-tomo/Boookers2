class RelationshipsController < ApplicationController

	def create
		current_user.follow(params[:other_user])
		redirect_back(fallback_location: root_path)
	end

	def destroy
		current_user.unfollow(params[:other_user])
		redirect_back(fallback_location: root_path)
	end

	def follow
		current_user.follow(params[:id])
		redirect_back(fallback_location: root_path)
	end

	def unfollow
		current_user.unfollow(params[:id])
		redirect_back(fallback_location: root_path)
	end

end
