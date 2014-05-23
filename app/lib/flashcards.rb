#flashcards
#dustinmoorman@gmail.com

#this file will use most of the libraries created

autoload :Menu, 'menu/ui/menu'


clui = Clui.new

loop do
  clui.getMenu
  puts clui.messenger.getMessage
  uin = gets.chomp
  case uin
    when '1'
      clui.messenger.push('user chose 1')
    when '2'
      clui.messenger.push('user chose 2')
    when '3'
      clui.messenger.push('user chose 3')
    when '4'
      break
    else
      clui.messenger.push('try again')
  end
end
