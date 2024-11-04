class ApplicationController < ActionController::Base
  # デコレーターを使って Activestrage にある img 画像を扱えるようにする
  def current_user
    ActiveDecorator::Decorator.instance.decorate(super) if super.present?
    super
  end
end
