require "kommando"

k = Kommando.new "ruby e2e/tests/webrick_done.rb", output: true
got_it = false
k.out.once "WEBrick::HTTPServer#start done" do
  got_it = true
end
k.run

raise "webrick done missing" unless got_it

puts ""
puts "OK"
