class TranslationsController < ApplicationController
  require 'google/cloud/translate/v2'

  def translate
    api_key = ENV['GOOGLE_TRANSLATE_API_KEY']
    text = params[:text]
    source_language = params[:source_language]
    target_language = params[:target_language]

    translate_client = Google::Cloud::Translate::V2.new(key: api_key)
    translation = translate_client.translate(text, from: source_language, to: target_language)

    render json: { text: text, translation: translation.text }
  end

  def index
  end
end

