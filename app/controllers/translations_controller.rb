class TranslationsController < ApplicationController
  def translate
    require 'google/cloud/translate'

    api_key = ENV['GOOGLE_TRANSLATE_API_KEY']
    text = params[:text]
    source_language = params[:source_language]
    target_language = params[:target_language]

    translate = Google::Cloud::Translate.new(version: :v2, key: api_key)
    translation = translate.translate(text, from: source_language, to: target_language)

    render json: { text: text, translation: translation.text }
  end
end
