# frozen_string_literal: true

class CorsPreflightController < ActionController::API
  include EmbedCors

  before_action :set_embed_cors_headers

  def show
    head :ok
  end

  private

  def embed_cors_account
    slug = params[:slug].presence || params[:submit_form_slug].presence || params[:submitter_id].presence

    return super if slug.blank?

    Submitter.find_by(slug: slug)&.account || super
  end
end
