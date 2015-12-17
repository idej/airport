15.times do |i|
  Plane.create(name: ([i, '_'] + (0...10).map { ('a'..'z').to_a[rand(26)] }).join)
end
