module FlashesHelper
  def user_facing_flashes
    flash.to_hash.slice(%w{ alert error notice success })
  end
end
