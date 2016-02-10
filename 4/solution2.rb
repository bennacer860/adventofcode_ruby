require 'digest'


n = 1
no_stop = true
while( no_stop ) do
  md5 = Digest::MD5.new
  hash = md5.hexdigest "ckczppom#{n}".to_s
  puts n 
  n += 1
  no_stop = false if hash[0,6] == "000000"
end
