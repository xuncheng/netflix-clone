BULLET_SETTINGS = lambda do
  Bullet.enable = true
  Bullet.alert = ENV["BULLET_ALERTS"]
  Bullet.bullet_logger = true
  Bullet.console = false
  Bullet.rails_logger = true
end
